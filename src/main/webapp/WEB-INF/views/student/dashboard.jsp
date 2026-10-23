
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Dashboard</title>

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

        /* No active color - sidebar stays same on every page */

        .logout-link {
            color: #D6A5B2;
        }

        .logout-link:hover {
            color: #E5C2CB;
            background: rgba(180,70,90,0.12);
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

        /* =========================
           STUDENT PROFILE
           ========================= */

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
           WELCOME BANNER
           ========================= */

        .welcome-banner {
            position: relative;
            overflow: hidden;
            background: linear-gradient(
                135deg,
                #3B1F52,
                #6D3FA0
            );
            color: white;
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 25px;
            box-shadow: 0 10px 25px rgba(36,23,46,0.18);
        }

        .welcome-banner::after {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            right: -80px;
            top: -100px;
            background: rgba(255,255,255,0.08);
        }

        .welcome-content {
            position: relative;
            z-index: 2;
        }

        .welcome-label {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            color: rgba(255,255,255,0.70);
            margin-bottom: 8px;
        }

        .welcome-title {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
        }

        .welcome-text {
            margin: 9px 0 0;
            max-width: 650px;
            font-size: 13px;
            line-height: 1.7;
            color: rgba(255,255,255,0.78);
        }

        /* =========================
           PROFILE INFORMATION
           ========================= */

        .section-title {
            font-size: 17px;
            font-weight: 800;
            margin: 0 0 15px;
        }

        .profile-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-bottom: 25px;
        }

        .profile-card {
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 14px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(36,23,46,0.05);
            transition: 0.2s ease;
        }

        .profile-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(36,23,46,0.08);
        }

        .profile-icon {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #EEE5F5;
            color: #6D3FA0;
            margin-bottom: 14px;
            font-size: 17px;
        }

        .profile-label {
            display: block;
            color: #786B82;
            font-size: 10px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }

        .profile-value {
            display: block;
            color: #24172E;
            font-size: 13px;
            font-weight: 700;
            word-break: break-word;
        }

        /* =========================
           QUICK ACTIONS
           ========================= */

        .actions-card {
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 4px 15px rgba(36,23,46,0.05);
        }

        .actions-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .actions-header h2 {
            margin: 0;
            font-size: 17px;
            font-weight: 800;
        }

        .actions-header span {
            color: #786B82;
            font-size: 11px;
        }

        .actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 14px;
        }

        .action-button {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 15px;
            border: 1px solid #DDD2E5;
            border-radius: 12px;
            color: #4B286B;
            text-decoration: none;
            font-size: 12px;
            font-weight: 700;
            transition: all 0.2s ease;
        }

        .action-button i {
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 9px;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 16px;
        }

        .action-button:hover {
            border-color: #DDD2E5;
            background: #FAF8FC;
            color: #4B286B;
            transform: translateY(-2px);
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
            background: #FFFFFF;
            color: #4B286B;
            font-size: 20px;
            align-items: center;
            justify-content: center;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 1000px) {

            .profile-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .actions {
                grid-template-columns: 1fr;
            }
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
            }

            .student-details {
                display: none;
            }

            .top-header {
                gap: 15px;
            }
        }

        @media (max-width: 600px) {

            .page-title {
                font-size: 21px;
            }

            .welcome-banner {
                padding: 24px;
            }

            .welcome-title {
                font-size: 20px;
            }

            .profile-grid {
                grid-template-columns: 1fr;
            }

            .actions-card {
                padding: 18px;
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
                    class="mobile-menu-btn"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>

                <h1 class="page-title">
                    Student Dashboard
                </h1>

                <p class="page-subtitle">
                    Manage your academic journey from one place.
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
             WELCOME
             ========================= -->

        <div class="welcome-banner">

            <div class="welcome-content">

                <div class="welcome-label">
                    Student Portal
                </div>

                <h2 class="welcome-title">
                    Welcome, ${student.name}
                </h2>

                <p class="welcome-text">
                    You can manage your academic profile,
                    browse available courses, enroll in subjects,
                    and manage your fees from your student portal.
                </p>

            </div>

        </div>


        <!-- =========================
             PROFILE
             ========================= -->

        <h2 class="section-title">
            Academic Information
        </h2>


        <div class="profile-grid">


            <div class="profile-card">

                <div class="profile-icon">
                    <i class="bi bi-person-badge-fill"></i>
                </div>

                <span class="profile-label">
                    Roll Number
                </span>

                <span class="profile-value">
                    ${student.rollNumber}
                </span>

            </div>


            <div class="profile-card">

                <div class="profile-icon">
                    <i class="bi bi-envelope-fill"></i>
                </div>

                <span class="profile-label">
                    Email Address
                </span>

                <span class="profile-value">
                    ${student.email}
                </span>

            </div>


            <div class="profile-card">

                <div class="profile-icon">
                    <i class="bi bi-building-fill"></i>
                </div>

                <span class="profile-label">
                    Department
                </span>

                <span class="profile-value">
                    ${student.departmentName}
                </span>

            </div>


            <div class="profile-card">

                <div class="profile-icon">
                    <i class="bi bi-mortarboard-fill"></i>
                </div>

                <span class="profile-label">
                    Current Semester
                </span>

                <span class="profile-value">
                    Semester ${student.currentSemester}
                </span>

            </div>


        </div>


        <!-- =========================
             QUICK ACTIONS
             ========================= -->

        <div class="actions-card">

            <div class="actions-header">

                <h2>
                    Quick Actions
                </h2>

                <span>
                    Access your student services
                </span>

            </div>


            <div class="actions">


                <a
                    href="${pageContext.request.contextPath}/student/profile"
                    class="action-button">

                    <i class="bi bi-person-vcard-fill"></i>

                    <span>
                        View Profile
                    </span>

                </a>


                <a
                    href="${pageContext.request.contextPath}/student/courses"
                    class="action-button">

                    <i class="bi bi-journal-bookmark-fill"></i>

                    <span>
                        Browse Courses
                    </span>

                </a>


                <a
                    href="${pageContext.request.contextPath}/student/enrollments"
                    class="action-button">

                    <i class="bi bi-journal-check"></i>

                    <span>
                        My Enrollments
                    </span>

                </a>


            </div>

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

