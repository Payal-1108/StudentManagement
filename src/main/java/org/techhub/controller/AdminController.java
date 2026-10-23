package org.techhub.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.Admin;
import org.techhub.service.AdminEnrollmentService;
import org.techhub.service.AdminPaymentService;
import org.techhub.service.AdminService;
import org.techhub.service.DashboardService;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private DashboardService dashboardService;

    @Autowired
    private AdminEnrollmentService adminEnrollmentService;

    @Autowired
    private AdminPaymentService adminPaymentService;


    // =========================================================
    // ADMIN LOGIN
    // =========================================================

    @GetMapping("/admin/login")
    public String loginPage() {

        return "login";
    }


    // Login process
    @PostMapping("/admin/login")
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        Admin admin =
                adminService.login(username, password);

        if (admin != null) {

            session.setAttribute("admin", admin);

            return "redirect:/admin/dashboard";
        }

        model.addAttribute(
                "error",
                "Invalid username or password"
        );

        return "login";
    }


    // =========================================================
    // ADMIN DASHBOARD
    // =========================================================

    @GetMapping("/admin/dashboard")
    public String dashboard(
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        model.addAttribute(
                "totalStudents",
                dashboardService.getTotalStudents()
        );

        model.addAttribute(
                "totalDepartments",
                dashboardService.getTotalDepartments()
        );

        model.addAttribute(
                "totalCourses",
                dashboardService.getTotalCourses()
        );

        model.addAttribute(
                "totalEnrollments",
                dashboardService.getTotalEnrollments()
        );

        return "dashboard";
    }


    // =========================================================
    // ENROLLMENT MANAGEMENT
    // =========================================================

    @GetMapping("/admin/enrollments")
    public String enrollments(
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        model.addAttribute(
                "enrollments",
                adminEnrollmentService.getAllEnrollments()
        );

        return "admin-enrollments";
    }


    // Approve Enrollment
    @GetMapping("/admin/enrollments/approve")
    public String approveEnrollment(
            @RequestParam("id") int enrollmentId,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        adminEnrollmentService
                .approveEnrollment(enrollmentId);

        return "redirect:/admin/enrollments";
    }


    // Drop Enrollment
    @GetMapping("/admin/enrollments/drop")
    public String dropEnrollment(
            @RequestParam("id") int enrollmentId,
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        adminEnrollmentService
                .dropEnrollment(enrollmentId);

        return "redirect:/admin/enrollments";
    }


    // =========================================================
    // ADMIN PAYMENT MANAGEMENT
    // =========================================================

    @GetMapping("/admin/payments")
    public String payments(
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        model.addAttribute(
                "payments",
                adminPaymentService.getAllPayments()
        );

        return "admin-payments";
    }


    // =========================================================
    // ADMIN LOGOUT
    // =========================================================

    @GetMapping("/admin/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    @GetMapping("/admin/receipt")
    public String viewReceipt(
            @RequestParam("receiptNumber") String receiptNumber,
            HttpSession session,
            Model model) {

        Admin admin = (Admin) session.getAttribute("admin");

        if (admin == null) {
            return "redirect:/admin/login";
        }

        var payments = adminPaymentService.getAllPayments();

        var selectedPayment = payments.stream()
                .filter(payment ->
                        receiptNumber.equals(payment.getReceiptNumber()))
                .findFirst()
                .orElse(null);

        if (selectedPayment == null) {
            return "redirect:/admin/payments";
        }

        model.addAttribute("payment", selectedPayment);

        return "student/receipt";
    }
}