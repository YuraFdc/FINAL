package com.epam.ragency.db;

import com.epam.ragency.db.entity.User;

public enum Role {
    MANAGER,
    MASTER,
    CLIENT;

    public static Role getRole(User user) {
        int roleId = user.getRole();
        return Role.values()[roleId];
    }

    public String getName() {
        return name().toLowerCase();
    }
}
