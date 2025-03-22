package com.example.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "order_in_detail")
public class OrderInDetailEntity extends BaseEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private OrderEntity orderIn;

    @ManyToOne
    @JoinColumn(name = "material_id", nullable = false)
    private MaterialEntity material;
    @Column(name = "quantity")
    private int quantity;
    @Column(name = "price")
    private float price;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public OrderEntity getOrderIn() {
        return orderIn;
    }

    public void setOrderIn(OrderEntity orderIn) {
        this.orderIn = orderIn;
    }

    public MaterialEntity getMaterial() {
        return material;
    }

    public void setMaterial(MaterialEntity material) {
        this.material = material;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderInDetailEntity{" +
                "id=" + id +
                ", orderIn=" + orderIn +
                ", material=" + material +
                ", quantity=" + quantity +
                ", price=" + price +
                '}';
    }
}
