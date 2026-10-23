
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Add Course - Student Management</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet">

    <!-- Google Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

    <!-- Main CSS -->
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
           DASHBOARD
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
            transform: translateX(3px);
        }

        .logout-link {
            color: #D6A5B2;
        }

        .logout-link:hover {
            color: #E5C2CB;
            background: rgba(214,165,178,0.12);
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
           TOP HEADER
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


        /* =========================
           ADMIN PROFILE
        ========================== */

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 7px 12px 7px 7px;
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
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
            margin-bottom: 22px;
            gap: 15px;
        }

        .course-label {
            color: #786B82;
            font-size: 13px;
            font-weight: 600;
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
            padding: 10px 16px;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            border: 1px solid transparent;
            transition: all 0.2s ease;
        }

        .btn-primary-modern {
            background: #6D3FA0;
            color: white;
        }

        .btn-primary-modern:hover {
            background: #4B286B;
            color: white;
        }

        .btn-secondary-modern {
            background: #FFFFFF;
            color: #4B286B;
            border-color: #DDD2E5;
        }

        .btn-secondary-modern:hover {
            background: #EEE5F5;
            color: #4B286B;
        }


        /* =========================
           FORM CARD
        ========================== */

        .form-card {
            max-width: 850px;
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            box-shadow: 0 4px 18px rgba(36,23,46,0.05);
            overflow: hidden;
        }

        .form-card-header {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 22px 25px;
            border-bottom: 1px solid #EEE5F5;
        }

        .form-header-icon {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 20px;
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
            font-size: 12px;
        }

        .course-form {
            padding: 25px;
        }

        .form-row {
            margin-bottom: 21px;
        }

        .form-row label {
            display: block;
            margin-bottom: 8px;
            color: #4B286B;
            font-size: 13px;
            font-weight: 600;
        }

        .form-row input,
        .form-row select {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #DDD2E5;
            border-radius: 9px;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            color: #24172E;
            outline: none;
            background: #F8F6FA;
            transition: all 0.2s ease;
        }

        .form-row input:focus,
        .form-row select:focus {
            border-color: #6D3FA0;
            box-shadow: 0 0 0 3px rgba(109,63,160,0.10);
        }

        .form-row input::placeholder {
            color: #786B82;
        }

        .form-hint {
            margin-top: 6px;
            color: #786B82;
            font-size: 11px;
        }


        /* =========================
           FORM ACTIONS
        ========================== */

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 28px;
            padding-top: 20px;
            border-top: 1px solid #EEE5F5;
        }

        .save-button,
        .cancel-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            padding: 11px 18px;
            border-radius: 9px;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .save-button {
            border: none;
            background: #6D3FA0;
            color: white;
        }

        .save-button:hover {
            background: #4B286B;
        }

        .save-button:disabled {
            opacity: 0.7;
            cursor: not-allowed;
        }

        .cancel-button {
            background: #FFFFFF;
            color: #4B286B;
            border: 1px solid #DDD2E5;
        }

        .cancel-button:hover {
            background: #EEE5F5;
            color: #4B286B;
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
                margin-bottom: 10px;
            }

            .admin-details {
                display: none;
            }

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

            .form-card {
                max-width: 100%;
            }
        }


        @media (max-width: 600px) {

            .main-content {
                padding: 18px;
            }

            .page-title {
                font-size: 21px;
            }

            .page-subtitle {
                font-size: 12px;
            }

            .form-card-header {
                padding: 18px;
            }

            .course-form {
                padding: 18px;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .save-button,
            .cancel-button {
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
         MAIN CONTENT
    ========================== -->

    <main class="main-content">


        <!-- TOP HEADER -->

        <div class="top-header">

            <div>

                <button
                    type="button"
                    class="mobile-menu-btn"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>


                <h1 class="page-title">
                    Add Course
                </h1>


                <p class="page-subtitle">
                    Create a new academic course
                </p>

            </div>


            <!-- ADMIN PROFILE -->

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

        </div>


        <!-- PAGE ACTIONS -->

        <div class="page-actions">

            <div class="course-label">

                <i class="bi bi-journal-bookmark-fill"></i>

                Course Management

            </div>


            <div class="action-buttons">


                <a
                    href="${pageContext.request.contextPath}/admin/courses"
                    class="btn-modern btn-secondary-modern">

                    <i class="bi bi-arrow-left"></i>

                    Back to Courses

                </a>


                <a
                    href="${pageContext.request.contextPath}/admin/dashboard"
                    class="btn-modern btn-primary-modern">

                    <i class="bi bi-grid-1x2-fill"></i>

                    Dashboard

                </a>

            </div>

        </div>


        <!-- =========================
             FORM CARD
        ========================== -->

        <div class="form-card">


            <div class="form-card-header">

                <div class="form-header-icon">

                    <i class="bi bi-journal-plus"></i>

                </div>


                <div>

                    <h2>
                        Course Information
                    </h2>

                    <p>
                        Enter the course details, department, capacity and fee information.
                    </p>

                </div>

            </div>


            <form
                action="${pageContext.request.contextPath}/admin/courses/add"
                method="post"
                class="course-form"
                onsubmit="return validateCourseForm();">


                <!-- COURSE CODE -->

                <div class="form-row">

                    <label for="courseCode">
                        Course Code
                    </label>

                    <input
                        type="text"
                        id="courseCode"
                        name="courseCode"
                        placeholder="Enter course code"
                        maxlength="20"
                        required>

                    <div class="form-hint">
                        Example: CS301
                    </div>

                </div>


                <!-- COURSE TITLE -->

                <div class="form-row">

                    <label for="title">
                        Course Title
                    </label>

                    <input
                        type="text"
                        id="title"
                        name="title"
                        placeholder="Enter course title"
                        required>

                    <div class="form-hint">
                        Example: Advanced Java Programming
                    </div>

                </div>


                <!-- CREDITS -->

                <div class="form-row">

                    <label for="credits">
                        Credits
                    </label>

                    <input
                        type="number"
                        id="credits"
                        name="credits"
                        min="1"
                        placeholder="Enter credits"
                        required>

                    <div class="form-hint">
                        Example: 4
                    </div>

                </div>


                <!-- DEPARTMENT -->

                <div class="form-row">

                    <label for="deptId">
                        Department
                    </label>

                    <select
                        id="deptId"
                        name="deptId"
                        required>

                        <option value="">
                            Select Department
                        </option>


                        <c:forEach
                            var="department"
                            items="${departments}">

                            <option value="${department.id}">

                                ${department.deptName}

                            </option>

                        </c:forEach>

                    </select>

                    <div class="form-hint">
                        Select the department offering this course.
                    </div>

                </div>


                <!-- CAPACITY -->

                <div class="form-row">

                    <label for="capacity">
                        Capacity
                    </label>

                    <input
                        type="number"
                        id="capacity"
                        name="capacity"
                        min="1"
                        placeholder="Enter maximum seats"
                        required>

                    <div class="form-hint">
                        Example: 60
                    </div>

                </div>


                <!-- FEE -->

                <div class="form-row">

                    <label for="feeAmount">
                        Fee Amount
                    </label>

                    <input
                        type="number"
                        id="feeAmount"
                        name="feeAmount"
                        min="0"
                        step="0.01"
                        placeholder="Enter course fee"
                        required>

                    <div class="form-hint">
                        Example: 5000
                    </div>

                </div>


                <!-- PREREQUISITE -->

                <div class="form-row">

                    <label for="prerequisiteCourseId">
                        Prerequisite Course
                    </label>

                    <select
                        id="prerequisiteCourseId"
                        name="prerequisiteCourseId">

                        <option value="">
                            No Prerequisite
                        </option>


                        <c:forEach
                            var="course"
                            items="${courses}">

                            <option value="${course.id}">

                                ${course.courseCode} - ${course.title}

                            </option>

                        </c:forEach>

                    </select>

                    <div class="form-hint">
                        Select a course if students must complete it first.
                    </div>

                </div>


                <!-- BUTTONS -->

                <div class="form-actions">


                    <a
                        href="${pageContext.request.contextPath}/admin/courses"
                        class="cancel-button">

                        <i class="bi bi-x-lg"></i>

                        Cancel

                    </a>


                    <button
                        type="submit"
                        class="save-button"
                        id="saveButton">

                        <i class="bi bi-check2-circle"></i>

                        Save Course

                    </button>

                </div>


            </form>

        </div>


    </main>

</div>


<!-- =========================
     JAVASCRIPT
========================== -->

<script>

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");

    }


    function validateCourseForm() {

        const courseCode =
            document.getElementById("courseCode");

        const title =
            document.getElementById("title");

        const credits =
            document.getElementById("credits");

        const deptId =
            document.getElementById("deptId");

        const capacity =
            document.getElementById("capacity");

        const feeAmount =
            document.getElementById("feeAmount");


        const code =
            courseCode.value.trim();

        const courseTitle =
            title.value.trim();


        if (code.length < 2) {

            alert(
                "Course code must contain at least 2 characters."
            );

            courseCode.focus();

            return false;

        }


        if (courseTitle.length < 2) {

            alert(
                "Course title must contain at least 2 characters."
            );

            title.focus();

            return false;

        }


        if (
            credits.value === "" ||
            Number(credits.value) < 1
        ) {

            alert(
                "Credits must be at least 1."
            );

            credits.focus();

            return false;

        }


        if (deptId.value === "") {

            alert(
                "Please select a department."
            );

            deptId.focus();

            return false;

        }


        if (
            capacity.value === "" ||
            Number(capacity.value) < 1
        ) {

            alert(
                "Capacity must be at least 1."
            );

            capacity.focus();

            return false;

        }


        if (
            feeAmount.value === "" ||
            Number(feeAmount.value) < 0
        ) {

            alert(
                "Please enter a valid fee amount."
            );

            feeAmount.focus();

            return false;

        }


        const button =
            document.getElementById("saveButton");

        button.innerHTML =
            '<span class="spinner-border spinner-border-sm"></span> Saving...';

        button.disabled = true;


        return true;

    }


    document
        .querySelectorAll(".menu-item")
        .forEach(item => {

            item.addEventListener("click", function() {

                if (window.innerWidth <= 800) {

                    document
                        .getElementById("sidebar")
                        .classList.remove("show");

                }

            });

        });

</script>


</body>

</html>

