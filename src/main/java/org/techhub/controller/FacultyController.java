package org.techhub.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.Faculty;
import org.techhub.model.FacultyCourse;
import org.techhub.model.StudentRoster;
import org.techhub.model.Department;

import org.techhub.repository.DepartmentRepository;

import org.techhub.service.FacultyService;
import org.techhub.service.FacultyCourseService;
import org.techhub.service.FacultyRegistrationService;
import org.techhub.service.StudentRosterService;

@Controller
public class FacultyController {

    @Autowired
    private FacultyService facultyService;

    @Autowired
    private FacultyCourseService facultyCourseService;

    @Autowired
    private FacultyRegistrationService facultyRegistrationService;

    @Autowired
    private StudentRosterService studentRosterService;

    // =========================
    // DEPARTMENT REPOSITORY
    // =========================

    @Autowired
    private DepartmentRepository departmentRepository;


    // =========================
    // FACULTY LOGIN PAGE
    // =========================

    @GetMapping("/faculty/login")
    public String loginPage() {

        return "faculty/login";
    }


    // =========================
    // FACULTY LOGIN
    // =========================

    @PostMapping("/faculty/login")
    public String login(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        try {

            Faculty faculty =
                    facultyService.login(
                            email,
                            password
                    );

            if (faculty != null) {

                session.setAttribute(
                        "faculty",
                        faculty
                );

                return "redirect:/faculty/dashboard";
            }

            model.addAttribute(
                    "error",
                    "Invalid email or password."
            );

            return "faculty/login";

        } catch (Exception e) {

            model.addAttribute(
                    "error",
                    "Invalid email or password."
            );

            return "faculty/login";
        }
    }


    // =========================
    // FACULTY REGISTRATION PAGE
    // =========================

    @GetMapping("/faculty/register")
    public String registerPage(Model model) {

        model.addAttribute("faculty", new Faculty());

        List<Department> departments =
                departmentRepository.getAllDepartments();

        model.addAttribute("departments", departments);

        return "faculty/register";
    }


    // =========================
    // FACULTY REGISTRATION
    // =========================

    @PostMapping("/faculty/register")
    public String registerFaculty(
            @ModelAttribute("faculty") Faculty faculty,
            Model model) {

        try {

            facultyRegistrationService
                    .registerFaculty(faculty);

            return "redirect:/faculty/login";

        } catch (Exception e) {

            model.addAttribute(
                    "error",
                    "Email already exists or registration failed."
            );

            // Load departments again if registration fails
            List<Department> departments =
                    departmentRepository.getAllDepartments();

            model.addAttribute(
                    "departments",
                    departments
            );

            return "faculty/register";
        }
    }


    // =========================
    // FACULTY DASHBOARD
    // =========================

    @GetMapping("/faculty/dashboard")
    public String dashboard(
            HttpSession session,
            Model model) {

        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        if (faculty == null) {

            return "redirect:/faculty/login";
        }

        model.addAttribute(
                "faculty",
                faculty
        );

        return "faculty/dashboard";
    }


    // =========================
    // ASSIGNED COURSES
    // =========================

    @GetMapping("/faculty/courses")
    public String assignedCourses(
            HttpSession session,
            Model model) {

        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        if (faculty == null) {

            return "redirect:/faculty/login";
        }

        List<FacultyCourse> courses =
                facultyCourseService
                        .getAssignedCourses(
                                faculty.getId()
                        );

        model.addAttribute(
                "courses",
                courses
        );

        return "faculty/courses";
    }


    // =========================
    // STUDENT ROSTER
    // =========================

    @GetMapping("/faculty/roster")
    public String studentRoster(
            @RequestParam(
                    value = "courseId",
                    required = false
            ) Integer courseId,
            HttpSession session,
            Model model) {

        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        if (faculty == null) {

            return "redirect:/faculty/login";
        }


        // Get faculty's assigned courses

        List<FacultyCourse> courses =
                facultyCourseService
                        .getAssignedCourses(
                                faculty.getId()
                        );

        model.addAttribute(
                "courses",
                courses
        );


        // If a course is selected,
        // get its student roster

        if (courseId != null) {

            List<StudentRoster> roster =
                    studentRosterService
                            .getRosterByCourse(
                                    courseId
                            );

            model.addAttribute(
                    "roster",
                    roster
            );

            model.addAttribute(
                    "courseId",
                    courseId
            );
        }


        return "faculty/roster";
    }


    // =========================
    // DOWNLOAD STUDENT LIST
    // CSV FILE
    // =========================

    @GetMapping("/faculty/roster/download")
    public void downloadStudentList(
            @RequestParam("courseId") int courseId,
            HttpSession session,
            HttpServletResponse response)
            throws IOException {

        Faculty faculty =
                (Faculty) session.getAttribute("faculty");

        if (faculty == null) {

            response.sendRedirect(
                    session.getServletContext()
                            .getContextPath()
                            + "/faculty/login"
            );

            return;
        }


        List<StudentRoster> roster =
                studentRosterService
                        .getRosterByCourse(
                                courseId
                        );


        response.setContentType(
                "text/csv"
        );

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=student_roster.csv"
        );


        PrintWriter writer =
                response.getWriter();


        // CSV Header

        writer.println(
                "Roll Number,Student Name,Email,Course,Semester,Status"
        );


        // Student Data

        for (StudentRoster student : roster) {

            writer.println(
                    "\"" + student.getRollNumber() + "\","
                    + "\"" + student.getStudentName() + "\","
                    + "\"" + student.getEmail() + "\","
                    + "\""
                    + student.getCourseCode()
                    + " - "
                    + student.getCourseTitle()
                    + "\","
                    + "\""
                    + student.getSemester()
                    + "\","
                    + "\""
                    + student.getEnrollmentStatus()
                    + "\""
            );
        }


        writer.flush();
        writer.close();
    }


    // =========================
    // FACULTY LOGOUT
    // =========================

    @GetMapping("/faculty/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}