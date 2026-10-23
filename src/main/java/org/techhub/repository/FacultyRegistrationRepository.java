package org.techhub.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.Faculty;

@Repository
public class FacultyRegistrationRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int registerFaculty(Faculty faculty) {

        String sql =
                "INSERT INTO faculty " +
                "(name, email, password, dept_id) " +
                "VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                faculty.getName(),
                faculty.getEmail(),
                faculty.getPassword(),
                faculty.getDeptId()
        );
    }
}