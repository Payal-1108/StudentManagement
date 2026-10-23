
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Enrollments</title>

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
           ========================= */

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
           ========================= */

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
           ENROLLMENT CARD
           ========================= */

        .enrollment-card {
            width: 100%;
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(36,23,46,0.05);
            overflow: hidden;
        }

        .enrollment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 22px 26px;
            border-bottom: 1px solid #EEE5F5;
        }

        .enrollment-heading {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .enrollment-heading-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 11px;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 18px;
        }

        .enrollment-heading h2 {
            margin: 0;
            font-size: 17px;
            font-weight: 800;
            color: #24172E;
        }

        .enrollment-heading p {
            margin: 3px 0 0;
            color: #786B82;
            font-size: 10px;
        }

        .enrollment-count {
            padding: 7px 12px;
            border-radius: 20px;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 10px;
            font-weight: 700;
        }


        /* =========================
           TABLE
           ========================= */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .enrollment-table {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
        }

        .enrollment-table th {
            padding: 13px 18px;
            text-align: left;
            background: #FAF8FC;
            color: #786B82;
            border-bottom: 1px solid #DDD2E5;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .enrollment-table td {
            padding: 17px 18px;
            border-bottom: 1px solid #EEE5F5;
            color: #4B286B;
            font-size: 11px;
            vertical-align: middle;
        }

        .enrollment-table tbody tr {
            transition: background 0.2s ease;
        }

        .enrollment-table tbody tr:hover {
            background: #FAF8FC;
        }

        .enrollment-table tbody tr:last-child td {
            border-bottom: none;
        }


        /* =========================
           COURSE CODE
           ========================= */

        .course-code {
            color: #6D3FA0;
            font-weight: 700;
            font-size: 11px;
        }

        .course-code-wrapper {
            display: flex;
            align-items: center;
            gap: 9px;
        }

        .course-icon {
            width: 34px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 9px;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 14px;
        }


        /* =========================
           COURSE TITLE
           ========================= */

        .course-title {
            color: #24172E;
            font-weight: 600;
            font-size: 12px;
        }


        /* =========================
           CREDITS
           ========================= */

        .credits-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 6px 9px;
            border-radius: 7px;
            background: #F3EEF7;
            color: #4B286B;
            font-size: 10px;
            font-weight: 600;
        }

        .credits-badge i {
            color: #6D3FA0;
        }


        /* =========================
           SEMESTER
           ========================= */

        .semester-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 6px 9px;
            border-radius: 7px;
            background: #F8F6FA;
            border: 1px solid #DDD2E5;
            color: #4B286B;
            font-size: 10px;
            font-weight: 600;
        }


        /* =========================
           DATE
           ========================= */

        .date {
            color: #786B82;
            white-space: nowrap;
        }


        /* =========================
           FEE
           ========================= */

        .fee {
            color: #477A58;
            font-size: 11px;
            font-weight: 700;
        }


        /* =========================
           STATUS
           ========================= */

        .status {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 6px 10px;
            border-radius: 20px;
            background: #F1F7F3;
            color: #477A58;
            font-size: 9px;
            font-weight: 700;
        }

        .status::before {
            content: "";
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: currentColor;
        }

        .dropped-text {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            color: #B4475B;
            font-size: 10px;
            font-weight: 700;
        }

        .dropped-text::before {
            content: "";
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: currentColor;
        }


        /* =========================
           DROP BUTTON
           ========================= */

        .drop-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 11px;
            border-radius: 8px;
            background: #F8EDEF;
            border: 1px solid #E8C8D0;
            color: #B4475B;
            text-decoration: none;
            font-size: 10px;
            font-weight: 700;
            transition: all 0.2s ease;
        }

        .drop-btn:hover {
            background: #F3DDE2;
            color: #9B3D52;
        }


        /* =========================
           EMPTY STATE
           ========================= */

        .no-enrollment {
            padding: 70px 25px;
            text-align: center;
        }

        .empty-icon {
            width: 64px;
            height: 64px;
            margin: 0 auto 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 27px;
        }

        .no-enrollment h3 {
            margin: 0 0 8px;
            color: #24172E;
            font-size: 17px;
            font-weight: 700;
        }

        .no-enrollment p {
            margin: 0 auto 24px;
            max-width: 420px;
            color: #786B82;
            font-size: 11px;
        }

        .browse-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 11px 17px;
            background: #6D3FA0;
            color: white;
            text-decoration: none;
            border-radius: 9px;
            font-size: 11px;
            font-weight: 700;
            box-shadow: 0 6px 14px rgba(109,63,160,0.16);
            transition: all 0.2s ease;
        }

        .browse-btn:hover {
            background: #4B286B;
            color: white;
            transform: translateY(-1px);
        }


        /* =========================
           MOBILE MENU
           ========================= */

        .mobile-menu-btn {
            display: none;
            width: 42px;
            height: 42px;
            border: none;
            border-radius: 10px;
            background: white;
            color: #4B286B;
            font-size: 20px;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
        }


        /* =========================
           RESPONSIVE
           ========================= */

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

        }


        @media (max-width: 650px) {

            .page-title {
                font-size: 21px;
            }

            .enrollment-header {
                padding: 18px;
            }

            .enrollment-count {
                display: none;
            }

            .no-enrollment {
                padding: 55px 20px;
            }

        }

    </style>

</head>


<body>


<div class="dashboard-container">


    <!-- =========================
         SIDEBAR
         ========================= -->

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

                Fee & Receipt

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
         ========================= -->

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
                    My Enrollments
                </h1>

                <p class="page-subtitle">
                    View and manage the courses you are currently enrolled in.
                </p>

            </div>


            <div class="student-profile">

                <div class="student-avatar">

                    <i class="bi bi-person-fill"></i>

                </div>

                <div class="student-details">

                    <strong>
                        ${sessionScope.student.name}
                    </strong>

                    <span>
                        Student
                    </span>

                </div>

            </div>

        </div>


        <!-- =========================
             ENROLLMENT CARD
             ========================= -->

        <div class="enrollment-card">


            <div class="enrollment-header">

                <div class="enrollment-heading">

                    <div class="enrollment-heading-icon">

                        <i class="bi bi-journal-check"></i>

                    </div>

                    <div>

                        <h2>
                            Enrolled Courses
                        </h2>

                        <p>
                            Your current course enrollment details
                        </p>

                    </div>

                </div>


                <c:if test="${not empty enrollments}">

                    <div class="enrollment-count">

                        ${enrollments.size()} Enrollments

                    </div>

                </c:if>

            </div>


            <c:choose>

                <c:when test="${not empty enrollments}">

                    <div class="table-wrapper">

                        <table class="enrollment-table">

                            <thead>

                                <tr>

                                    <th>
                                        Course Code
                                    </th>

                                    <th>
                                        Course Title
                                    </th>

                                    <th>
                                        Credits
                                    </th>

                                    <th>
                                        Semester
                                    </th>

                                    <th>
                                        Enrollment Date
                                    </th>

                                    <th>
                                        Fee
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                    <th>
                                        Action
                                    </th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:forEach
                                    var="enrollment"
                                    items="${enrollments}">

                                    <tr>


                                        <!-- COURSE CODE -->

                                        <td>

                                            <div class="course-code-wrapper">

                                                <div class="course-icon">

                                                    <i class="bi bi-book-fill"></i>

                                                </div>

                                                <span class="course-code">

                                                    ${enrollment.courseCode}

                                                </span>

                                            </div>

                                        </td>


                                        <!-- COURSE TITLE -->

                                        <td>

                                            <span class="course-title">

                                                ${enrollment.courseTitle}

                                            </span>

                                        </td>


                                        <!-- CREDITS -->

                                        <td>

                                            <span class="credits-badge">

                                                <i class="bi bi-award"></i>

                                                ${enrollment.credits}

                                            </span>

                                        </td>


                                        <!-- SEMESTER -->

                                        <td>

                                            <span class="semester-badge">

                                                <i class="bi bi-calendar3"></i>

                                                ${enrollment.semester}

                                            </span>

                                        </td>


                                        <!-- DATE -->

                                        <td class="date">

                                            ${enrollment.enrollmentDate}

                                        </td>


                                        <!-- FEE -->

                                        <td>

                                            <span class="fee">

                                                Rs. ${enrollment.feeAmount}

                                            </span>

                                        </td>


                                        <!-- STATUS -->

                                        <td>

                                            <c:if
                                                test="${enrollment.status == 'Enrolled'}">

                                                <span class="status">

                                                    ${enrollment.status}

                                                </span>

                                            </c:if>


                                            <c:if
                                                test="${enrollment.status != 'Enrolled'}">

                                                <span class="dropped-text">

                                                    ${enrollment.status}

                                                </span>

                                            </c:if>

                                        </td>


                                        <!-- ACTION -->

                                        <td>

                                            <c:if
                                                test="${enrollment.status == 'Enrolled'}">

                                                <a
                                                    href="${pageContext.request.contextPath}/student/drop?enrollmentId=${enrollment.id}"
                                                    class="drop-btn"
                                                    onclick="return confirm('Are you sure you want to drop this course?');">

                                                    <i class="bi bi-x-circle"></i>

                                                    Drop

                                                </a>

                                            </c:if>


                                            <c:if
                                                test="${enrollment.status == 'Dropped'}">

                                                <span class="dropped-text">

                                                    <i class="bi bi-check2"></i>

                                                    Dropped

                                                </span>

                                            </c:if>

                                        </td>


                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="no-enrollment">

                        <div class="empty-icon">

                            <i class="bi bi-journal-x"></i>

                        </div>

                        <h3>
                            No Enrollments Found
                        </h3>

                        <p>
                            You have not enrolled in any courses yet.
                            Browse the available courses to start your enrollment.
                        </p>


                        <a
                            href="${pageContext.request.contextPath}/student/courses"
                            class="browse-btn">

                            <i class="bi bi-journal-bookmark-fill"></i>

                            Browse Available Courses

                        </a>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

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

