package org.techhub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class DashboardService {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    public int getTotalStudents() {

        return getCount("students");
    }


    public int getTotalDepartments() {

        return getCount("departments");
    }


    public int getTotalCourses() {

        return getCount("courses");
    }


    public int getTotalEnrollments() {

        return getCount("course_enrollments");
    }


    private int getCount(String tableName) {

        try {

            String sql =
                    "SELECT COUNT(*) FROM " + tableName;

            return jdbcTemplate.queryForObject(
                    sql,
                    Integer.class
            );

        } catch (Exception e) {

            e.printStackTrace();

            return 0;
        }
    }
}