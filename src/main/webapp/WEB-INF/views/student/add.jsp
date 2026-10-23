<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add Student | Admin Portal</title>

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

    <link rel="stylesheet"
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
           MAIN CONTENT
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


        .header-left {
            display: flex;
            align-items: center;
            gap: 15px;
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
           FORM CARD
        ========================== */

        .form-card {
            max-width: 1050px;
            margin: 0 auto;

            background: #FFFFFF;

            border:
                1px solid #DDD2E5;

            border-radius: 18px;

            overflow: hidden;

            box-shadow:
                0 8px 30px rgba(36,23,46,0.04);
        }


        .form-card-header {
            padding: 24px 28px;

            border-bottom:
                1px solid #EEE5F5;

            display: flex;
            align-items: center;

            gap: 14px;
        }


        .form-header-icon {
            width: 48px;
            height: 48px;

            border-radius: 13px;

            background: #EEE5F5;

            color: #6D3FA0;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 21px;
        }


        .form-card-header h2 {
            margin: 0;

            font-size: 17px;
            font-weight: 700;

            color: #24172E;
        }


        .form-card-header p {
            margin: 4px 0 0;

            color: #786B82;

            font-size: 11px;
        }


        .form-body {
            padding: 28px;
        }


        /* =========================
           ERROR
        ========================== */

        .error-message {
            display: flex;
            align-items: flex-start;

            gap: 10px;

            padding: 13px 15px;

            border-radius: 10px;

            background: #F8EDEF;

            border:
                1px solid #E8C8D0;

            color: #9B3D52;

            font-size: 12px;

            margin-bottom: 25px;
        }


        .error-message i {
            font-size: 16px;
        }


        /* =========================
           SECTION
        ========================== */

        .form-section {
            margin-bottom: 28px;
        }


        .section-title {
            display: flex;
            align-items: center;

            gap: 8px;

            font-size: 12px;
            font-weight: 700;

            color: #4B286B;

            padding-bottom: 10px;

            border-bottom:
                1px solid #EEE5F5;

            margin-bottom: 20px;
        }


        .section-title i {
            color: #6D3FA0;
        }


        /* =========================
           FORM GRID
        ========================== */

        .form-grid {
            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 20px;
        }


        .form-group {
            margin-bottom: 0;
        }


        .form-label {
            display: block;

            font-size: 12px;
            font-weight: 600;

            color: #3E3447;

            margin-bottom: 8px;
        }


        .required {
            color: #B4475B;
        }


        .input-wrapper {
            position: relative;
        }


        .input-icon {
            position: absolute;

            left: 14px;
            top: 50%;

            transform: translateY(-50%);

            color: #786B82;

            font-size: 16px;

            pointer-events: none;
        }


        .form-control-modern,
        .form-select-modern {
            width: 100%;

            height: 48px;

            border:
                1px solid #DDD2E5;

            border-radius: 10px;

            background: #F8F6FA;

            padding: 0 14px 0 42px;

            outline: none;

            color: #24172E;

            font-size: 12px;

            transition: all 0.2s ease;
        }


        .form-select-modern {
            padding-left: 42px;

            cursor: pointer;
        }


        .form-control-modern:focus,
        .form-select-modern:focus {
            background: #FFFFFF;

            border-color: #6D3FA0;

            box-shadow:
                0 0 0 4px rgba(109,63,160,0.08);
        }


        .form-control-modern::placeholder {
            color: #786B82;
        }


        /* Password */

        .password-toggle {
            position: absolute;

            right: 13px;
            top: 50%;

            transform: translateY(-50%);

            border: none;

            background: transparent;

            color: #786B82;

            cursor: pointer;

            font-size: 16px;
        }


        .password-toggle:hover {
            color: #6D3FA0;
        }


        .password-input {
            padding-right: 45px;
        }


        .field-help {
            margin-top: 6px;

            font-size: 10px;

            color: #786B82;
        }


        /* =========================
           FORM FOOTER
        ========================== */

        .form-footer {
            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 15px;

            padding-top: 25px;

            border-top:
                1px solid #EEE5F5;
        }


        .required-note {
            font-size: 10px;

            color: #786B82;
        }


        .form-buttons {
            display: flex;

            gap: 10px;
        }


        .btn-modern {
            min-height: 43px;

            padding: 0 18px;

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 8px;

            border-radius: 10px;

            text-decoration: none;

            border: none;

            font-size: 12px;

            font-weight: 600;

            cursor: pointer;

            transition: all 0.2s ease;
        }


        .btn-primary-modern {
            background: #6D3FA0;

            color: white;

            box-shadow:
                0 7px 17px rgba(109,63,160,0.18);
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
           RESPONSIVE
        ========================== */

        @media (max-width: 800px) {

            .sidebar {
                transform: translateX(-100%);

                transition: transform 0.3s ease;
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


        @media (max-width: 650px) {

            .form-grid {
                grid-template-columns: 1fr;
            }


            .form-body {
                padding: 22px;
            }


            .form-card-header {
                padding: 20px 22px;
            }


            .form-footer {
                flex-direction: column;

                align-items: stretch;
            }


            .form-buttons {
                width: 100%;
            }


            .form-buttons .btn-modern {
                flex: 1;
            }

        }


        @media (max-width: 450px) {

            .main-content {
                padding: 18px;
            }


            .page-title {
                font-size: 21px;
            }


            .page-subtitle {
                font-size: 11px;
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
         MAIN CONTENT
    ========================== -->

    <main class="main-content">


        <!-- HEADER -->

        <header class="top-header">


            <div class="header-left">


                <button
                    class="mobile-menu-btn"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>


                <div>

                    <h1 class="page-title">
                        Add Student
                    </h1>

                    <p class="page-subtitle">
                        Create a new student academic record
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



        <!-- FORM CARD -->

        <div class="form-card">


            <!-- FORM HEADER -->

            <div class="form-card-header">


                <div class="form-header-icon">

                    <i class="bi bi-person-plus-fill"></i>

                </div>


                <div>

                    <h2>
                        Student Information
                    </h2>

                    <p>
                        Enter the student's personal and academic details.
                    </p>

                </div>


            </div>



            <!-- FORM BODY -->

            <div class="form-body">


                <!-- ERROR -->

                <c:if test="${not empty error}">

                    <div class="error-message">

                        <i class="bi bi-exclamation-circle-fill"></i>

                        <div>
                            ${error}
                        </div>

                    </div>

                </c:if>



                <form
                    action="${pageContext.request.contextPath}/admin/students/add"
                    method="post"
                    onsubmit="return validateStudentForm()">


                    <!-- PERSONAL INFORMATION -->

                    <section class="form-section">


                        <div class="section-title">

                            <i class="bi bi-person-vcard-fill"></i>

                            Personal Information

                        </div>


                        <div class="form-grid">


                            <!-- Roll Number -->

                            <div class="form-group">

                                <label class="form-label">
                                    Roll Number
                                    <span class="required">*</span>
                                </label>

                                <div class="input-wrapper">

                                    <i class="bi bi-card-text input-icon"></i>

                                    <input
                                        type="text"
                                        name="rollNumber"
                                        id="rollNumber"
                                        class="form-control-modern"
                                        placeholder="e.g. 2026-CS-101"
                                        required>

                                </div>

                            </div>


                            <!-- Name -->

                            <div class="form-group">

                                <label class="form-label">
                                    Student Name
                                    <span class="required">*</span>
                                </label>

                                <div class="input-wrapper">

                                    <i class="bi bi-person input-icon"></i>

                                    <input
                                        type="text"
                                        name="name"
                                        id="studentName"
                                        class="form-control-modern"
                                        placeholder="Enter full name"
                                        required>

                                </div>

                            </div>


                            <!-- Email -->

                            <div class="form-group">

                                <label class="form-label">
                                    Email Address
                                    <span class="required">*</span>
                                </label>

                                <div class="input-wrapper">

                                    <i class="bi bi-envelope input-icon"></i>

                                    <input
                                        type="email"
                                        name="email"
                                        id="email"
                                        class="form-control-modern"
                                        placeholder="student@example.com"
                                        required>

                                </div>

                            </div>


                            <!-- Department -->

                            <div class="form-group">

                                <label class="form-label">
                                    Department
                                    <span class="required">*</span>
                                </label>

                                <div class="input-wrapper">

                                    <i class="bi bi-building input-icon"></i>

                                    <select
                                        name="deptId"
                                        id="deptId"
                                        class="form-select-modern"
                                        required>

                                        <option value="">
                                            Select Department
                                        </option>

                                        <c:forEach
                                            var="department"
                                            items="${departments}">

                                            <option value="${department.id}">
                                                ${department.deptName}
                                                (${department.deptCode})
                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                        </div>

                    </section>



                    <!-- ACADEMIC INFORMATION -->

                    <section class="form-section">


                        <div class="section-title">

                            <i class="bi bi-mortarboard-fill"></i>

                            Academic Information

                        </div>


                        <div class="form-grid">


                            <!-- Semester -->

                            <div class="form-group">

                                <label class="form-label">
                                    Current Semester
                                    <span class="required">*</span>
                                </label>

                                <div class="input-wrapper">

                                    <i class="bi bi-calendar3 input-icon"></i>

                                    <select
                                        name="currentSemester"
                                        id="currentSemester"
                                        class="form-select-modern"
                                        required>

                                        <option value="">
                                            Select Semester
                                        </option>

                                        <option value="1">
                                            Semester 1
                                        </option>

                                        <option value="2">
                                            Semester 2
                                        </option>

                                        <option value="3">
                                            Semester 3
                                        </option>

                                        <option value="4">
                                            Semester 4
                                        </option>

                                        <option value="5">
                                            Semester 5
                                        </option>

                                        <option value="6">
                                            Semester 6
                                        </option>

                                        <option value="7">
                                            Semester 7
                                        </option>

                                        <option value="8">
                                            Semester 8
                                        </option>

                                    </select>

                                </div>

                            </div>


                            <!-- Password -->

                            <div class="form-group">

                                <label class="form-label">
                                    Login Password
                                    <span class="required">*</span>
                                </label>

                                <div class="input-wrapper">

                                    <i class="bi bi-lock input-icon"></i>

                                    <input
                                        type="password"
                                        name="password"
                                        id="password"
                                        class="form-control-modern password-input"
                                        placeholder="Create student password"
                                        required
                                        minlength="6">

                                    <button
                                        type="button"
                                        class="password-toggle"
                                        onclick="togglePassword()">

                                        <i
                                            class="bi bi-eye"
                                            id="passwordIcon">
                                        </i>

                                    </button>

                                </div>

                                <div class="field-help">

                                    Minimum 6 characters

                                </div>

                            </div>


                        </div>

                    </section>



                    <!-- FOOTER -->

                    <div class="form-footer">


                        <div class="required-note">

                            <span class="required">*</span>

                            Required fields

                        </div>


                        <div class="form-buttons">


                            <a
                                href="${pageContext.request.contextPath}/admin/students"
                                class="btn-modern btn-secondary-modern">

                                <i class="bi bi-x-lg"></i>

                                Cancel

                            </a>


                            <button
                                type="submit"
                                class="btn-modern btn-primary-modern"
                                id="saveButton">

                                <i class="bi bi-person-plus-fill"></i>

                                Add Student

                            </button>


                        </div>


                    </div>


                </form>


            </div>

        </div>


    </main>

</div>



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
       PASSWORD TOGGLE
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
       FORM VALIDATION
    ========================== */

    function validateStudentForm() {

        const name =
            document.getElementById("studentName").value.trim();

        const rollNumber =
            document.getElementById("rollNumber").value.trim();

        const email =
            document.getElementById("email").value.trim();

        const department =
            document.getElementById("deptId").value;

        const semester =
            document.getElementById("currentSemester").value;

        const password =
            document.getElementById("password").value;


        if (name.length < 2) {

            alert("Please enter a valid student name.");

            return false;

        }


        if (rollNumber.length < 3) {

            alert("Please enter a valid roll number.");

            return false;

        }


        if (!email.includes("@")) {

            alert("Please enter a valid email address.");

            return false;

        }


        if (department === "") {

            alert("Please select a department.");

            return false;

        }


        if (semester === "") {

            alert("Please select the current semester.");

            return false;

        }


        if (password.length < 6) {

            alert(
                "Password must contain at least 6 characters."
            );

            return false;

        }


        const button =
            document.getElementById("saveButton");


        button.disabled = true;

        button.innerHTML =
            '<span class="spinner-border spinner-border-sm"></span>' +
            ' Saving Student...';


        return true;

    }

</script>


</body>

</html>
