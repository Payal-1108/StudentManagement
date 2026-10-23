package org.techhub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import org.techhub.model.Course;
import org.techhub.model.CourseEnrollment;
import org.techhub.model.Department;
import org.techhub.model.EnrollmentCartItem;
import org.techhub.model.FeePayment;
import org.techhub.model.Student;

import org.techhub.service.CourseEnrollmentService;
import org.techhub.service.CourseService;
import org.techhub.service.DepartmentService;
import org.techhub.service.EnrollmentCartService;
import org.techhub.service.FeePaymentService;
import org.techhub.service.StudentService;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private CourseEnrollmentService courseEnrollmentService;

    @Autowired
    private FeePaymentService feePaymentService;

    @Autowired
    private EnrollmentCartService enrollmentCartService;


    // =========================================================
    // STUDENT REGISTRATION
    // =========================================================

    @GetMapping("/student/register")
    public String registerPage(Model model) {

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute(
                "departments",
                departments
        );

        return "student/register";
    }


    @PostMapping("/student/register")
    public String registerStudent(
            @RequestParam("rollNumber") String rollNumber,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("deptId") int deptId,
            @RequestParam("currentSemester") int currentSemester,
            @RequestParam("password") String password,
            Model model) {

        Student student =
                new Student();

        student.setRollNumber(rollNumber);
        student.setName(name);
        student.setEmail(email);
        student.setDeptId(deptId);
        student.setCurrentSemester(currentSemester);
        student.setPassword(password);

        try {

            studentService.addStudent(student);

            return "redirect:/student/login";

        } catch (Exception e) {

            List<Department> departments =
                    departmentService.getAllDepartments();

            model.addAttribute(
                    "departments",
                    departments
            );

            model.addAttribute(
                    "error",
                    "Roll number or email already exists."
            );

            return "student/register";
        }
    }


    // =========================================================
    // STUDENT LOGIN
    // =========================================================

    @GetMapping("/student/login")
    public String loginPage() {

        return "student/login";
    }


    @PostMapping("/student/login")
    public String login(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        Student student =
                studentService.login(
                        email,
                        password
                );

        if (student != null) {

            session.setAttribute(
                    "student",
                    student
            );

            return "redirect:/student/dashboard";
        }

        model.addAttribute(
                "error",
                "Invalid email or password."
        );

        return "student/login";
    }


    // =========================================================
    // STUDENT DASHBOARD
    // =========================================================

    @GetMapping("/student/dashboard")
    public String dashboard(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        model.addAttribute(
                "student",
                student
        );

        return "student/dashboard";
    }


    // =========================================================
    // STUDENT PROFILE
    // =========================================================

    @GetMapping("/student/profile")
    public String profile(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        Student latestStudent =
                studentService.getStudentById(
                        student.getId()
                );

        model.addAttribute(
                "student",
                latestStudent
        );

        return "student/profile";
    }


    // =========================================================
    // EDIT PROFILE
    // =========================================================

    @GetMapping("/student/profile/edit")
    public String editProfile(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        Student latestStudent =
                studentService.getStudentById(
                        student.getId()
                );

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute(
                "student",
                latestStudent
        );

        model.addAttribute(
                "departments",
                departments
        );

        return "student/edit-profile";
    }


    @PostMapping("/student/profile/edit")
    public String updateProfile(
            @RequestParam("id") int id,
            @RequestParam("rollNumber") String rollNumber,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("deptId") int deptId,
            @RequestParam("currentSemester") int currentSemester,
            @RequestParam("password") String password,
            HttpSession session) {

        Student loggedStudent =
                (Student) session.getAttribute("student");

        if (loggedStudent == null) {

            return "redirect:/student/login";
        }

        Student student =
                new Student();

        student.setId(id);
        student.setRollNumber(rollNumber);
        student.setName(name);
        student.setEmail(email);
        student.setDeptId(deptId);
        student.setCurrentSemester(currentSemester);
        student.setPassword(password);

        studentService.updateStudent(student);

        Student updatedStudent =
                studentService.getStudentById(id);

        session.setAttribute(
                "student",
                updatedStudent
        );

        return "redirect:/student/profile";
    }


    // =========================================================
    // AVAILABLE COURSES
    // =========================================================

    @GetMapping("/student/courses")
    public String availableCourses(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        List<Course> courses =
                courseService.getAvailableCourses();

        model.addAttribute(
                "courses",
                courses
        );

        model.addAttribute(
                "student",
                student
        );

        return "student/courses";
    }


    // =========================================================
    // DIRECT ENROLLMENT
    // EXISTING FUNCTIONALITY
    // =========================================================

    @GetMapping("/student/enroll")
    public String enrollCourse(
            @RequestParam("courseId") int courseId,
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        Course course =
                courseService.getCourseById(courseId);

        if (course == null) {

            return "redirect:/student/courses";
        }

        if (courseEnrollmentService.isAlreadyEnrolled(
                student.getId(),
                courseId)) {

            List<Course> courses =
                    courseService.getAvailableCourses();

            model.addAttribute(
                    "courses",
                    courses
            );

            model.addAttribute(
                    "student",
                    student
            );

            model.addAttribute(
                    "error",
                    "You are already enrolled in this course."
            );

            return "student/courses";
        }

        boolean prerequisiteSatisfied =
                courseEnrollmentService
                        .hasCompletedPrerequisite(
                                student.getId(),
                                courseId
                        );

        if (!prerequisiteSatisfied) {

            List<Course> courses =
                    courseService.getAvailableCourses();

            model.addAttribute(
                    "courses",
                    courses
            );

            model.addAttribute(
                    "student",
                    student
            );

            model.addAttribute(
                    "error",
                    "You must complete the prerequisite course before enrolling."
            );

            return "student/courses";
        }

        if (course.getAvailableSeats() <= 0) {

            List<Course> courses =
                    courseService.getAvailableCourses();

            model.addAttribute(
                    "courses",
                    courses
            );

            model.addAttribute(
                    "student",
                    student
            );

            model.addAttribute(
                    "error",
                    "This course is full. No seats are available."
            );

            return "student/courses";
        }

        CourseEnrollment enrollment =
                new CourseEnrollment();

        enrollment.setStudentId(
                student.getId()
        );

        enrollment.setCourseId(
                courseId
        );

        enrollment.setSemester(
                "Fall 2026"
        );

        int result =
                courseEnrollmentService
                        .enrollStudent(enrollment);

        if (result == 0) {

            List<Course> courses =
                    courseService.getAvailableCourses();

            model.addAttribute(
                    "courses",
                    courses
            );

            model.addAttribute(
                    "student",
                    student
            );

            model.addAttribute(
                    "error",
                    "This course is full. No seats are available."
            );

            return "student/courses";
        }

        return "redirect:/student/enrollments";
    }


    // =========================================================
    // ADD COURSE TO CART
    // =========================================================

    @GetMapping("/student/cart/add")
    public String addToCart(
            @RequestParam("courseId") int courseId,
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        Course course =
                courseService.getCourseById(courseId);

        if (course == null) {

            return "redirect:/student/courses";
        }

        if (courseEnrollmentService.isAlreadyEnrolled(
                student.getId(),
                courseId)) {

            List<Course> courses =
                    courseService.getAvailableCourses();

            model.addAttribute(
                    "courses",
                    courses
            );

            model.addAttribute(
                    "student",
                    student
            );

            model.addAttribute(
                    "error",
                    "You are already enrolled in this course."
            );

            return "student/courses";
        }

        boolean prerequisiteSatisfied =
                courseEnrollmentService
                        .hasCompletedPrerequisite(
                                student.getId(),
                                courseId
                        );

        if (!prerequisiteSatisfied) {

            List<Course> courses =
                    courseService.getAvailableCourses();

            model.addAttribute(
                    "courses",
                    courses
            );

            model.addAttribute(
                    "student",
                    student
            );

            model.addAttribute(
                    "error",
                    "You must complete the prerequisite course before adding this course."
            );

            return "student/courses";
        }

        if (course.getAvailableSeats() <= 0) {

            List<Course> courses =
                    courseService.getAvailableCourses();

            model.addAttribute(
                    "courses",
                    courses
            );

            model.addAttribute(
                    "student",
                    student
            );

            model.addAttribute(
                    "error",
                    "This course is full. No seats are available."
            );

            return "student/courses";
        }

        EnrollmentCartItem item =
                new EnrollmentCartItem();

        item.setCourseId(
                course.getId()
        );

        item.setCourseCode(
                course.getCourseCode()
        );

        item.setCourseTitle(
                course.getTitle()
        );

        item.setCredits(
                course.getCredits()
        );

        item.setFeeAmount(
                course.getFeeAmount()
        );

        boolean added =
                enrollmentCartService.addToCart(
                        session,
                        item
                );

        if (!added) {

            List<Course> courses =
                    courseService.getAvailableCourses();

            model.addAttribute(
                    "courses",
                    courses
            );

            model.addAttribute(
                    "student",
                    student
            );

            model.addAttribute(
                    "error",
                    "This course is already in your cart."
            );

            return "student/courses";
        }

        return "redirect:/student/cart";
    }


    // =========================================================
    // VIEW CART
    // =========================================================

    @GetMapping("/student/cart")
    public String viewCart(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        List<EnrollmentCartItem> cart =
                enrollmentCartService.getCart(
                        session
                );

        double totalFee =
                enrollmentCartService.getTotalFee(
                        session
                );

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "cart",
                cart
        );

        model.addAttribute(
                "totalFee",
                totalFee
        );

        return "student/cart";
    }


    // =========================================================
    // REMOVE COURSE FROM CART
    // =========================================================

    @GetMapping("/student/cart/remove")
    public String removeFromCart(
            @RequestParam("courseId") int courseId,
            HttpSession session) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        enrollmentCartService.removeFromCart(
                session,
                courseId
        );

        return "redirect:/student/cart";
    }


    // =========================================================
    // CONFIRM ENROLLMENT FROM CART
    // =========================================================

    @PostMapping("/student/cart/confirm")
    public String confirmEnrollment(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        List<EnrollmentCartItem> cart =
                enrollmentCartService.getCart(
                        session
                );

        if (cart == null || cart.isEmpty()) {

            return "redirect:/student/cart";
        }

        for (EnrollmentCartItem item : cart) {

            Course course =
                    courseService.getCourseById(
                            item.getCourseId()
                    );

            if (course == null) {

                model.addAttribute(
                        "error",
                        "Course "
                        + item.getCourseCode()
                        + " is no longer available."
                );

                model.addAttribute(
                        "student",
                        student
                );

                model.addAttribute(
                        "cart",
                        cart
                );

                model.addAttribute(
                        "totalFee",
                        enrollmentCartService
                                .getTotalFee(session)
                );

                return "student/cart";
            }

            if (courseEnrollmentService.isAlreadyEnrolled(
                    student.getId(),
                    course.getId())) {

                model.addAttribute(
                        "error",
                        "You are already enrolled in "
                        + course.getCourseCode()
                        + "."
                );

                model.addAttribute(
                        "student",
                        student
                );

                model.addAttribute(
                        "cart",
                        cart
                );

                model.addAttribute(
                        "totalFee",
                        enrollmentCartService
                                .getTotalFee(session)
                );

                return "student/cart";
            }

            boolean prerequisiteSatisfied =
                    courseEnrollmentService
                            .hasCompletedPrerequisite(
                                    student.getId(),
                                    course.getId()
                            );

            if (!prerequisiteSatisfied) {

                model.addAttribute(
                        "error",
                        "Prerequisite is not completed for "
                        + course.getCourseCode()
                        + "."
                );

                model.addAttribute(
                        "student",
                        student
                );

                model.addAttribute(
                        "cart",
                        cart
                );

                model.addAttribute(
                        "totalFee",
                        enrollmentCartService
                                .getTotalFee(session)
                );

                return "student/cart";
            }

            if (course.getAvailableSeats() <= 0) {

                model.addAttribute(
                        "error",
                        "No seats available for "
                        + course.getCourseCode()
                        + "."
                );

                model.addAttribute(
                        "student",
                        student
                );

                model.addAttribute(
                        "cart",
                        cart
                );

                model.addAttribute(
                        "totalFee",
                        enrollmentCartService
                                .getTotalFee(session)
                );

                return "student/cart";
            }
        }

        for (EnrollmentCartItem item : cart) {

            CourseEnrollment enrollment =
                    new CourseEnrollment();

            enrollment.setStudentId(
                    student.getId()
            );

            enrollment.setCourseId(
                    item.getCourseId()
            );

            enrollment.setSemester(
                    "Fall 2026"
            );

            int result =
                    courseEnrollmentService
                            .enrollStudent(
                                    enrollment
                            );

            if (result == 0) {

                model.addAttribute(
                        "error",
                        "Enrollment failed for "
                        + item.getCourseCode()
                        + ". Please try again."
                );

                model.addAttribute(
                        "student",
                        student
                );

                model.addAttribute(
                        "cart",
                        cart
                );

                model.addAttribute(
                        "totalFee",
                        enrollmentCartService
                                .getTotalFee(session)
                );

                return "student/cart";
            }
        }

        enrollmentCartService.clearCart(
                session
        );

        return "redirect:/student/enrollments";
    }


    // =========================================================
    // MY ENROLLMENTS
    // =========================================================

    @GetMapping("/student/enrollments")
    public String myEnrollments(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        List<CourseEnrollment> enrollments =
                courseEnrollmentService
                        .getStudentEnrollments(
                                student.getId()
                        );

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "enrollments",
                enrollments
        );

        return "student/enrollments";
    }


    // =========================================================
    // DROP COURSE
    // =========================================================

    @GetMapping("/student/drop")
    public String dropCourse(
            @RequestParam("enrollmentId") int enrollmentId,
            HttpSession session) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        courseEnrollmentService.dropCourse(
                enrollmentId
        );

        return "redirect:/student/enrollments";
    }


    // =========================================================
    // FEES
    // =========================================================

    @GetMapping("/student/fees")
    public String fees(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        List<CourseEnrollment> enrollments =
                courseEnrollmentService
                        .getStudentEnrollments(
                                student.getId()
                        );

        double totalFee = 0;

        for (CourseEnrollment enrollment :
                enrollments) {

            if ("Enrolled".equals(
                    enrollment.getStatus())) {

                totalFee =
                        totalFee
                        + enrollment.getFeeAmount();
            }
        }

        List<FeePayment> payments =
                feePaymentService.getStudentPayments(
                        student.getId()
                );

        double paidAmount = 0;

        for (FeePayment payment : payments) {

            if ("Paid".equals(
                    payment.getPaymentStatus())) {

                paidAmount =
                        paidAmount
                        + payment.getAmount();
            }
        }

        double pendingFee =
                totalFee - paidAmount;

        if (pendingFee < 0) {

            pendingFee = 0;
        }

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "enrollments",
                enrollments
        );

        model.addAttribute(
                "totalFee",
                totalFee
        );

        model.addAttribute(
                "paidAmount",
                paidAmount
        );

        model.addAttribute(
                "pendingFee",
                pendingFee
        );

        model.addAttribute(
                "payments",
                payments
        );

        return "student/fees";
    }


    // =========================================================
    // PAYMENT PAGE
    // =========================================================

    @GetMapping("/student/payment")
    public String paymentPage(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        List<CourseEnrollment> enrollments =
                courseEnrollmentService
                        .getStudentEnrollments(
                                student.getId()
                        );

        double totalFee = 0;

        for (CourseEnrollment enrollment :
                enrollments) {

            if ("Enrolled".equals(
                    enrollment.getStatus())) {

                totalFee =
                        totalFee
                        + enrollment.getFeeAmount();
            }
        }

        List<FeePayment> payments =
                feePaymentService.getStudentPayments(
                        student.getId()
                );

        double paidAmount = 0;

        for (FeePayment payment : payments) {

            if ("Paid".equals(
                    payment.getPaymentStatus())) {

                paidAmount =
                        paidAmount
                        + payment.getAmount();
            }
        }

        double pendingFee =
                totalFee - paidAmount;

        if (pendingFee < 0) {

            pendingFee = 0;
        }

        if (pendingFee <= 0) {

            return "redirect:/student/fees";
        }

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "totalFee",
                totalFee
        );

        model.addAttribute(
                "paidAmount",
                paidAmount
        );

        model.addAttribute(
                "pendingFee",
                pendingFee
        );

        return "student/payment";
    }


    // =========================================================
    // PROCESS PAYMENT
    // =========================================================

    @PostMapping("/student/payment")
    public String processPayment(
            @RequestParam("paymentMethod")
            String paymentMethod,
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        List<CourseEnrollment> enrollments =
                courseEnrollmentService
                        .getStudentEnrollments(
                                student.getId()
                        );

        double totalFee = 0;

        for (CourseEnrollment enrollment :
                enrollments) {

            if ("Enrolled".equals(
                    enrollment.getStatus())) {

                totalFee =
                        totalFee
                        + enrollment.getFeeAmount();
            }
        }

        List<FeePayment> payments =
                feePaymentService.getStudentPayments(
                        student.getId()
                );

        double paidAmount = 0;

        for (FeePayment payment : payments) {

            if ("Paid".equals(
                    payment.getPaymentStatus())) {

                paidAmount =
                        paidAmount
                        + payment.getAmount();
            }
        }

        double pendingFee =
                totalFee - paidAmount;

        if (pendingFee < 0) {

            pendingFee = 0;
        }

        if (pendingFee <= 0) {

            return "redirect:/student/fees";
        }

        FeePayment payment =
                new FeePayment();

        payment.setStudentId(
                student.getId()
        );

        payment.setAmount(
                pendingFee
        );

        payment.setPaymentStatus(
                "Paid"
        );

        feePaymentService.makePayment(
                payment
        );

        return "redirect:/student/fees";
    }


    // =========================================================
    // OFFICIAL RECEIPT
    // =========================================================

    @GetMapping("/student/receipt")
    public String receipt(
            @RequestParam("receiptNumber")
            String receiptNumber,
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        List<FeePayment> payments =
                feePaymentService.getStudentPayments(
                        student.getId()
                );

        FeePayment selectedPayment = null;

        for (FeePayment payment : payments) {

            if (receiptNumber.equals(
                    payment.getReceiptNumber())) {

                selectedPayment = payment;

                break;
            }
        }

        if (selectedPayment == null) {

            return "redirect:/student/fees";
        }

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "payment",
                selectedPayment
        );

        return "student/receipt";
    }


    // =========================================================
    // ADMIN - STUDENT LIST
    // =========================================================

    @GetMapping("/admin/students")
    public String studentList(
            HttpSession session,
            Model model) {

        org.techhub.model.Admin admin =
                (org.techhub.model.Admin)
                session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        List<Student> students =
                studentService.getAllStudents();

        model.addAttribute(
                "students",
                students
        );

        return "student/list";
    }


    // =========================================================
    // ADMIN - ADD STUDENT
    // =========================================================

    @GetMapping("/admin/students/add")
    public String addStudentPage(
            HttpSession session,
            Model model) {

        org.techhub.model.Admin admin =
                (org.techhub.model.Admin)
                session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute(
                "departments",
                departments
        );

        return "student/add";
    }


    @PostMapping("/admin/students/add")
    public String addStudentByAdmin(
            @RequestParam("rollNumber") String rollNumber,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("deptId") int deptId,
            @RequestParam("currentSemester") int currentSemester,
            @RequestParam("password") String password,
            HttpSession session) {

        org.techhub.model.Admin admin =
                (org.techhub.model.Admin)
                session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        Student student =
                new Student();

        student.setRollNumber(rollNumber);
        student.setName(name);
        student.setEmail(email);
        student.setDeptId(deptId);
        student.setCurrentSemester(currentSemester);
        student.setPassword(password);

        studentService.addStudent(
                student
        );

        return "redirect:/admin/students";
    }


    // =========================================================
    // ADMIN - EDIT STUDENT
    // =========================================================

    @GetMapping("/admin/students/edit")
    public String editStudentPage(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        org.techhub.model.Admin admin =
                (org.techhub.model.Admin)
                session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        Student student =
                studentService.getStudentById(id);

        List<Department> departments =
                departmentService.getAllDepartments();

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "departments",
                departments
        );

        return "student/edit";
    }


    @PostMapping("/admin/students/edit")
    public String updateStudentByAdmin(
            @RequestParam("id") int id,
            @RequestParam("rollNumber") String rollNumber,
            @RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("deptId") int deptId,
            @RequestParam("currentSemester") int currentSemester,
            @RequestParam("password") String password,
            HttpSession session) {

        org.techhub.model.Admin admin =
                (org.techhub.model.Admin)
                session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        Student student =
                new Student();

        student.setId(id);
        student.setRollNumber(rollNumber);
        student.setName(name);
        student.setEmail(email);
        student.setDeptId(deptId);
        student.setCurrentSemester(currentSemester);
        student.setPassword(password);

        studentService.updateStudent(
                student
        );

        return "redirect:/admin/students";
    }


    // =========================================================
    // ADMIN - DELETE STUDENT
    // =========================================================

    @GetMapping("/admin/students/delete")
    public String deleteStudent(
            @RequestParam("id") int id,
            HttpSession session) {

        org.techhub.model.Admin admin =
                (org.techhub.model.Admin)
                session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        studentService.deleteStudent(id);

        return "redirect:/admin/students";
    }


    // =========================================================
    // ADMIN - SEARCH STUDENTS
    // =========================================================

    @GetMapping("/admin/students/search")
    public String searchStudents(
            @RequestParam("keyword") String keyword,
            HttpSession session,
            Model model) {

        org.techhub.model.Admin admin =
                (org.techhub.model.Admin)
                session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        List<Student> students =
                studentService.searchStudents(
                        keyword
                );

        model.addAttribute(
                "students",
                students
        );

        return "student/list";
    }


    // =========================================================
    // STUDENT LOGOUT
    // =========================================================

    @GetMapping("/student/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}