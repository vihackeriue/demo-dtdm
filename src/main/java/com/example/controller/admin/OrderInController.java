package com.example.controller.admin;

import com.example.entity.MaterialEntity;
import com.example.entity.OrderEntity;
import com.example.entity.OrderInDetailEntity;
import com.example.service.impl.MaterialServiceImp;
import com.example.service.impl.OrderInServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/manage/order-in")
public class OrderInController {
    @Autowired
    private OrderInServiceImp orderInServiceImp;
    @Autowired
    private MaterialServiceImp materialServiceImp;

    @GetMapping("/list")
    public String listOrder(Model model){
        List<OrderEntity> orders = orderInServiceImp.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order_in_list";
    }

    @GetMapping("/new")
    public String newOrder(Model model){
        List<MaterialEntity> materials = materialServiceImp.getAllMaterials();
        model.addAttribute("materials", materials);
        model.addAttribute("orderEntity", new OrderEntity());
        return "/admin/order_in_form";
    }

    @PostMapping("/new")
    public String newOrder(@ModelAttribute("orderEntity") OrderEntity order) {
        orderInServiceImp.saveOrderIn(order);
        return "redirect:/manage/order-in/list";
    }

    @PostMapping("/delete/{id}")
    public String deleteOrder(@PathVariable("id") Long id){
        orderInServiceImp.deleteOrderById(id);
        return "redirect:/manage/order-in/list";
    }

    @GetMapping("/{id}")
    public String listOrderDetail(Model model, @PathVariable(name = "id") Long id){
        OrderEntity order = orderInServiceImp.getOrderById(id);
        model.addAttribute("order", order);

        return "admin/order_in_detail";

    }

    @PostMapping("/{id}/update-date")
    public String updateOrderDate(Model model,
                                  @PathVariable(name = "id") Long id,
                                  @RequestParam(name = "orderDate") String orderDate){
        LocalDateTime date = LocalDateTime.parse(orderDate);
        OrderEntity order = orderInServiceImp.getOrderById(id);
        order.setOrderDate(date);
        orderInServiceImp.SaveOrder(order);
        return "redirect:/manage/order-in/" + id;
    }


    @GetMapping("/{id}/new")
    public String newOrderInDetail(Model model, @PathVariable(name = "id") Long id){
        List<MaterialEntity> materials = materialServiceImp.getAllMaterials();

        model.addAttribute("materials", materials);
        model.addAttribute("orderId", id);

        return "/admin/order_in_detail_form";
    }

    @PostMapping("/{id}/new")
    public String newOrderInDetail(@RequestParam("material")Long materialId,
                                   @RequestParam("quantity")int quantity,
                                   @RequestParam("price")float price,
                                   @PathVariable("id") Long id){
        MaterialEntity material = materialServiceImp.getMaterialById(materialId);
        OrderEntity order = orderInServiceImp.getOrderById(id);
        OrderInDetailEntity orderInDetail = new OrderInDetailEntity();
        orderInDetail.setOrderIn(order);
        orderInDetail.setMaterial(material);
        orderInDetail.setQuantity(quantity);
        orderInDetail.setPrice(price);

        orderInServiceImp.saveOrderDetail(orderInDetail);
        orderInServiceImp.updateOrderTotal(order);

        return "redirect:/manage/order-in/" + id;
    }

    @GetMapping("/{id}/edit/{did}")
    public String editOrderInDetail(@PathVariable(name = "did") Long did,
                                    @PathVariable(name = "id") Long id,
                                    Model model){
        OrderInDetailEntity orderin =  orderInServiceImp.getOrderDetailById(did);

        model.addAttribute("orderin", orderin);
        model.addAttribute("orderId", id);
        model.addAttribute("materials", materialServiceImp.getAllMaterials());

        return "/admin/order_in_detail_update";
    }

    @PostMapping("/{id}/edit")
    public String editOrderInDetail(@RequestParam("material")Long materialId,
                                    @RequestParam("quantity")int quantity,
                                    @RequestParam("price")float price,
                                    @RequestParam("did")long did,
                                    @PathVariable("id") Long id){
        OrderEntity order = orderInServiceImp.getOrderById(id);
        OrderInDetailEntity orderInDetail = new OrderInDetailEntity();
        orderInDetail.setOrderIn(order);
        orderInDetail.setMaterial(materialServiceImp.getMaterialById(materialId));
        orderInDetail.setQuantity(quantity);
        orderInDetail.setPrice(price);
        orderInDetail.setId(did);

        orderInServiceImp.saveOrderDetail(orderInDetail);
        orderInServiceImp.updateOrderTotal(order);

        return "redirect:/manage/order-in/" + id;
    }

    @PostMapping("/{oid}/delete/{oiid}")
    public String deleteOrderInDetail(@PathVariable("oid") Long oid,
                                      @PathVariable("oiid") Long oiid){
        orderInServiceImp.deleteOrderDetailById(oiid);

        return "redirect:/manage/order-in/" + oid;
    }

}
