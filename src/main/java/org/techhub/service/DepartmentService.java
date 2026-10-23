package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Department;
import org.techhub.repository.DepartmentRepository;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;


    public List<Department> getAllDepartments() {

        return departmentRepository.getAllDepartments();
    }


    public int addDepartment(
            Department department) {

        return departmentRepository.addDepartment(
                department
        );
    }


    public Department getDepartmentById(int id) {

        return departmentRepository.getDepartmentById(id);
    }


    public int updateDepartment(
            Department department) {

        return departmentRepository.updateDepartment(
                department
        );
    }
 // DELETE DEPARTMENT

    public int deleteDepartment(int id) {

        return departmentRepository.deleteDepartment(id);
    }
}