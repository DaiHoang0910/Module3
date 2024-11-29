package com.example.calculator.model;

import java.time.LocalDate;

public class Product {
    private int id;
    private String name;
    private LocalDate date;
    private String address;
    private String img;

    public Product() {
    }

    public Product(int id, String name, LocalDate date, String address, String img) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.address = address;
        this.img = img;
    }

    public Product(String name, LocalDate date, String address, String img) {
        this.name = name;
        this.date = date;
        this.address = address;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

}
