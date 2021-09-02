package com.epam.ragency.db.entity;

import java.io.Serializable;

public class Application implements Serializable {
    private int id;
    private int userId;
    private int masterId;
    private float price;
    private int statusId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMasterId() {
        return masterId;
    }

    public void setMasterId(int masterId) {
        this.masterId = masterId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Override
    public String toString() {
        return "Application:" + System.lineSeparator() +
                "\tuserId = " + userId + System.lineSeparator() +
                "\tmasterId = " + masterId + System.lineSeparator() +
                "\tprice = " + price + System.lineSeparator() +
                "\tstatusId=" + statusId;
    }
}
