
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Faculty Course Assignment | Student Management</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Inter Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <!-- Main CSS -->
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

        .dashboard-container {
            min-height: 100vh;
            display: flex;
        }

        /* ================= SIDEBAR ================= */

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

        /* ================= MAIN CONTENT ================= */

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

        /* ================= PAGE ACTIONS ================= */

        .page-actions {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .btn-modern {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 15px;
            border-radius: 9px;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .btn-secondary-modern {
            background: #FFFFFF;
            color: #4B286B;
            border: 1px solid #DDD2E5;
        }

        .btn-secondary-modern:hover {
            background: #EEE5F5;
            color: #4B286B;
        }

        .btn-primary-modern {
            background: #6D3FA0;
            color: white;
            border: 1px solid #6D3FA0;
        }

        .btn-primary-modern:hover {
            background: #4B286B;
            color: white;
        }

        /* ================= ASSIGNMENT CARD ================= */

        .assignment-card {
            max-width: 850px;
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(36,23,46,0.05);
            overflow: hidden;
        }

        .assignment-card-header {
            padding: 22px 25px;
            border-bottom: 1px solid #DDD2E5;
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .assignment-icon {
            width: 46px;
            height: 46px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 21px;
        }

        .assignment-card-header h2 {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            color: #24172E;
        }

        .assignment-card-header p {
            margin: 5px 0 0;
            color: #786B82;
            font-size: 12px;
        }

        .assignment-body {
            padding: 25px;
        }

        /* ================= SUCCESS ================= */

        .success-message {
            display: flex;
            align-items: center;
            gap: 9px;
            margin-bottom: 22px;
            padding: 12px 14px;
            background: #EEF6F0;
            border: 1px solid #C9DECf;
            border-radius: 9px;
            color: #477A58;
            font-size: 12px;
            font-weight: 600;
        }

        .success-message i {
            font-size: 16px;
        }

        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 20px;
        }

        .form-label-modern {
            display: block;
            margin-bottom: 7px;
            color: #4B286B;
            font-size: 12px;
            font-weight: 600;
        }

        .required-star {
            color: #B4475B;
        }

        .select-wrapper {
            position: relative;
        }

        .select-wrapper i {
            position: absolute;
            left: 13px;
            top: 50%;
            transform: translateY(-50%);
            color: #786B82;
            font-size: 15px;
            pointer-events: none;
        }

        .form-select-modern {
            width: 100%;
            height: 45px;
            padding: 0 38px;
            border: 1px solid #DDD2E5;
            border-radius: 9px;
            background: #F8F6FA;
            color: #24172E;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            outline: none;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .form-select-modern:focus {
            border-color: #6D3FA0;
            box-shadow: 0 0 0 3px rgba(109,63,160,0.10);
            background: #FFFFFF;
        }

        .form-help {
            margin-top: 6px;
            color: #786B82;
            font-size: 10px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        /* ================= BUTTON ================= */

        .form-actions {
            display: flex;
            justify-content: flex-end;
            margin-top: 25px;
            padding-top: 22px;
            border-top: 1px solid #DDD2E5;
        }

        .assign-button {
            min-width: 155px;
            height: 43px;
            padding: 0 18px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            background: #6D3FA0;
            color: white;
            border: none;
            border-radius: 9px;
            font-family: 'Inter', sans-serif;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .assign-button:hover {
            background: #4B286B;
        }

        .assign-button:disabled {
            opacity: 0.7;
            cursor: not-allowed;
        }

        /* ================= NOTE ================= */

        .assignment-note {
            display: flex;
            align-items: flex-start;
            gap: 9px;
            margin-top: 20px;
            padding: 13px 14px;
            background: #F8F6FA;
            border: 1px solid #DDD2E5;
            border-radius: 9px;
            color: #786B82;
            font-size: 11px;
            line-height: 1.5;
        }

        .assignment-note i {
            color: #6D3FA0;
            font-size: 15px;
            margin-top: 1px;
        }

        /* ================= MOBILE ================= */

        .mobile-menu-btn {
            display: none;
            width: 42px;
            height: 42px;
            border: 1px solid #DDD2E5;
            border-radius: 10px;
            background: #FFFFFF;
            color: #4B286B;
            font-size: 20px;
        }

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

            .assignment-card {
                max-width: 100%;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }
        }

        @media (max-width: 600px) {

            .page-title {
                font-size: 21px;
            }

            .assignment-card-header,
            .assignment-body {
                padding: 20px;
            }

            .form-actions {
                justify-content: stretch;
            }

            .assign-button {
                width: 100%;
            }

        }

    </style>

</head>

<body>

<div class="dashboard-container">

    <!-- ================= SIDEBAR ================= -->

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


            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="menu-item">

                <i class="bi bi-grid-1x2-fill"></i>
                Dashboard

            </a>


            <a href="${pageContext.request.contextPath}/admin/students"
               class="menu-item">

                <i class="bi bi-people-fill"></i>
                Students

            </a>


            <a href="${pageContext.request.contextPath}/admin/departments"
               class="menu-item">

                <i class="bi bi-building-fill"></i>
                Departments

            </a>


            <a href="${pageContext.request.contextPath}/admin/courses"
               class="menu-item">

                <i class="bi bi-journal-bookmark-fill"></i>
                Courses

            </a>


            <a href="${pageContext.request.contextPath}/admin/faculty-assignment"
               class="menu-item">

                <i class="bi bi-person-workspace"></i>
                Faculty

            </a>


            <div class="menu-label">
                ACADEMIC
            </div>


            <a href="${pageContext.request.contextPath}/admin/enrollments"
               class="menu-item">

                <i class="bi bi-journal-check"></i>
                Enrollments

            </a>


            <a href="${pageContext.request.contextPath}/admin/payments"
               class="menu-item">

                <i class="bi bi-credit-card-fill"></i>
                Payments

            </a>


            <div class="menu-label">
                ACCOUNT
            </div>


            <a href="${pageContext.request.contextPath}/admin/logout"
               class="menu-item logout-link">

                <i class="bi bi-box-arrow-right"></i>
                Logout

            </a>

        </nav>

    </aside>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="main-content">

        <!-- HEADER -->

        <div class="top-header">

            <div style="display:flex; align-items:flex-start; gap:12px;">

                <button class="mobile-menu-btn"
                        type="button"
                        onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>

                <div>

                    <h1 class="page-title">
                        Faculty Course Assignment
                    </h1>

                    <p class="page-subtitle">
                        Assign courses to faculty members
                    </p>

                </div>

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
                        Registrar Admin
                    </span>

                </div>

            </div>

        </div>


        <!-- PAGE ACTIONS -->

        <div class="page-actions">

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="btn-modern btn-secondary-modern">

                <i class="bi bi-arrow-left"></i>
                Back to Dashboard

            </a>

        </div>


        <!-- ================= ASSIGNMENT CARD ================= -->

        <div class="assignment-card">

            <div class="assignment-card-header">

                <div class="assignment-icon">

                    <i class="bi bi-person-workspace"></i>

                </div>

                <div>

                    <h2>
                        Assign Course
                    </h2>

                    <p>
                        Select a faculty member, course and semester
                        to create an assignment.
                    </p>

                </div>

            </div>


            <div class="assignment-body">


                <!-- SUCCESS MESSAGE -->

                <c:if test="${param.success == 'true'}">

                    <div class="success-message">

                        <i class="bi bi-check-circle-fill"></i>

                        Course assigned successfully.

                    </div>

                </c:if>


                <!-- FORM -->

                <form action="${pageContext.request.contextPath}/admin/faculty-assignment"
                      method="post"
                      id="assignmentForm">


                    <!-- FACULTY + COURSE -->

                    <div class="form-row">

                        <!-- FACULTY -->

                        <div class="form-group">

                            <label class="form-label-modern">

                                Faculty Member
                                <span class="required-star">*</span>

                            </label>

                            <div class="select-wrapper">

                                <i class="bi bi-person-badge"></i>

                                <select name="facultyId"
                                        class="form-select-modern"
                                        required>

                                    <option value="">
                                        Select Faculty
                                    </option>

                                    <c:forEach var="faculty"
                                               items="${facultyList}">

                                        <option value="${faculty.id}">

                                            ${faculty.name}
                                            -
                                            ${faculty.email}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>

                            <div class="form-help">
                                Select the faculty member who will teach this course.
                            </div>

                        </div>


                        <!-- COURSE -->

                        <div class="form-group">

                            <label class="form-label-modern">

                                Course
                                <span class="required-star">*</span>

                            </label>

                            <div class="select-wrapper">

                                <i class="bi bi-journal-bookmark"></i>

                                <select name="courseId"
                                        class="form-select-modern"
                                        required>

                                    <option value="">
                                        Select Course
                                    </option>

                                    <c:forEach var="course"
                                               items="${courseList}">

                                        <option value="${course.courseId}">

                                            ${course.courseCode}
                                            -
                                            ${course.courseTitle}

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>

                            <div class="form-help">
                                Select the course to be assigned.
                            </div>

                        </div>

                    </div>


                    <!-- SEMESTER -->

                    <div class="form-group">

                        <label class="form-label-modern">

                            Academic Semester
                            <span class="required-star">*</span>

                        </label>

                        <div class="select-wrapper">

                            <i class="bi bi-calendar3"></i>

                            <select name="semester"
                                    class="form-select-modern"
                                    required>

                                <option value="">
                                    Select Semester
                                </option>

                                <option value="Fall 2026">
                                    Fall 2026
                                </option>

                                <option value="Spring 2027">
                                    Spring 2027
                                </option>

                            </select>

                        </div>

                        <div class="form-help">
                            Choose the semester in which the faculty member will teach.
                        </div>

                    </div>


                    <!-- BUTTON -->

                    <div class="form-actions">

                        <button type="submit"
                                class="assign-button"
                                id="assignButton">

                            <i class="bi bi-person-plus-fill"></i>

                            <span id="assignText">
                                Assign Course
                            </span>

                        </button>

                    </div>

                </form>


                <!-- NOTE -->

                <div class="assignment-note">

                    <i class="bi bi-info-circle-fill"></i>

                    <span>
                        Faculty members can be assigned to courses
                        for a specific academic semester.
                    </span>

                </div>

            </div>

        </div>

    </main>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script>

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");

    }


    document.querySelectorAll(".menu-item")
        .forEach(function(item) {

            item.addEventListener("click", function() {

                if (window.innerWidth <= 800) {

                    document
                        .getElementById("sidebar")
                        .classList.remove("show");

                }

            });

        });


    document.getElementById("assignmentForm")
        .addEventListener("submit", function() {

            const button =
                document.getElementById("assignButton");

            const text =
                document.getElementById("assignText");

            button.disabled = true;

            text.innerHTML =
                '<span class="spinner-border spinner-border-sm"></span> Assigning...';

        });

</script>

</body>
</html>

