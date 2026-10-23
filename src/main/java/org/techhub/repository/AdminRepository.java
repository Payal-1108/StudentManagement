package org.techhub.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.Admin;

@Repository
public class AdminRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Admin login(String username, String password) {

        String sql =
                "SELECT * FROM admin WHERE username = ? AND password = ?";

        try {

            return jdbcTemplate.queryForObject(
                    sql,
                    (rs, rowNum) -> {

                        Admin admin = new Admin();

                        admin.setId(rs.getInt("id"));
                        admin.setUsername(
                                rs.getString("username")
                        );
                        admin.setPassword(
                                rs.getString("password")
                        );
                        admin.setName(
                                rs.getString("name")
                        );

                        return admin;
                    },
                    username,
                    password
            );

        } catch (Exception e) {

            e.printStackTrace();

            return null;
        }
    }
}