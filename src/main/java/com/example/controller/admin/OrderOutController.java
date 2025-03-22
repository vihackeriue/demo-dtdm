package com.example.controller.admin;

import com.example.entity.*;
import com.example.service.*;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;


@Controller
@RequestMapping("/manage/order-out")
public class OrderOutController {
    @Autowired
    private IOrderOutDetailService iOrderDetailService;
    @Autowired
    private IProductService iProductService;
    @Autowired
    private IOrderService iOrderService;
    @Autowired
    private IUserService iUserService;
    @Autowired
    private ICategoryService iCategoryService;
    @Autowired
    private IVoucherService iVoucherService;
    @Autowired
    private  ICustomerService customerService;

    @GetMapping("/new")
    public String orders(Model model) {
        model.addAttribute("vouchers", iVoucherService.getAllVouchers());
        model.addAttribute("category",iCategoryService.getAllCategories());
        model.addAttribute("products", iProductService.getAllProducts());
        model.addAttribute("customers", customerService.getAllCustomers());
        return "admin/order_out_product";
    }


    @GetMapping("/list")
    public String listOrder(Model model){
        List<OrderEntity> orders = iOrderService.getOrdersByOrderType(0);
        Map<Long, List<OrderOutDetailEntity>> ordersGroupedByOrderId = new HashMap<>();
        List<OrderOutDetailEntity> ordersOut = iOrderDetailService.getAllOrderDetail();
        for (OrderOutDetailEntity orderOut : ordersOut) {
            ordersGroupedByOrderId
                    .computeIfAbsent(orderOut.getOrderOut().getOrderId(), k -> new ArrayList<>())
                    .add(orderOut);
        }

        model.addAttribute("orders", orders);
        model.addAttribute("ordersGroupedByOrderId", ordersGroupedByOrderId);
        return "admin/order_out_list";
    }

    @PostMapping("/save-order")
    public String save(@ModelAttribute("order") OrderEntity order,
                       @RequestParam("username") String username,
                       @RequestParam("productId") List<Long> productIds,
                       @RequestParam("quantity") List<Integer> quantities,
                       @RequestParam("customerId") Long customerId
    ) {

        try {
            if (order.getOrderId() == null) {
                order.setOrderDate(LocalDateTime.now());
            } else {
                if (order.getOrderDate() == null) {
                    OrderEntity orderdate = iOrderService.getOrderById(order.getOrderId());
                    order.setOrderDate(orderdate.getOrderDate());
                }
            }
            order.setOrderType(0);
            UserEntity user = iUserService.findByUsername(username);
            if (user == null) {
                throw new RuntimeException("User not found with email: " + username);
            }


            order.setUser(user);
            if (order.getOrderId() != null) {
                List<OrderOutDetailEntity> details = iOrderDetailService.getAllOrderDetail();
                for (OrderOutDetailEntity detail : details) {
                    if (Objects.equals(detail.getOrderOut().getOrderId(), order.getOrderId())) {
                        iOrderDetailService.deleteOrderDetail(detail.getId());
                    }
                }
            }
            iOrderService.saveOrder(order);

            for (int i = 0; i < productIds.size(); i++) {
                Long productId = productIds.get(i);
                Integer quantity = quantities.get(i);
                ProductEntity productEntity = iProductService.getProductById(productId);
                if (productEntity == null) {
                    throw new RuntimeException("Product not found with id: " + productId);
                }
                OrderOutDetailEntity detail = new OrderOutDetailEntity();
                detail.setProduct(productEntity);
                detail.setOrderOut(order);
                detail.setQuantity(quantity);
                if(customerId != null){
                    CustomerEntity customer = customerService.getCustomerById(customerId);
                    detail.setCustomer(customer);
                }
                iOrderDetailService.saveOrderDetail(detail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/manage/order-out/list";
    }

    @GetMapping("/edit/{id}")
    public String editOrder(@PathVariable("id") Long id, Model model) {

        List<OrderOutDetailEntity> details = iOrderDetailService.getAllOrderDetail();
        List<OrderOutDetailEntity> orderOutDetails = new ArrayList<>();
        for (OrderOutDetailEntity orderOutDetailEntity : details) {
            if (Objects.equals(orderOutDetailEntity.getOrderOut().getOrderId(), id)) {
                orderOutDetails.add(orderOutDetailEntity);
            }
        }
        model.addAttribute("customers", customerService.getAllCustomers());
        model.addAttribute("vouchers", iVoucherService.getAllVouchers());
        model.addAttribute("products", iProductService.getAllProducts());
        model.addAttribute("category",iCategoryService.getAllCategories());
        model.addAttribute("orderOutDeEdits", orderOutDetails);
        model.addAttribute("orderEdits", iOrderService.getOrderById(id));
        return "admin/order_out_product";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        // Xóa tất cả các OrderOutDetailEntity liên quan đến OrderEntity có id = id
        List<OrderOutDetailEntity> details =  iOrderDetailService.getAllOrderDetail();
        for (OrderOutDetailEntity detail : details) {
            if(Objects.equals(detail.getOrderOut().getOrderId(), id)) {
                iOrderDetailService.deleteOrderDetail(detail.getId());
            }
        }
        // Xóa OrderEntity sau khi đã xóa các chi tiết liên quan
        iOrderService.deleteOrder(id);
        return "redirect:/manage/order-out/list";
    }

//       @GetMapping("/showId/{orderIdShow}")
//        public String showId( Model model, @PathVariable("orderIdShow") Long orderIdShow){
//            List<OrderOutDetailEntity> orderOutDetailEntities = iOrderDetailService.getAllOrderDetail();
//            List<OrderOutDetailEntity> orderOutList = new ArrayList<>();
//            for (OrderOutDetailEntity orderDetail : orderOutDetailEntities){
//                if (Objects.equals(orderDetail.getOrderOut().getOrderId(),orderIdShow)){
//                    orderOutList.add(orderDetail);
//                }
//            }
//            model.addAttribute("orderShowId", iOrderService.getOrderById(orderIdShow));
//            model.addAttribute("orderOutDetailShowId", orderOutList);
//            return "admin/order_out/sales-invoice";
//       }

}
