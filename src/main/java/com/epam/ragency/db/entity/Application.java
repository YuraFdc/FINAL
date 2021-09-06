package com.epam.ragency.db.entity;

import java.io.Serializable;
import java.util.Date;

public class Application implements Serializable {
    private int id;
    private Date creationDate;
    private int userId;
    private String description;
    private int masterId;
    private float price;
    private int statusId;
    private String response;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
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
