package com.example.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Orders_out_detail")
public class OrderOutDetailEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "order_id", nullable = false)
    private OrderEntity orderOut;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private ProductEntity product;
    @Column(name = "quantity")
    private int quantity;


    @ManyToOne
    @JoinColumn(name = "customer_id")
    private CustomerEntity customer;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public OrderEntity getOrderOut() {
        return orderOut;
    }

    public void setOrderOut(OrderEntity orderOut) {
        this.orderOut = orderOut;
    }

    public ProductEntity getProduct() {
        return product;
    }

    public void setProduct(ProductEntity product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

}
