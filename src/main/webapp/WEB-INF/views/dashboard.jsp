
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard | Student Management System</title>

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


        /* ==============================
           LAYOUT
        ============================== */

        .dashboard-container {
            min-height: 100vh;
            display: flex;
        }


        /* ==============================
           SIDEBAR
        ============================== */

        .sidebar {
            width: 260px;
            min-height: 100vh;

            background:
                linear-gradient(
                    180deg,
                    #1B1028 0%,
                    #3B1F52 100%
                );

            color: white;

            position: fixed;
            left: 0;
            top: 0;

            display: flex;
            flex-direction: column;

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

            border-radius: 12px;

            display: flex;
            align-items: center;
            justify-content: center;

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

            flex: 1;
            overflow-y: auto;
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
            font-size: 17px;
            width: 21px;

            text-align: center;
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
            background: rgba(214,165,178,0.12);
            color: #E5C2CB;
        }


        /* ==============================
           MAIN CONTENT
        ============================== */

        .main-content {
            margin-left: 260px;

            width: calc(100% - 260px);

            min-height: 100vh;

            padding: 28px 34px;
        }


        /* ==============================
           HEADER
        ============================== */

        .top-header {
            display: flex;
            justify-content: space-between;
            align-items: center;

            margin-bottom: 28px;
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

            gap: 11px;

            padding: 7px 12px 7px 7px;

            background: white;

            border: 1px solid #DDD2E5;

            border-radius: 40px;

            box-shadow:
                0 4px 15px rgba(36,23,46,0.04);
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

            font-weight: 700;

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


        /* ==============================
           WELCOME CARD
        ============================== */

        .welcome-card {
            position: relative;

            overflow: hidden;

            border-radius: 18px;

            padding: 30px 32px;

            margin-bottom: 25px;

            color: white;

            background:
                linear-gradient(
                    135deg,
                    #3B1F52,
                    #6D3FA0
                );

            box-shadow:
                0 15px 35px rgba(36,23,46,0.18);
        }


        .welcome-card::before {
            content: "";

            position: absolute;

            width: 260px;
            height: 260px;

            border-radius: 50%;

            background:
                rgba(255,255,255,0.06);

            right: -80px;
            top: -100px;
        }


        .welcome-card::after {
            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            border-radius: 50%;

            border:
                30px solid rgba(255,255,255,0.05);

            right: 80px;
            bottom: -100px;
        }


        .welcome-content {
            position: relative;
            z-index: 2;
        }


        .welcome-tag {
            display: inline-flex;
            align-items: center;

            gap: 7px;

            padding: 7px 12px;

            background:
                rgba(255,255,255,0.12);

            border:
                1px solid rgba(255,255,255,0.16);

            border-radius: 30px;

            font-size: 11px;

            margin-bottom: 14px;
        }


        .welcome-card h2 {
            margin: 0 0 8px;

            font-size: 25px;
            font-weight: 800;
        }


        .welcome-card p {
            margin: 0;

            max-width: 650px;

            color:
                rgba(255,255,255,0.80);

            font-size: 13px;

            line-height: 1.7;
        }


        /* ==============================
           STATISTICS
        ============================== */

        .stats-grid {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 18px;

            margin-bottom: 25px;
        }


        .stat-card {
            background: white;

            border: 1px solid #DDD2E5;

            border-radius: 16px;

            padding: 20px;

            position: relative;

            overflow: hidden;

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease;
        }


        .stat-card:hover {
            transform: translateY(-4px);

            box-shadow:
                0 15px 30px rgba(36,23,46,0.08);
        }


        .stat-top {
            display: flex;

            justify-content: space-between;

            align-items: flex-start;
        }


        .stat-icon {
            width: 45px;
            height: 45px;

            border-radius: 12px;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 20px;
        }


        .students-icon {
            background: #EEE5F5;
            color: #6D3FA0;
        }


        .departments-icon {
            background: #F3EEF7;
            color: #6D3FA0;
        }


        .courses-icon {
            background: #F1F7F3;
            color: #477A58;
        }


        .enrollment-icon {
            background: #F8F3E7;
            color: #A87820;
        }


        .stat-label {
            margin-top: 18px;

            color: #786B82;

            font-size: 12px;
            font-weight: 500;
        }


        .stat-number {
            margin-top: 4px;

            color: #24172E;

            font-size: 28px;
            font-weight: 800;
        }


        /* ==============================
           LOWER SECTION
        ============================== */

        .content-grid {
            display: grid;

            grid-template-columns:
                1.5fr 1fr;

            gap: 20px;
        }


        .dashboard-card {
            background: white;

            border: 1px solid #DDD2E5;

            border-radius: 16px;

            padding: 22px;
        }


        .card-heading {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 20px;
        }


        .card-heading h3 {
            margin: 0;

            font-size: 15px;
            font-weight: 700;

            color: #24172E;
        }


        .card-heading span {
            font-size: 11px;
            color: #786B82;
        }


        /* ==============================
           QUICK ACTIONS
        ============================== */

        .quick-actions {
            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 12px;
        }


        .quick-action {
            display: flex;
            align-items: center;

            gap: 12px;

            padding: 15px;

            border:
                1px solid #DDD2E5;

            border-radius: 12px;

            text-decoration: none;

            color: #4B286B;

            transition: all 0.2s ease;
        }


        .quick-action:hover {
            border-color: #CDB1E8;

            background: #FAF8FC;

            transform: translateY(-2px);
        }


        .quick-icon {
            width: 40px;
            height: 40px;

            flex-shrink: 0;

            border-radius: 10px;

            background: #EEE5F5;

            color: #6D3FA0;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 18px;
        }


        .quick-action strong {
            display: block;

            font-size: 12px;

            margin-bottom: 3px;

            color: #24172E;
        }


        .quick-action span {
            font-size: 10px;

            color: #786B82;
        }


        /* ==============================
           SYSTEM INFO
        ============================== */

        .info-list {
            display: flex;
            flex-direction: column;

            gap: 13px;
        }


        .info-item {
            display: flex;
            align-items: center;

            gap: 12px;

            padding-bottom: 13px;

            border-bottom:
                1px solid #EEE5F5;
        }


        .info-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }


        .info-item i {
            width: 34px;
            height: 34px;

            border-radius: 9px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #EEE5F5;

            color: #6D3FA0;

            font-size: 15px;
        }


        .info-item strong {
            display: block;

            font-size: 11px;

            color: #4B286B;
        }


        .info-item span {
            display: block;

            font-size: 10px;

            color: #786B82;

            margin-top: 2px;
        }


        /* ==============================
           MOBILE BUTTON
        ============================== */

        .mobile-menu-btn {
            display: none;

            border: none;

            background: white;

            width: 42px;
            height: 42px;

            border-radius: 10px;

            box-shadow:
                0 3px 12px rgba(36,23,46,0.08);

            font-size: 20px;

            color: #4B286B;
        }


        /* ==============================
           RESPONSIVE
        ============================== */

        @media (max-width: 1100px) {

            .stats-grid {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .content-grid {
                grid-template-columns: 1fr;
            }

        }


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


            .top-header {
                gap: 15px;
            }


            .page-title {
                font-size: 21px;
            }


            .admin-details {
                display: none;
            }

        }


        @media (max-width: 600px) {

            .stats-grid {
                grid-template-columns: 1fr;
            }


            .quick-actions {
                grid-template-columns: 1fr;
            }


            .welcome-card {
                padding: 25px;
            }


            .welcome-card h2 {
                font-size: 21px;
            }


            .top-header {
                align-items: flex-start;
            }


            .admin-profile {
                padding: 4px;
            }


            .admin-avatar {
                width: 34px;
                height: 34px;
            }

        }


    </style>

</head>


<body>


<div class="dashboard-container">


    <!-- ==============================
         SIDEBAR
    =============================== -->

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



    <!-- ==============================
         MAIN CONTENT
    =============================== -->

    <main class="main-content">


        <!-- HEADER -->

        <header class="top-header">


            <div class="d-flex align-items-center gap-3">

                <button
                    class="mobile-menu-btn"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>


                <div>

                    <h1 class="page-title">
                        Admin Dashboard
                    </h1>

                    <p class="page-subtitle">
                        Overview of your university management system
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



        <!-- WELCOME -->

        <section class="welcome-card">

            <div class="welcome-content">

                <div class="welcome-tag">

                    <i class="bi bi-stars"></i>

                    Administration Overview

                </div>


                <h2>
                    Welcome back, ${sessionScope.admin.name}!
                </h2>


                <p>
                    Manage students, academic departments, courses,
                    faculty assignments, enrollments and fee payments
                    from one centralized administration portal.
                </p>

            </div>

        </section>



        <!-- STATISTICS -->

        <section class="stats-grid">


            <!-- Students -->

            <div class="stat-card">

                <div class="stat-top">

                    <div>

                        <div class="stat-label">
                            Total Students
                        </div>

                        <div class="stat-number"
                             data-value="${totalStudents}">
                            0
                        </div>

                    </div>

                    <div class="stat-icon students-icon">

                        <i class="bi bi-people-fill"></i>

                    </div>

                </div>

            </div>


            <!-- Departments -->

            <div class="stat-card">

                <div class="stat-top">

                    <div>

                        <div class="stat-label">
                            Departments
                        </div>

                        <div class="stat-number"
                             data-value="${totalDepartments}">
                            0
                        </div>

                    </div>

                    <div class="stat-icon departments-icon">

                        <i class="bi bi-building-fill"></i>

                    </div>

                </div>

            </div>


            <!-- Courses -->

            <div class="stat-card">

                <div class="stat-top">

                    <div>

                        <div class="stat-label">
                            Total Courses
                        </div>

                        <div class="stat-number"
                             data-value="${totalCourses}">
                            0
                        </div>

                    </div>

                    <div class="stat-icon courses-icon">

                        <i class="bi bi-book-fill"></i>

                    </div>

                </div>

            </div>


            <!-- Enrollments -->

            <div class="stat-card">

                <div class="stat-top">

                    <div>

                        <div class="stat-label">
                            Enrollments
                        </div>

                        <div class="stat-number"
                             data-value="${totalEnrollments}">
                            0
                        </div>

                    </div>

                    <div class="stat-icon enrollment-icon">

                        <i class="bi bi-journal-check"></i>

                    </div>

                </div>

            </div>


        </section>



        <!-- LOWER CONTENT -->

        <section class="content-grid">


            <!-- QUICK ACTIONS -->

            <div class="dashboard-card">

                <div class="card-heading">

                    <h3>
                        Quick Actions
                    </h3>

                    <span>
                        Frequently used
                    </span>

                </div>


                <div class="quick-actions">


                    <a
                        href="${pageContext.request.contextPath}/admin/students/add"
                        class="quick-action">

                        <div class="quick-icon">

                            <i class="bi bi-person-plus-fill"></i>

                        </div>

                        <div>

                            <strong>
                                Add Student
                            </strong>

                            <span>
                                Register a new student
                            </span>

                        </div>

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/admin/departments/add"
                        class="quick-action">

                        <div class="quick-icon">

                            <i class="bi bi-building-add"></i>

                        </div>

                        <div>

                            <strong>
                                Add Department
                            </strong>

                            <span>
                                Create academic department
                            </span>

                        </div>

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/admin/courses/add"
                        class="quick-action">

                        <div class="quick-icon">

                            <i class="bi bi-journal-plus"></i>

                        </div>

                        <div>

                            <strong>
                                Add Course
                            </strong>

                            <span>
                                Add a new academic course
                            </span>

                        </div>

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/admin/faculty-assignment"
                        class="quick-action">

                        <div class="quick-icon">

                            <i class="bi bi-person-workspace"></i>

                        </div>

                        <div>

                            <strong>
                                Assign Faculty
                            </strong>

                            <span>
                                Assign faculty to courses
                            </span>

                        </div>

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/admin/enrollments"
                        class="quick-action">

                        <div class="quick-icon">

                            <i class="bi bi-check2-square"></i>

                        </div>

                        <div>

                            <strong>
                                Manage Enrollments
                            </strong>

                            <span>
                                Review student enrollments
                            </span>

                        </div>

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/admin/payments"
                        class="quick-action">

                        <div class="quick-icon">

                            <i class="bi bi-receipt"></i>

                        </div>

                        <div>

                            <strong>
                                View Payments
                            </strong>

                            <span>
                                Check fee transactions
                            </span>

                        </div>

                    </a>


                </div>

            </div>



            <!-- SYSTEM INFORMATION -->

            <div class="dashboard-card">

                <div class="card-heading">

                    <h3>
                        System Overview
                    </h3>

                    <span>
                        Portal
                    </span>

                </div>


                <div class="info-list">


                    <div class="info-item">

                        <i class="bi bi-mortarboard-fill"></i>

                        <div>

                            <strong>
                                Academic Management
                            </strong>

                            <span>
                                Students, courses and departments
                            </span>

                        </div>

                    </div>


                    <div class="info-item">

                        <i class="bi bi-person-workspace"></i>

                        <div>

                            <strong>
                                Faculty Management
                            </strong>

                            <span>
                                Faculty course assignments
                            </span>

                        </div>

                    </div>


                    <div class="info-item">

                        <i class="bi bi-journal-check"></i>

                        <div>

                            <strong>
                                Enrollment Management
                            </strong>

                            <span>
                                Monitor course registrations
                            </span>

                        </div>

                    </div>


                    <div class="info-item">

                        <i class="bi bi-credit-card"></i>

                        <div>

                            <strong>
                                Fee Management
                            </strong>

                            <span>
                                Monitor student payments
                            </span>

                        </div>

                    </div>


                </div>

            </div>


        </section>


    </main>

</div>



<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


<script>

    /* ==============================
       MOBILE SIDEBAR
    ============================== */

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");

    }


    /* ==============================
       ANIMATED STATISTICS
    ============================== */

    function animateCounters() {

        const counters =
            document.querySelectorAll(".stat-number");

        counters.forEach(counter => {

            const target =
                parseInt(counter.dataset.value) || 0;

            let current = 0;

            const duration = 900;

            const startTime =
                performance.now();


            function update(currentTime) {

                const progress =
                    Math.min(
                        (currentTime - startTime) / duration,
                        1
                    );


                const eased =
                    1 - Math.pow(1 - progress, 3);


                current =
                    Math.floor(target * eased);


                counter.innerText =
                    current.toLocaleString();


                if (progress < 1) {

                    requestAnimationFrame(update);

                } else {

                    counter.innerText =
                        target.toLocaleString();

                }

            }


            requestAnimationFrame(update);

        });

    }


    document.addEventListener(
        "DOMContentLoaded",
        animateCounters
    );

</script>


</body>

</html>
