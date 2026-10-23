
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Edit Student | Admin Portal</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
        rel="stylesheet">

    <!-- Google Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <!-- Global CSS -->
    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/css/style.css">


    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #F6F3F8;
            color: #24172E;
        }


        /* =========================
           LAYOUT
        ========================== */

        .dashboard-container {
            min-height: 100vh;
            display: flex;
        }


        /* =========================
           SIDEBAR
        ========================== */

        .sidebar {
            width: 260px;
            min-height: 100vh;
            position: fixed;
            left: 0;
            top: 0;

            background: linear-gradient(
                180deg,
                #1B1028,
                #3B1F52
            );

            color: white;
            z-index: 1000;
        }

        .sidebar-brand {
            height: 82px;

            display: flex;
            align-items: center;

            padding: 0 24px;

            border-bottom:
                1px solid rgba(255,255,255,0.10);
        }

        .brand-icon {
            width: 42px;
            height: 42px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 12px;

            background:
                rgba(255,255,255,0.12);

            margin-right: 12px;

            font-size: 21px;
        }

        .brand-text {
            font-size: 15px;
            font-weight: 700;
            line-height: 1.3;
        }

        .brand-subtitle {
            display: block;

            font-size: 10px;
            font-weight: 400;

            color:
                rgba(255,255,255,0.60);

            margin-top: 3px;
        }

        .sidebar-menu {
            padding: 22px 14px;
        }

        .menu-label {
            font-size: 10px;

            font-weight: 700;

            letter-spacing: 1.2px;

            color:
                rgba(255,255,255,0.42);

            padding: 0 12px;

            margin: 12px 0 9px;
        }

        .menu-item {
            display: flex;
            align-items: center;

            gap: 12px;

            padding: 12px 13px;

            margin-bottom: 4px;

            border-radius: 10px;

            color:
                rgba(255,255,255,0.70);

            text-decoration: none;

            font-size: 13px;

            font-weight: 500;

            transition: all 0.2s ease;
        }

        .menu-item i {
            width: 21px;

            text-align: center;

            font-size: 17px;
        }

        .menu-item:hover {
            background:
                rgba(255,255,255,0.08);

            color: white;

            transform: translateX(3px);
        }

        .logout-link {
            color: #D6A5B2;
        }

        .logout-link:hover {
            color: #E5C2CB;

            background:
                rgba(214,165,178,0.12);
        }


        /* =========================
           MAIN
        ========================== */

        .main-content {
            margin-left: 260px;

            width: calc(100% - 260px);

            min-height: 100vh;

            padding: 28px 34px;
        }


        /* =========================
           HEADER
        ========================== */

        .top-header {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 25px;
        }

        .page-title {
            margin: 0;

            font-size: 26px;

            font-weight: 800;

            color: #24172E;
        }

        .page-subtitle {
            margin: 5px 0 0;

            color: #786B82;

            font-size: 13px;
        }

        .admin-profile {
            display: flex;

            align-items: center;

            gap: 10px;

            padding: 7px 12px 7px 7px;

            background: #FFFFFF;

            border:
                1px solid #DDD2E5;

            border-radius: 40px;
        }

        .admin-avatar {
            width: 38px;
            height: 38px;

            border-radius: 50%;

            display: flex;

            align-items: center;
            justify-content: center;

            background: #EEE5F5;

            color: #6D3FA0;

            font-size: 14px;
        }

        .admin-details strong {
            display: block;

            font-size: 12px;

            color: #24172E;
        }

        .admin-details span {
            font-size: 10px;

            color: #786B82;
        }


        /* =========================
           PAGE ACTIONS
        ========================== */

        .page-actions {
            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 15px;

            margin-bottom: 20px;
        }

        .student-count {
            color: #786B82;

            font-size: 13px;
        }

        .action-buttons {
            display: flex;

            gap: 10px;
        }

        .btn-modern {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            gap: 8px;

            min-height: 42px;

            padding: 0 16px;

            border-radius: 10px;

            text-decoration: none;

            font-size: 12px;

            font-weight: 600;

            border: none;

            transition: all 0.2s ease;
        }

        .btn-primary-modern {
            background: #6D3FA0;

            color: white;

            box-shadow:
                0 6px 15px
                rgba(109,63,160,0.18);
        }

        .btn-primary-modern:hover {
            background: #4B286B;

            color: white;

            transform: translateY(-2px);
        }

        .btn-secondary-modern {
            background: #FFFFFF;

            color: #4B286B;

            border:
                1px solid #DDD2E5;
        }

        .btn-secondary-modern:hover {
            background: #FAF8FC;

            color: #24172E;
        }


        /* =========================
           FORM CARD
        ========================== */

        .form-card {
            background: #FFFFFF;

            border:
                1px solid #DDD2E5;

            border-radius: 16px;

            overflow: hidden;

            box-shadow:
                0 5px 20px
                rgba(36,23,46,0.04);
        }

        .form-header {
            padding: 20px;

            border-bottom:
                1px solid #EEE5F5;

            display: flex;

            justify-content: space-between;

            align-items: center;
        }

        .form-header-left {
            display: flex;

            align-items: center;

            gap: 12px;
        }

        .form-header-icon {
            width: 42px;
            height: 42px;

            border-radius: 10px;

            background: #EEE5F5;

            color: #6D3FA0;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 18px;
        }

        .form-header h3 {
            margin: 0;

            font-size: 16px;

            font-weight: 700;

            color: #24172E;
        }

        .form-header p {
            margin: 4px 0 0;

            color: #786B82;

            font-size: 11px;
        }


        /* =========================
           FORM BODY
        ========================== */

        .form-body {
            padding: 25px;
        }

        .form-section {
            margin-bottom: 30px;
        }

        .section-title {
            display: flex;

            align-items: center;

            gap: 9px;

            margin-bottom: 18px;

            font-size: 14px;

            font-weight: 700;

            color: #4B286B;
        }

        .section-title i {
            color: #6D3FA0;

            font-size: 17px;
        }

        .form-label {
            font-size: 12px;

            font-weight: 600;

            color: #3E3447;

            margin-bottom: 7px;
        }

        .required {
            color: #B4475B;
        }


        /* =========================
           INPUTS
        ========================== */

        .form-control,
        .form-select {
            height: 45px;

            border:
                1px solid #DDD2E5;

            border-radius: 10px;

            font-size: 12px;

            padding: 0 13px;

            color: #24172E;

            background: #F8F6FA;

            transition: 0.2s;
        }

        .form-control:focus,
        .form-select:focus {
            background: #FFFFFF;

            border-color: #6D3FA0;

            box-shadow:
                0 0 0 4px
                rgba(109,63,160,0.10);
        }

        .input-group .form-control {
            border-right: none;
        }

        .input-group .btn {
            height: 45px;

            border:
                1px solid #DDD2E5;

            border-left: none;

            background: #F8F6FA;

            color: #786B82;

            padding: 0 15px;
        }

        .input-group .btn:hover {
            color: #6D3FA0;
        }

        .form-help {
            font-size: 10px;

            color: #786B82;

            margin-top: 5px;
        }


        /* =========================
           ERROR
        ========================== */

        .error-alert {
            border:
                1px solid #E8C8D0;

            border-radius: 10px;

            background: #F8EDEF;

            color: #9B3D52;

            font-size: 12px;

            padding: 12px 15px;

            margin-bottom: 22px;
        }


        /* =========================
           FORM ACTIONS
        ========================== */

        .form-actions {
            border-top:
                1px solid #EEE5F5;

            padding-top: 22px;

            display: flex;

            justify-content: flex-end;

            gap: 10px;
        }

        .btn-cancel {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            gap: 8px;

            min-height: 42px;

            padding: 0 17px;

            background: #FFFFFF;

            color: #4B286B;

            border:
                1px solid #DDD2E5;

            border-radius: 10px;

            text-decoration: none;

            font-size: 12px;

            font-weight: 600;

            transition: 0.2s;
        }

        .btn-cancel:hover {
            background: #FAF8FC;

            color: #24172E;
        }

        .btn-update {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            gap: 8px;

            min-height: 42px;

            padding: 0 18px;

            background: #6D3FA0;

            color: white;

            border: none;

            border-radius: 10px;

            font-size: 12px;

            font-weight: 600;

            box-shadow:
                0 6px 15px
                rgba(109,63,160,0.18);

            transition: all 0.2s ease;
        }

        .btn-update:hover {
            background: #4B286B;

            color: white;

            transform: translateY(-2px);
        }

        .btn-update:disabled {
            opacity: 0.7;

            cursor: not-allowed;

            transform: none;
        }


        /* =========================
           MOBILE MENU
        ========================== */

        .mobile-menu-btn {
            display: none;

            width: 42px;
            height: 42px;

            border: none;

            border-radius: 10px;

            background: #FFFFFF;

            color: #4B286B;

            font-size: 20px;
        }


        /* =========================
           RESPONSIVE
        ========================== */

        @media (max-width: 800px) {

            .sidebar {
                transform: translateX(-100%);

                transition:
                    transform 0.3s ease;
            }

            .sidebar.show {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;

                width: 100%;

                padding: 22px;
            }

            .mobile-menu-btn {
                display: inline-flex;

                align-items: center;

                justify-content: center;
            }

            .admin-details {
                display: none;
            }

        }


        @media (max-width: 600px) {

            .page-actions {
                flex-direction: column;

                align-items: stretch;
            }

            .action-buttons {
                width: 100%;
            }

            .action-buttons .btn-modern {
                flex: 1;
            }

            .page-title {
                font-size: 21px;
            }

            .form-body {
                padding: 20px 16px;
            }

            .form-header {
                padding: 17px;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .btn-cancel,
            .btn-update {
                width: 100%;
            }

        }

    </style>

</head>


<body>


<div class="dashboard-container">


    <!-- =========================
         SIDEBAR
    ========================== -->

    <aside class="sidebar" id="sidebar">


        <div class="sidebar-brand">

            <div class="brand-icon">

                <i class="bi bi-mortarboard-fill"></i>

            </div>


            <div class="brand-text">

                Student Management

                <span class="brand-subtitle">

                    Administration Portal

                </span>

            </div>

        </div>


        <nav class="sidebar-menu">


            <div class="menu-label">

                MAIN MENU

            </div>


            <a
                href="${pageContext.request.contextPath}/admin/dashboard"
                class="menu-item">

                <i class="bi bi-grid-1x2-fill"></i>

                Dashboard

            </a>


            <a
                href="${pageContext.request.contextPath}/admin/students"
                class="menu-item">

                <i class="bi bi-people-fill"></i>

                Students

            </a>


            <a
                href="${pageContext.request.contextPath}/admin/departments"
                class="menu-item">

                <i class="bi bi-building-fill"></i>

                Departments

            </a>


            <a
                href="${pageContext.request.contextPath}/admin/courses"
                class="menu-item">

                <i class="bi bi-journal-bookmark-fill"></i>

                Courses

            </a>


            <a
                href="${pageContext.request.contextPath}/admin/faculty-assignment"
                class="menu-item">

                <i class="bi bi-person-workspace"></i>

                Faculty

            </a>


            <div class="menu-label">

                ACADEMIC

            </div>


            <a
                href="${pageContext.request.contextPath}/admin/enrollments"
                class="menu-item">

                <i class="bi bi-journal-check"></i>

                Enrollments

            </a>


            <a
                href="${pageContext.request.contextPath}/admin/payments"
                class="menu-item">

                <i class="bi bi-credit-card-fill"></i>

                Payments

            </a>


            <div class="menu-label">

                ACCOUNT

            </div>


            <a
                href="${pageContext.request.contextPath}/admin/logout"
                class="menu-item logout-link">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>


        </nav>

    </aside>


    <!-- =========================
         MAIN
    ========================== -->

    <main class="main-content">


        <!-- HEADER -->

        <header class="top-header">


            <div class="d-flex align-items-center gap-3">


                <button
                    class="mobile-menu-btn"
                    type="button"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>


                <div>

                    <h1 class="page-title">

                        Edit Student

                    </h1>


                    <p class="page-subtitle">

                        Update student records and academic information

                    </p>

                </div>

            </div>


            <div class="admin-profile">


                <div class="admin-avatar">

                    <i class="bi bi-person-fill"></i>

                </div>


                <div class="admin-details">

                    <strong>

                        ${sessionScope.admin.name}

                    </strong>


                    <span>

                        Administrator

                    </span>

                </div>

            </div>


        </header>


        <!-- PAGE ACTIONS -->

        <div class="page-actions">


            <div class="student-count">

                <i class="bi bi-pencil-square me-1"></i>

                Edit Student Record

            </div>


            <div class="action-buttons">


                <a
                    href="${pageContext.request.contextPath}/admin/students"
                    class="btn-modern btn-secondary-modern">

                    <i class="bi bi-arrow-left"></i>

                    Back to Students

                </a>


            </div>


        </div>


        <!-- FORM CARD -->

        <div class="form-card">


            <!-- FORM HEADER -->

            <div class="form-header">


                <div class="form-header-left">


                    <div class="form-header-icon">

                        <i class="bi bi-person-gear"></i>

                    </div>


                    <div>

                        <h3>

                            Student Information

                        </h3>


                        <p>

                            Update the details of
                            ${student.name}

                        </p>

                    </div>


                </div>


            </div>


            <!-- FORM BODY -->

            <div class="form-body">


                <!-- ERROR -->

                <c:if test="${not empty error}">

                    <div class="alert error-alert">

                        <i class="bi bi-exclamation-circle-fill me-2"></i>

                        ${error}

                    </div>

                </c:if>


                <!-- FORM -->

                <form
                    action="${pageContext.request.contextPath}/admin/students/edit"
                    method="post"
                    id="editStudentForm"
                    onsubmit="return validateForm()">


                    <!-- ID -->

                    <input
                        type="hidden"
                        name="id"
                        value="${student.id}">


                    <!-- PERSONAL INFORMATION -->

                    <div class="form-section">


                        <div class="section-title">

                            <i class="bi bi-person-vcard-fill"></i>

                            Personal Information

                        </div>


                        <div class="row g-4">


                            <!-- ROLL NUMBER -->

                            <div class="col-md-6">

                                <label
                                    class="form-label"
                                    for="rollNumber">

                                    Roll Number

                                    <span class="required">
                                        *
                                    </span>

                                </label>


                                <input
                                    type="text"
                                    class="form-control"
                                    name="rollNumber"
                                    id="rollNumber"
                                    value="${student.rollNumber}"
                                    placeholder="Enter roll number"
                                    required>


                                <div class="form-help">

                                    Unique identification number of the student.

                                </div>

                            </div>


                            <!-- NAME -->

                            <div class="col-md-6">

                                <label
                                    class="form-label"
                                    for="name">

                                    Full Name

                                    <span class="required">
                                        *
                                    </span>

                                </label>


                                <input
                                    type="text"
                                    class="form-control"
                                    name="name"
                                    id="name"
                                    value="${student.name}"
                                    placeholder="Enter student's full name"
                                    required>

                            </div>


                            <!-- EMAIL -->

                            <div class="col-md-6">

                                <label
                                    class="form-label"
                                    for="email">

                                    Email Address

                                    <span class="required">
                                        *
                                    </span>

                                </label>


                                <input
                                    type="email"
                                    class="form-control"
                                    name="email"
                                    id="email"
                                    value="${student.email}"
                                    placeholder="student@example.com"
                                    required>

                            </div>


                            <!-- PASSWORD -->

                            <div class="col-md-6">

                                <label
                                    class="form-label"
                                    for="password">

                                    Password

                                    <span class="required">
                                        *
                                    </span>

                                </label>


                                <div class="input-group">


                                    <input
                                        type="password"
                                        class="form-control"
                                        name="password"
                                        id="password"
                                        value="${student.password}"
                                        placeholder="Enter password"
                                        required>


                                    <button
                                        type="button"
                                        class="btn"
                                        onclick="togglePassword()">

                                        <i
                                            class="bi bi-eye"
                                            id="passwordIcon">
                                        </i>

                                    </button>


                                </div>


                                <div class="form-help">

                                    Password must contain at least 6 characters.

                                </div>

                            </div>


                        </div>

                    </div>


                    <!-- ACADEMIC INFORMATION -->

                    <div class="form-section">


                        <div class="section-title">

                            <i class="bi bi-mortarboard-fill"></i>

                            Academic Information

                        </div>


                        <div class="row g-4">


                            <!-- DEPARTMENT -->

                            <div class="col-md-6">

                                <label
                                    class="form-label"
                                    for="deptId">

                                    Department

                                    <span class="required">
                                        *
                                    </span>

                                </label>


                                <select
                                    class="form-select"
                                    name="deptId"
                                    id="deptId"
                                    required>


                                    <option value="">

                                        Select Department

                                    </option>


                                    <c:forEach
                                        var="department"
                                        items="${departments}">


                                        <option
                                            value="${department.id}"
                                            <c:if test="${department.id == student.deptId}">
                                                selected
                                            </c:if>>

                                            ${department.deptName}
                                            (${department.deptCode})

                                        </option>


                                    </c:forEach>


                                </select>

                            </div>


                            <!-- SEMESTER -->

                            <div class="col-md-6">

                                <label
                                    class="form-label"
                                    for="currentSemester">

                                    Current Semester

                                    <span class="required">
                                        *
                                    </span>

                                </label>


                                <select
                                    class="form-select"
                                    name="currentSemester"
                                    id="currentSemester"
                                    required>


                                    <option value="">

                                        Select Semester

                                    </option>


                                    <c:forEach
                                        var="semester"
                                        begin="1"
                                        end="8">


                                        <option
                                            value="${semester}"
                                            <c:if test="${semester == student.currentSemester}">
                                                selected
                                            </c:if>>

                                            Semester ${semester}

                                        </option>


                                    </c:forEach>


                                </select>

                            </div>


                        </div>

                    </div>


                    <!-- ACTIONS -->

                    <div class="form-actions">


                        <a
                            href="${pageContext.request.contextPath}/admin/students"
                            class="btn-cancel">

                            <i class="bi bi-arrow-left"></i>

                            Cancel

                        </a>


                        <button
                            type="submit"
                            class="btn-update"
                            id="updateButton">


                            <i
                                class="bi bi-check2-circle"
                                id="updateIcon">
                            </i>


                            <span id="updateText">

                                Update Student

                            </span>


                            <span
                                class="spinner-border spinner-border-sm d-none"
                                id="updateSpinner"
                                role="status">
                            </span>


                        </button>


                    </div>


                </form>


            </div>

        </div>


    </main>

</div>


<!-- =========================
     JAVASCRIPT
========================= -->

<script>


    /* =========================
       MOBILE SIDEBAR
    ========================== */

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");

    }


    /* =========================
       PASSWORD
    ========================== */

    function togglePassword() {

        const password =
            document.getElementById("password");

        const icon =
            document.getElementById("passwordIcon");


        if (password.type === "password") {

            password.type = "text";

            icon.classList.remove("bi-eye");

            icon.classList.add("bi-eye-slash");

        } else {

            password.type = "password";

            icon.classList.remove("bi-eye-slash");

            icon.classList.add("bi-eye");

        }

    }


    /* =========================
       VALIDATION
    ========================== */

    function validateForm() {


        const name =
            document.getElementById("name")
                .value.trim();


        const rollNumber =
            document.getElementById("rollNumber")
                .value.trim();


        const email =
            document.getElementById("email")
                .value.trim();


        const department =
            document.getElementById("deptId")
                .value;


        const semester =
            document.getElementById("currentSemester")
                .value;


        const password =
            document.getElementById("password")
                .value;


        if (name.length < 2) {

            alert(
                "Please enter a valid student name."
            );

            return false;

        }


        if (rollNumber.length < 3) {

            alert(
                "Please enter a valid roll number."
            );

            return false;

        }


        if (!email.includes("@")) {

            alert(
                "Please enter a valid email address."
            );

            return false;

        }


        if (department === "") {

            alert(
                "Please select a department."
            );

            return false;

        }


        if (semester === "") {

            alert(
                "Please select a semester."
            );

            return false;

        }


        if (password.length < 6) {

            alert(
                "Password must contain at least 6 characters."
            );

            return false;

        }


        const button =
            document.getElementById("updateButton");


        const text =
            document.getElementById("updateText");


        const icon =
            document.getElementById("updateIcon");


        const spinner =
            document.getElementById("updateSpinner");


        button.disabled = true;

        text.textContent =
            "Updating Student...";

        icon.classList.add("d-none");

        spinner.classList.remove("d-none");


        return true;

    }


    /* =========================
       MOBILE SIDEBAR CLOSE
    ========================== */

    document
        .querySelectorAll(".menu-item")
        .forEach(item => {

            item.addEventListener(
                "click",
                function() {

                    if (window.innerWidth <= 800) {

                        document
                            .getElementById("sidebar")
                            .classList.remove("show");

                    }

                }
            );

        });


</script>


</body>

</html>

