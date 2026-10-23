
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Roster</title>

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
            background: white;
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
        }

        .admin-details span {
            font-size: 10px;
            color: #786B82;
        }

        /* ================= ROSTER ================= */

        .roster-section {
            padding: 0;
        }

        .roster-card {
            background: white;
            border-radius: 14px;
            padding: 28px;
            border: 1px solid #DDD2E5;
            box-shadow: 0 4px 15px rgba(36,23,46,0.06);
        }

        .roster-heading {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 25px;
        }

        .roster-heading h2 {
            margin: 0 0 6px;
            color: #24172E;
            font-size: 20px;
            font-weight: 800;
        }

        .roster-heading p {
            margin: 0;
            color: #786B82;
            font-size: 13px;
        }

        .roster-icon {
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #EEE5F5;
            color: #6D3FA0;
            border-radius: 11px;
            font-size: 19px;
        }

        /* ================= COURSE SELECTION ================= */

        .course-list {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .course-item {
            border: 1px solid #DDD2E5;
            border-radius: 14px;
            padding: 22px;
            transition: all 0.2s ease;
        }

        .course-item:hover {
            border-color: #CDB1E8;
            box-shadow: 0 8px 20px rgba(36,23,46,0.07);
            transform: translateY(-2px);
        }

        .course-item-icon {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #EEE5F5;
            color: #6D3FA0;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .course-code {
            font-size: 17px;
            font-weight: 800;
            color: #24172E;
            margin-bottom: 7px;
        }

        .course-title {
            color: #4B286B;
            font-size: 13px;
            margin-bottom: 10px;
        }

        .course-semester {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #786B82;
            background: #F8F6FA;
            padding: 6px 9px;
            border-radius: 7px;
            font-size: 11px;
            margin-bottom: 17px;
        }

        .view-button {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 9px 14px;
            background: #6D3FA0;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 11px;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .view-button:hover {
            background: #4B286B;
            color: white;
        }

        /* ================= TABLE ================= */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #DDD2E5;
            border-radius: 12px;
        }

        .roster-table {
            width: 100%;
            min-width: 850px;
            border-collapse: collapse;
        }

        .roster-table th {
            background: #FAF8FC;
            color: #786B82;
            padding: 13px 15px;
            text-align: left;
            font-size: 11px;
            font-weight: 700;
            border-bottom: 1px solid #DDD2E5;
            white-space: nowrap;
        }

        .roster-table td {
            padding: 14px 15px;
            border-bottom: 1px solid #EEE5F5;
            color: #4B286B;
            font-size: 12px;
            white-space: nowrap;
        }

        .roster-table tbody tr:last-child td {
            border-bottom: none;
        }

        .roster-table tbody tr:hover {
            background: #FAF8FC;
        }

        .roll-number {
            font-weight: 700;
            color: #6D3FA0;
        }

        .student-name {
            font-weight: 600;
            color: #24172E;
        }

        .status {
            display: inline-flex;
            align-items: center;
            padding: 5px 10px;
            border-radius: 20px;
            background: #F1F7F3;
            color: #477A58;
            font-size: 10px;
            font-weight: 600;
        }

        .empty-message {
            padding: 35px 20px;
            text-align: center;
            background: #FAF8FC;
            border: 1px dashed #DDD2E5;
            border-radius: 12px;
            color: #786B82;
            font-size: 13px;
        }

        .empty-message i {
            display: block;
            font-size: 30px;
            color: #6D3FA0;
            margin-bottom: 10px;
        }

        /* ================= BUTTONS ================= */

        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 22px;
        }

        .action-button {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 10px 15px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 11px;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .download-button {
            background: #6D3FA0;
            color: white;
        }

        .download-button:hover {
            background: #4B286B;
            color: white;
        }

        .back-button {
            background: #FAF8FC;
            color: #4B286B;
        }

        .back-button:hover {
            background: #EEE5F5;
            color: #24172E;
        }

        .mobile-menu-btn {
            display: none;
            width: 42px;
            height: 42px;
            border: none;
            border-radius: 10px;
            background: white;
            color: #4B286B;
            font-size: 20px;
        }

        /* ================= RESPONSIVE ================= */

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

            .course-list {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {

            .page-title {
                font-size: 21px;
            }

            .roster-card {
                padding: 20px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .action-button {
                justify-content: center;
            }
        }

    </style>

</head>

<body>

<div class="dashboard-container">

    <!-- SIDEBAR -->

    <aside class="sidebar" id="sidebar">

        <div class="sidebar-brand">

            <div class="brand-icon">
                <i class="bi bi-mortarboard-fill"></i>
            </div>

            <div class="brand-text">
                Student Management

                <span class="brand-subtitle">
                    Faculty Portal
                </span>
            </div>

        </div>


        <nav class="sidebar-menu">

            <div class="menu-label">
                MAIN MENU
            </div>


            <a
                href="${pageContext.request.contextPath}/faculty/dashboard"
                class="menu-item">

                <i class="bi bi-grid-1x2-fill"></i>

                Dashboard

            </a>


            <a
                href="${pageContext.request.contextPath}/faculty/courses"
                class="menu-item">

                <i class="bi bi-journal-bookmark-fill"></i>

                Assigned Courses

            </a>


            <a
                href="${pageContext.request.contextPath}/faculty/roster"
                class="menu-item">

                <i class="bi bi-people-fill"></i>

                Student Roster

            </a>


            <div class="menu-label">
                ACCOUNT
            </div>


            <a
                href="${pageContext.request.contextPath}/faculty/logout"
                class="menu-item logout-link">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>

        </nav>

    </aside>


    <!-- MAIN CONTENT -->

    <main class="main-content">

        <header class="top-header">

            <div style="display:flex; align-items:center; gap:12px;">

                <button
                    class="mobile-menu-btn"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>


                <div>

                    <h1 class="page-title">
                        Student Roster
                    </h1>

                    <p class="page-subtitle">
                        View students enrolled in your assigned courses
                    </p>

                </div>

            </div>


            <div class="admin-profile">

                <div class="admin-avatar">

                    <i class="bi bi-person-workspace"></i>

                </div>


                <div class="admin-details">

                    <strong>
                        ${sessionScope.faculty.name}
                    </strong>

                    <span>
                        Faculty / Instructor
                    </span>

                </div>

            </div>

        </header>


        <section class="roster-section">

            <div class="roster-card">


                <!-- NO COURSE SELECTED -->

                <c:if test="${empty courseId}">

                    <div class="roster-heading">

                        <div>

                            <h2>
                                Select Course
                            </h2>

                            <p>
                                Select one of your assigned courses
                                to view the enrolled students.
                            </p>

                        </div>

                        <div class="roster-icon">

                            <i class="bi bi-people-fill"></i>

                        </div>

                    </div>


                    <c:choose>

                        <c:when test="${not empty courses}">

                            <div class="course-list">

                                <c:forEach
                                    var="course"
                                    items="${courses}">

                                    <div class="course-item">

                                        <div class="course-item-icon">

                                            <i class="bi bi-journal-text"></i>

                                        </div>


                                        <div class="course-code">
                                            ${course.courseCode}
                                        </div>


                                        <div class="course-title">
                                            ${course.courseTitle}
                                        </div>


                                        <div class="course-semester">

                                            <i class="bi bi-calendar3"></i>

                                            Semester:
                                            ${course.semester}

                                        </div>


                                        <br>


                                        <a
                                            href="${pageContext.request.contextPath}/faculty/roster?courseId=${course.courseId}"
                                            class="view-button">

                                            <i class="bi bi-people-fill"></i>

                                            View Student Roster

                                            <i class="bi bi-arrow-right"></i>

                                        </a>

                                    </div>

                                </c:forEach>

                            </div>

                        </c:when>


                        <c:otherwise>

                            <div class="empty-message">

                                <i class="bi bi-journal-x"></i>

                                No courses have been assigned to you.

                            </div>

                        </c:otherwise>

                    </c:choose>

                </c:if>


                <!-- COURSE SELECTED -->

                <c:if test="${not empty courseId}">

                    <div class="roster-heading">

                        <div>

                            <h2>
                                Enrolled Students
                            </h2>

                            <p>
                                Student list for the selected course
                            </p>

                        </div>

                        <div class="roster-icon">

                            <i class="bi bi-people-fill"></i>

                        </div>

                    </div>


                    <c:choose>

                        <c:when test="${not empty roster}">

                            <div class="table-wrapper">

                                <table class="roster-table">

                                    <thead>

                                        <tr>

                                            <th>
                                                Roll Number
                                            </th>

                                            <th>
                                                Student Name
                                            </th>

                                            <th>
                                                Email
                                            </th>

                                            <th>
                                                Course
                                            </th>

                                            <th>
                                                Semester
                                            </th>

                                            <th>
                                                Status
                                            </th>

                                        </tr>

                                    </thead>


                                    <tbody>

                                        <c:forEach
                                            var="student"
                                            items="${roster}">

                                            <tr>

                                                <td class="roll-number">
                                                    ${student.rollNumber}
                                                </td>


                                                <td class="student-name">
                                                    ${student.studentName}
                                                </td>


                                                <td>
                                                    ${student.email}
                                                </td>


                                                <td>
                                                    ${student.courseCode}
                                                    -
                                                    ${student.courseTitle}
                                                </td>


                                                <td>
                                                    ${student.semester}
                                                </td>


                                                <td>

                                                    <span class="status">

                                                        <i class="bi bi-check-circle-fill me-1"></i>

                                                        ${student.enrollmentStatus}

                                                    </span>

                                                </td>

                                            </tr>

                                        </c:forEach>

                                    </tbody>

                                </table>

                            </div>

                        </c:when>


                        <c:otherwise>

                            <div class="empty-message">

                                <i class="bi bi-person-x"></i>

                                No students are currently enrolled
                                in this course.

                            </div>

                        </c:otherwise>

                    </c:choose>


                    <div class="action-buttons">

                        <a
                            href="${pageContext.request.contextPath}/faculty/roster/download?courseId=${courseId}"
                            class="action-button download-button">

                            <i class="bi bi-download"></i>

                            Download Student List

                        </a>


                        <a
                            href="${pageContext.request.contextPath}/faculty/roster"
                            class="action-button back-button">

                            <i class="bi bi-arrow-left"></i>

                            Back to Courses

                        </a>

                    </div>

                </c:if>

            </div>

        </section>

    </main>

</div>


<script>

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

</script>

</body>
</html>
