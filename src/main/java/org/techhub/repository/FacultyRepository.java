package org.techhub.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.Faculty;

@Repository
public class FacultyRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Faculty getFacultyByEmailAndPassword(
            String email,
            String password) {

        String sql =
                "SELECT f.id, f.name, f.email, f.password, " +
                "f.dept_id, d.dept_name " +
                "FROM faculty f " +
                "JOIN departments d " +
                "ON f.dept_id = d.id " +
                "WHERE f.email = ? AND f.password = ?";

        try {

            return jdbcTemplate.queryForObject(
                    sql,
                    (rs, rowNum) -> {

                        Faculty faculty = new Faculty();

                        faculty.setId(
                                rs.getInt("id")
                        );

                        faculty.setName(
                                rs.getString("name")
                        );

                        faculty.setEmail(
                                rs.getString("email")
                        );

                        faculty.setPassword(
                                rs.getString("password")
                        );

                        faculty.setDeptId(
                                rs.getInt("dept_id")
                        );

                        faculty.setDepartmentName(
                                rs.getString("dept_name")
                        );

                        return faculty;
                    },
                    email,
                    password
            );

        } catch (Exception e) {

            return null;
        }
    }
}