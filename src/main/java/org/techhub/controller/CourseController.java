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
import org.techhub.model.Course;
import org.techhub.model.Department;
import org.techhub.service.CourseService;
import org.techhub.service.DepartmentService;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private DepartmentService departmentService;


    // ==============================
    // COURSE LIST
    // ==============================

    @GetMapping("/admin/courses")
    public String courseList(
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        List<Course> courses =
                courseService.getAllCourses();

        model.addAttribute(
                "courses",
                courses
        );

        return "course/list";
    }


    // ==============================
    // SHOW ADD COURSE PAGE
    // ==============================

    @GetMapping("/admin/courses/add")
    public String addCoursePage(
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        List<Department> departments =
                departmentService.getAllDepartments();

        List<Course> courses =
                courseService.getAllCourses();

        model.addAttribute(
                "departments",
                departments
        );

        model.addAttribute(
                "courses",
                courses
        );

        return "course/add";
    }


    // ==============================
    // SAVE COURSE
    // ==============================

    @PostMapping("/admin/courses/add")
    public String addCourse(
            @RequestParam("courseCode") String courseCode,
            @RequestParam("title") String title,
            @RequestParam("credits") int credits,
            @RequestParam("deptId") int deptId,
            @RequestParam("capacity") int capacity,
            @RequestParam("feeAmount") double feeAmount,
            @RequestParam(value = "prerequisiteCourseId", required = false)
                    Integer prerequisiteCourseId,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        Course course =
                new Course();

        course.setCourseCode(courseCode);
        course.setTitle(title);
        course.setCredits(credits);
        course.setDeptId(deptId);
        course.setCapacity(capacity);
        course.setFeeAmount(feeAmount);
        course.setPrerequisiteCourseId(
                prerequisiteCourseId
        );

        courseService.addCourse(course);

        return "redirect:/admin/courses";
    }


    // ==============================
    // SHOW EDIT COURSE PAGE
    // ==============================

    @GetMapping("/admin/courses/edit")
    public String editCoursePage(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        Course course =
                courseService.getCourseById(id);

        List<Department> departments =
                departmentService.getAllDepartments();

        List<Course> courses =
                courseService.getAllCourses();

        model.addAttribute(
                "course",
                course
        );

        model.addAttribute(
                "departments",
                departments
        );

        model.addAttribute(
                "courses",
                courses
        );

        return "course/edit";
    }


    // ==============================
    // UPDATE COURSE
    // ==============================

    @PostMapping("/admin/courses/edit")
    public String updateCourse(
            @RequestParam("id") int id,
            @RequestParam("courseCode") String courseCode,
            @RequestParam("title") String title,
            @RequestParam("credits") int credits,
            @RequestParam("deptId") int deptId,
            @RequestParam("capacity") int capacity,
            @RequestParam("feeAmount") double feeAmount,
            @RequestParam(value = "prerequisiteCourseId", required = false)
                    Integer prerequisiteCourseId,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        Course course =
                new Course();

        course.setId(id);
        course.setCourseCode(courseCode);
        course.setTitle(title);
        course.setCredits(credits);
        course.setDeptId(deptId);
        course.setCapacity(capacity);
        course.setFeeAmount(feeAmount);
        course.setPrerequisiteCourseId(
                prerequisiteCourseId
        );

        courseService.updateCourse(course);

        return "redirect:/admin/courses";
    }


    // ==============================
    // DELETE COURSE
    // ==============================

    @GetMapping("/admin/courses/delete")
    public String deleteCourse(
            @RequestParam("id") int id,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        courseService.deleteCourse(id);

        return "redirect:/admin/courses";
    }
}