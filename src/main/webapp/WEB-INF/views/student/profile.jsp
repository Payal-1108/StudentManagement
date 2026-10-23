
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Profile</title>

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
           ========================= */

        .main-content {
            margin-left: 260px;
            width: calc(100% - 260px);
            min-height: 100vh;
            padding: 28px 34px;
        }

        /* =========================
           TOP HEADER
           ========================= */

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
           PROFILE HEADER
           ========================= */

        .profile-header {
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

        .profile-header::after {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            right: -80px;
            top: -100px;
            background: rgba(255,255,255,0.08);
        }

        .profile-header-content {
            position: relative;
            z-index: 2;
            display: flex;
            align-items: center;
        }

        .profile-avatar-large {
            width: 90px;
            height: 90px;
            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background: rgba(255,255,255,0.18);

            margin-right: 20px;

            font-size: 38px;
        }

        .profile-header h2 {
            margin: 0;
            font-size: 24px;
            font-weight: 800;
        }

        .profile-header p {
            margin: 7px 0 0;
            color: rgba(255,255,255,0.75);
            font-size: 13px;
        }

        /* =========================
           INFORMATION CARD
           ========================= */

        .info-card {
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            padding: 24px;

            box-shadow: 0 4px 15px rgba(36,23,46,0.05);

            margin-bottom: 20px;
        }

        .card-heading {
            display: flex;
            align-items: center;

            padding-bottom: 16px;
            margin-bottom: 5px;

            border-bottom: 1px solid #EEE5F5;
        }

        .card-heading-icon {
            width: 40px;
            height: 40px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;

            background: #EEE5F5;
            color: #6D3FA0;

            margin-right: 12px;

            font-size: 18px;
        }

        .card-heading h2 {
            margin: 0;

            font-size: 17px;
            font-weight: 800;

            color: #24172E;
        }

        /* =========================
           PROFILE ROW
           ========================= */

        .profile-row {
            display: flex;
            align-items: center;

            padding: 17px 0;

            border-bottom: 1px solid #EEE5F5;
        }

        .profile-row:last-child {
            border-bottom: none;
        }

        .profile-row-icon {
            width: 40px;

            color: #6D3FA0;

            font-size: 17px;
        }

        .profile-label {
            width: 190px;

            color: #786B82;

            font-size: 12px;
            font-weight: 600;
        }

        .profile-value {
            color: #24172E;

            font-size: 13px;
            font-weight: 700;

            word-break: break-word;
        }

        /* =========================
           BUTTONS
           ========================= */

        .profile-actions {
            display: flex;
            gap: 10px;
        }

        .edit-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;

            background: #6D3FA0;
            color: #FFFFFF;

            border: none;
            border-radius: 8px;

            padding: 10px 18px;

            font-size: 12px;
            font-weight: 700;

            text-decoration: none;

            box-shadow:
                0 5px 12px rgba(109,63,160,0.18);

            transition: all 0.2s ease;
        }

        .edit-btn:hover {
            background: #4B286B;
            color: #FFFFFF;
            transform: translateY(-1px);
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;

            background: #FFFFFF;
            color: #4B286B;

            border: 1px solid #DDD2E5;
            border-radius: 8px;

            padding: 10px 18px;

            font-size: 12px;
            font-weight: 700;

            text-decoration: none;

            transition: all 0.2s ease;
        }

        .back-btn:hover {
            background: #FAF8FC;
            color: #24172E;
            border-color: #DDD2E5;
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

            margin-bottom: 10px;
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

            .top-header {
                gap: 15px;
            }

            .profile-row {
                align-items: flex-start;
            }

            .profile-label {
                width: 150px;
            }
        }

        @media (max-width: 600px) {

            .page-title {
                font-size: 21px;
            }

            .profile-header {
                padding: 24px;
            }

            .profile-header-content {
                align-items: flex-start;
            }

            .profile-avatar-large {
                width: 70px;
                height: 70px;
                font-size: 30px;
                margin-right: 15px;
            }

            .profile-header h2 {
                font-size: 20px;
            }

            .info-card {
                padding: 18px;
            }

            .profile-row {
                display: grid;
                grid-template-columns: 35px 1fr;
                gap: 4px;
            }

            .profile-label {
                width: auto;
            }

            .profile-value {
                grid-column: 2;
            }

            .profile-actions {
                flex-direction: column;
            }

            .edit-btn,
            .back-btn {
                justify-content: center;
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
                    My Profile
                </h1>

                <p class="page-subtitle">
                    View and manage your student information.
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
             PROFILE HEADER
             ========================= -->

        <div class="profile-header">

            <div class="profile-header-content">

                <div class="profile-avatar-large">

                    <i class="bi bi-person-fill"></i>

                </div>


                <div>

                    <h2>
                        ${student.name}
                    </h2>

                    <p>
                        ${student.departmentName}
                    </p>

                </div>

            </div>

        </div>


        <!-- =========================
             PROFILE INFORMATION
             ========================= -->

        <div class="info-card">

            <div class="card-heading">

                <div class="card-heading-icon">

                    <i class="bi bi-person-vcard-fill"></i>

                </div>

                <h2>
                    Personal & Academic Information
                </h2>

            </div>


            <div class="profile-row">

                <div class="profile-row-icon">

                    <i class="bi bi-person-badge-fill"></i>

                </div>

                <div class="profile-label">
                    Roll Number
                </div>

                <div class="profile-value">
                    ${student.rollNumber}
                </div>

            </div>


            <div class="profile-row">

                <div class="profile-row-icon">

                    <i class="bi bi-person-fill"></i>

                </div>

                <div class="profile-label">
                    Full Name
                </div>

                <div class="profile-value">
                    ${student.name}
                </div>

            </div>


            <div class="profile-row">

                <div class="profile-row-icon">

                    <i class="bi bi-envelope-fill"></i>

                </div>

                <div class="profile-label">
                    Email Address
                </div>

                <div class="profile-value">
                    ${student.email}
                </div>

            </div>


            <div class="profile-row">

                <div class="profile-row-icon">

                    <i class="bi bi-building-fill"></i>

                </div>

                <div class="profile-label">
                    Department
                </div>

                <div class="profile-value">
                    ${student.departmentName}
                </div>

            </div>


            <div class="profile-row">

                <div class="profile-row-icon">

                    <i class="bi bi-mortarboard-fill"></i>

                </div>

                <div class="profile-label">
                    Current Semester
                </div>

                <div class="profile-value">
                    Semester ${student.currentSemester}
                </div>

            </div>

        </div>


        <!-- =========================
             ACTION BUTTONS
             ========================= -->

        <div class="profile-actions">

            <a
                href="${pageContext.request.contextPath}/student/profile/edit"
                class="edit-btn">

                <i class="bi bi-pencil-square"></i>

                Edit Profile

            </a>


            <a
                href="${pageContext.request.contextPath}/student/dashboard"
                class="back-btn">

                <i class="bi bi-arrow-left"></i>

                Back to Dashboard

            </a>

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

