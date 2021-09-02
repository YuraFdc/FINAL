package com.epam.ragency.db;

public enum Status {
    AWAITING_PAYMENT,
    PAID,
    IN_WORK,
    CANCELED,
    COMPLETE

    /*public static Status getStatus(Application application) {
        int statusId = application.getStatusId();
        return Status.values()[statusId];
    }*/
}
