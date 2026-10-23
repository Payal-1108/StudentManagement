package org.techhub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import org.techhub.model.Faculty;
import org.techhub.model.FacultyCourse;
import org.techhub.service.FacultyAssignmentService;

@Controller
public class FacultyAssignmentController {

    @Autowired
    private FacultyAssignmentService facultyAssignmentService;


    // =========================
    // FACULTY ASSIGNMENT PAGE
    // =========================

    @GetMapping("/admin/faculty-assignment")
    public String assignmentPage(
            HttpSession session,
            Model model) {

        // Check admin login

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }


        List<Faculty> facultyList =
                facultyAssignmentService
                        .getAllFaculty();

        List<FacultyCourse> courseList =
                facultyAssignmentService
                        .getAllCourses();


        model.addAttribute(
                "facultyList",
                facultyList
        );

        model.addAttribute(
                "courseList",
                courseList
        );


        return "admin/faculty-assignment";
    }


    // =========================
    // ASSIGN COURSE
    // =========================

    @PostMapping("/admin/faculty-assignment")
    public String assignCourse(
            @RequestParam("facultyId") int facultyId,
            @RequestParam("courseId") int courseId,
            @RequestParam("semester") String semester,
            HttpSession session) {

        // Check admin login

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }


        facultyAssignmentService.assignCourse(
                facultyId,
                courseId,
                semester
        );


        return "redirect:/admin/faculty-assignment?success=true";
    }
}