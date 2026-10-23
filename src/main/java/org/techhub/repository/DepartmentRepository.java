package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.Department;

@Repository
public class DepartmentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // GET ALL DEPARTMENTS

    public List<Department> getAllDepartments() {

        String sql = "SELECT * FROM departments";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Department department =
                            new Department();

                    department.setId(
                            rs.getInt("id")
                    );

                    department.setDeptName(
                            rs.getString("dept_name")
                    );

                    department.setDeptCode(
                            rs.getString("dept_code")
                    );

                    return department;
                }
        );
    }


    // GET DEPARTMENT BY ID

    public Department getDepartmentById(int id) {

        String sql =
                "SELECT * FROM departments WHERE id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                (rs, rowNum) -> {

                    Department department =
                            new Department();

                    department.setId(
                            rs.getInt("id")
                    );

                    department.setDeptName(
                            rs.getString("dept_name")
                    );

                    department.setDeptCode(
                            rs.getString("dept_code")
                    );

                    return department;
                },
                id
        );
    }


    // ADD DEPARTMENT

    public int addDepartment(
            Department department) {

        String sql =
                "INSERT INTO departments " +
                "(dept_name, dept_code) " +
                "VALUES (?, ?)";

        return jdbcTemplate.update(
                sql,
                department.getDeptName(),
                department.getDeptCode()
        );
    }


    // UPDATE DEPARTMENT

    public int updateDepartment(
            Department department) {

        String sql =
                "UPDATE departments " +
                "SET dept_name = ?, dept_code = ? " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                department.getDeptName(),
                department.getDeptCode(),
                department.getId()
        );
    }


    // DELETE DEPARTMENT

    public int deleteDepartment(int id) {

        String sql =
                "DELETE FROM departments WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                id
        );
    }
}