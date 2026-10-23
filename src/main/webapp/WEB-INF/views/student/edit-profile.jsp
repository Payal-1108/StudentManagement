
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Edit Profile | Student Portal</title>

    <!-- Bootstrap -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Bootstrap Icons -->

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">

    <!-- Inter Font -->

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
            background: linear-gradient(180deg, #1B1028, #3B1F52);
            color: white;
            z-index: 1000;
        }

        .sidebar-brand {
            height: 82px;
            display: flex;
            align-items: center;
            padding: 0 24px;
            border-bottom: 1px solid rgba(255,255,255,0.10);
        }

        .brand-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: rgba(255,255,255,0.12);
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
            color: rgba(255,255,255,0.60);
            margin-top: 3px;
        }

        .sidebar-menu {
            padding: 22px 14px;
        }

        .menu-label {
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1.2px;
            color: rgba(255,255,255,0.42);
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
            color: rgba(255,255,255,0.70);
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
            background: rgba(255,255,255,0.08);
            color: white;
        }

        /*
         * No active menu styling.
         * Sidebar stays exactly the same on every page.
         */

        .logout-link {
            color: #D6A5B2;
        }

        .logout-link:hover {
            color: #E5C2CB;
            background: rgba(180,70,90,0.12);
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

        .top-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
        }

        .page-title {
            margin: 0;
            font-size: 27px;
            font-weight: 800;
            color: #24172E;
        }

        .page-subtitle {
            margin: 5px 0 0;
            color: #786B82;
            font-size: 13px;
        }

        /* =========================
           STUDENT PROFILE
        ========================== */

        .student-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 7px 13px 7px 7px;
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 40px;
        }

        .student-avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 15px;
        }

        .student-details strong {
            display: block;
            font-size: 12px;
        }

        .student-details span {
            font-size: 10px;
            color: #786B82;
        }

        /* =========================
           EDIT CARD
        ========================== */

        .edit-card {
            width: 100%;
            max-width: 900px;
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            padding: 28px;
            box-shadow: 0 4px 15px rgba(36,23,46,0.05);
        }

        .card-heading {
            display: flex;
            align-items: center;
            gap: 12px;
            padding-bottom: 20px;
            margin-bottom: 24px;
            border-bottom: 1px solid #EEE5F5;
        }

        .heading-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 18px;
        }

        .card-heading h2 {
            margin: 0;
            font-size: 17px;
            font-weight: 800;
            color: #24172E;
        }

        .card-heading p {
            margin: 3px 0 0;
            color: #786B82;
            font-size: 10px;
        }

        /* =========================
           ERROR
        ========================== */

        .error-message {
            display: flex;
            align-items: center;
            gap: 9px;
            padding: 12px 14px;
            margin-bottom: 22px;
            border-radius: 10px;
            background: #F8EDEF;
            border: 1px solid #E8C8D0;
            color: #9B3D52;
            font-size: 12px;
        }

        /* =========================
           FORM
        ========================== */

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-label {
            display: flex;
            align-items: center;
            gap: 7px;
            margin-bottom: 8px;
            color: #3E3447;
            font-size: 11px;
            font-weight: 700;
        }

        .form-label i {
            color: #6D3FA0;
            font-size: 14px;
        }

        .form-control-modern,
        .form-select-modern {
            width: 100%;
            height: 48px;
            padding: 0 13px;
            border: 1px solid #DDD2E5;
            border-radius: 10px;
            background: #F8F6FA;
            color: #24172E;
            font-family: inherit;
            font-size: 12px;
            outline: none;
            transition: all 0.2s ease;
        }

        .form-control-modern:focus,
        .form-select-modern:focus {
            border-color: #6D3FA0;
            background: #FFFFFF;
            box-shadow: 0 0 0 4px rgba(109,63,160,0.08);
        }

        .form-control-modern[readonly] {
            background: #EEE5F5;
            color: #786B82;
            cursor: not-allowed;
        }

        .form-help {
            margin-top: 6px;
            color: #786B82;
            font-size: 9px;
        }

        /* =========================
           PASSWORD
        ========================== */

        .password-wrapper {
            position: relative;
        }

        .password-wrapper .form-control-modern {
            padding-right: 45px;
        }

        .password-toggle {
            position: absolute;
            right: 12px;
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

        /* =========================
           BUTTONS
        ========================== */

        .button-section {
            display: flex;
            gap: 12px;
            padding-top: 25px;
            margin-top: 25px;
            border-top: 1px solid #EEE5F5;
        }

        .save-btn,
        .cancel-btn {
            min-height: 44px;
            padding: 0 20px;
            border-radius: 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-family: inherit;
            font-size: 12px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .save-btn {
            border: none;
            background: #6D3FA0;
            color: #FFFFFF;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(109,63,160,0.18);
        }

        .save-btn:hover {
            background: #4B286B;
            color: #FFFFFF;
            transform: translateY(-1px);
        }

        .cancel-btn {
            border: 1px solid #DDD2E5;
            background: #FFFFFF;
            color: #4B286B;
        }

        .cancel-btn:hover {
            background: #FAF8FC;
            color: #24172E;
            border-color: #CFC0D8;
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
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
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
            }

            .student-details {
                display: none;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {

            .page-title {
                font-size: 21px;
            }

            .edit-card {
                padding: 20px;
            }

            .button-section {
                flex-direction: column;
            }

            .save-btn,
            .cancel-btn {
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

                    Student Portal

                </span>

            </div>

        </div>


        <nav class="sidebar-menu">

            <div class="menu-label">

                MAIN MENU

            </div>


            <a
                href="${pageContext.request.contextPath}/student/dashboard"
                class="menu-item">

                <i class="bi bi-grid-1x2-fill"></i>

                Dashboard

            </a>


            <a
                href="${pageContext.request.contextPath}/student/profile"
                class="menu-item">

                <i class="bi bi-person-vcard-fill"></i>

                My Profile

            </a>


            <a
                href="${pageContext.request.contextPath}/student/courses"
                class="menu-item">

                <i class="bi bi-journal-bookmark-fill"></i>

                Available Courses

            </a>


            <a
                href="${pageContext.request.contextPath}/student/enrollments"
                class="menu-item">

                <i class="bi bi-journal-check"></i>

                My Enrollments

            </a>


            <div class="menu-label">

                ACCOUNT

            </div>


            <a
                href="${pageContext.request.contextPath}/student/fees"
                class="menu-item">

                <i class="bi bi-credit-card-fill"></i>

                Fee &amp; Receipt

            </a>


            <a
                href="${pageContext.request.contextPath}/student/logout"
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

        <div class="top-header">

            <div>

                <button
                    type="button"
                    class="mobile-menu-btn"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>


                <h1 class="page-title">

                    Edit Profile

                </h1>


                <p class="page-subtitle">

                    Update your student account information.

                </p>

            </div>


            <div class="student-profile">

                <div class="student-avatar">

                    <i class="bi bi-person-fill"></i>

                </div>


                <div class="student-details">

                    <strong>

                        ${student.name}

                    </strong>

                    <span>

                        Student

                    </span>

                </div>

            </div>

        </div>


        <!-- =========================
             EDIT FORM
        ========================== -->

        <div class="edit-card">

            <div class="card-heading">

                <div class="heading-icon">

                    <i class="bi bi-pencil-square"></i>

                </div>


                <div>

                    <h2>

                        Update Student Information

                    </h2>

                    <p>

                        Make changes to your academic profile.

                    </p>

                </div>

            </div>


            <!-- ERROR -->

            <c:if test="${not empty error}">

                <div class="error-message">

                    <i class="bi bi-exclamation-circle-fill"></i>

                    <span>

                        ${error}

                    </span>

                </div>

            </c:if>


            <!-- FORM -->

            <form
                action="${pageContext.request.contextPath}/student/profile/edit"
                method="post"
                id="editProfileForm">

                <!-- IMPORTANT: STUDENT ID -->

                <input
                    type="hidden"
                    name="id"
                    value="${student.id}">


                <div class="form-grid">

                    <!-- ROLL NUMBER -->

                    <div class="form-group">

                        <label
                            class="form-label"
                            for="rollNumber">

                            <i class="bi bi-person-badge"></i>

                            Roll Number

                        </label>

                        <input
                            type="text"
                            id="rollNumber"
                            name="rollNumber"
                            value="${student.rollNumber}"
                            class="form-control-modern"
                            required>

                    </div>


                    <!-- NAME -->

                    <div class="form-group">

                        <label
                            class="form-label"
                            for="name">

                            <i class="bi bi-person-fill"></i>

                            Full Name

                        </label>

                        <input
                            type="text"
                            id="name"
                            name="name"
                            value="${student.name}"
                            class="form-control-modern"
                            required>

                    </div>


                    <!-- EMAIL -->

                    <div class="form-group">

                        <label
                            class="form-label"
                            for="email">

                            <i class="bi bi-envelope-fill"></i>

                            Email Address

                        </label>

                        <input
                            type="email"
                            id="email"
                            name="email"
                            value="${student.email}"
                            class="form-control-modern"
                            required>

                    </div>


                    <!-- DEPARTMENT -->

                    <div class="form-group">

                        <label
                            class="form-label"
                            for="deptId">

                            <i class="bi bi-building-fill"></i>

                            Department

                        </label>

                        <select
                            id="deptId"
                            name="deptId"
                            class="form-select-modern"
                            required>

                            <option value="">

                                Select Department

                            </option>

                            <c:forEach
                                var="dept"
                                items="${departments}">

                                <option
                                    value="${dept.id}"
                                    <c:if test="${dept.id == student.deptId}">
                                        selected
                                    </c:if>>

                                    ${dept.deptName}

                                </option>

                            </c:forEach>

                        </select>

                    </div>


                    <!-- SEMESTER -->

                    <div class="form-group">

                        <label
                            class="form-label"
                            for="currentSemester">

                            <i class="bi bi-mortarboard-fill"></i>

                            Current Semester

                        </label>

                        <select
                            id="currentSemester"
                            name="currentSemester"
                            class="form-select-modern"
                            required>

                            <c:forEach
                                var="sem"
                                begin="1"
                                end="8">

                                <option
                                    value="${sem}"
                                    <c:if test="${sem == student.currentSemester}">
                                        selected
                                    </c:if>>

                                    Semester ${sem}

                                </option>

                            </c:forEach>

                        </select>

                    </div>


                    <!-- PASSWORD -->

                    <div class="form-group">

                        <label
                            class="form-label"
                            for="password">

                            <i class="bi bi-lock-fill"></i>

                            Password

                        </label>

                        <div class="password-wrapper">

                            <input
                                type="password"
                                name="password"
                                id="password"
                                value="${student.password}"
                                class="form-control-modern"
                                required>

                            <button
                                type="button"
                                class="password-toggle"
                                id="passwordToggle"
                                aria-label="Show password">

                                <i class="bi bi-eye"></i>

                            </button>

                        </div>

                        <span class="form-help">

                            Keep your password secure.

                        </span>

                    </div>

                </div>


                <!-- BUTTONS -->

                <div class="button-section">

                    <button
                        type="submit"
                        class="save-btn">

                        <i class="bi bi-check-lg"></i>

                        Save Changes

                    </button>


                    <a
                        href="${pageContext.request.contextPath}/student/profile"
                        class="cancel-btn">

                        <i class="bi bi-x-lg"></i>

                        Cancel

                    </a>

                </div>

            </form>

        </div>

    </main>

</div>


<!-- =========================
     JAVASCRIPT
========================= -->

<script>

    /* =========================
       SIDEBAR
    ========================== */

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");

    }


    document
        .querySelectorAll(".menu-item")
        .forEach(function(item) {

            item.addEventListener("click", function() {

                if (window.innerWidth <= 800) {

                    document
                        .getElementById("sidebar")
                        .classList.remove("show");

                }

            });

        });


    /* =========================
       PASSWORD VISIBILITY
    ========================== */

    const password =
        document.getElementById("password");

    const passwordToggle =
        document.getElementById("passwordToggle");


    passwordToggle.addEventListener(
        "click",
        function() {

            if (password.type === "password") {

                password.type = "text";

                this.innerHTML =
                    '<i class="bi bi-eye-slash"></i>';

                this.setAttribute(
                    "aria-label",
                    "Hide password"
                );

            } else {

                password.type = "password";

                this.innerHTML =
                    '<i class="bi bi-eye"></i>';

                this.setAttribute(
                    "aria-label",
                    "Show password"
                );

            }

        }
    );

</script>

</body>

</html>
