package org.techhub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import org.techhub.model.Admin;
import org.techhub.model.Department;
import org.techhub.service.DepartmentService;

@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;


    // ==============================
    // DEPARTMENT LIST
    // ==============================

    @GetMapping("/admin/departments")
    public String departmentList(
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute(
                "departments",
                departments
        );

        return "department/list";
    }


    // ==============================
    // SHOW ADD DEPARTMENT PAGE
    // ==============================

    @GetMapping("/admin/departments/add")
    public String addDepartmentPage(
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        return "department/add";
    }


    // ==============================
    // SAVE DEPARTMENT
    // ==============================

    @PostMapping("/admin/departments/add")
    public String addDepartment(
            @RequestParam("deptName") String deptName,
            @RequestParam("deptCode") String deptCode,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        Department department =
                new Department();

        department.setDeptName(deptName);
        department.setDeptCode(deptCode);

        departmentService.addDepartment(
                department
        );

        return "redirect:/admin/departments";
    }


    // ==============================
    // SHOW EDIT DEPARTMENT PAGE
    // ==============================

    @GetMapping("/admin/departments/edit")
    public String editDepartmentPage(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        Department department =
                departmentService.getDepartmentById(id);

        model.addAttribute(
                "department",
                department
        );

        return "department/edit";
    }


    // ==============================
    // UPDATE DEPARTMENT
    // ==============================

    @PostMapping("/admin/departments/edit")
    public String updateDepartment(
            @RequestParam("id") int id,
            @RequestParam("deptName") String deptName,
            @RequestParam("deptCode") String deptCode,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        Department department =
                new Department();

        department.setId(id);
        department.setDeptName(deptName);
        department.setDeptCode(deptCode);

        departmentService.updateDepartment(
                department
        );

        return "redirect:/admin/departments";
    }
 // ==============================
 // DELETE DEPARTMENT
 // ==============================

 @GetMapping("/admin/departments/delete")
 public String deleteDepartment(
         @RequestParam("id") int id,
         HttpSession session) {

     Admin admin =
             (Admin) session.getAttribute("admin");

     if (admin == null) {
         return "redirect:/admin/login";
     }

     departmentService.deleteDepartment(id);

     return "redirect:/admin/departments";
 }
}