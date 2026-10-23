
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Faculty Dashboard</title>

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

        /* ================= DASHBOARD ================= */

        .faculty-dashboard {
            padding: 0;
        }

        .faculty-welcome {
            background: white;
            border-radius: 14px;
            padding: 28px;
            border: 1px solid #DDD2E5;
            box-shadow: 0 4px 15px rgba(36,23,46,0.06);
            margin-bottom: 22px;
        }

        .faculty-welcome h2 {
            margin: 0 0 8px;
            color: #24172E;
            font-size: 22px;
            font-weight: 800;
        }

        .faculty-welcome p {
            margin: 0;
            color: #786B82;
            font-size: 13px;
        }

        .faculty-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .faculty-info-card {
            background: white;
            padding: 25px;
            border-radius: 14px;
            border: 1px solid #DDD2E5;
            box-shadow: 0 4px 15px rgba(36,23,46,0.06);
        }

        .faculty-info-card h3 {
            margin: 0 0 18px;
            color: #4B286B;
            font-size: 15px;
            font-weight: 700;
        }

        .faculty-info-card p {
            margin: 11px 0;
            color: #786B82;
            font-size: 13px;
        }

        .faculty-info-card strong {
            color: #24172E;
        }

        .access-item {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 13px 0;
            color: #786B82;
            font-size: 13px;
        }

        .access-item i {
            color: #6D3FA0;
            font-size: 16px;
        }

        .faculty-action {
            margin-top: 22px;
        }

        .faculty-action a {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 11px 18px;
            background: #6D3FA0;
            color: white;
            text-decoration: none;
            border-radius: 9px;
            font-size: 13px;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .faculty-action a:hover {
            background: #4B286B;
            color: white;
            transform: translateY(-1px);
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

            .faculty-info {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 600px) {

            .page-title {
                font-size: 21px;
            }

            .faculty-welcome {
                padding: 22px;
            }

            .faculty-info-card {
                padding: 20px;
            }

            .top-header {
                align-items: flex-start;
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
                        Faculty Dashboard
                    </h1>

                    <p class="page-subtitle">
                        Manage your assigned courses and student rosters
                    </p>

                </div>

            </div>


            <div class="admin-profile">

                <div class="admin-avatar">

                    <i class="bi bi-person-workspace"></i>

                </div>


                <div class="admin-details">

                    <strong>
                        ${faculty.name}
                    </strong>

                    <span>
                        Faculty / Instructor
                    </span>

                </div>

            </div>

        </header>


        <section class="faculty-dashboard">


            <!-- WELCOME -->

            <div class="faculty-welcome">

                <h2>
                    Welcome, ${faculty.name}
                </h2>

                <p>
                    View your assigned courses and enrolled students
                    from your faculty portal.
                </p>

            </div>


            <!-- INFORMATION CARDS -->

            <div class="faculty-info">


                <!-- FACULTY INFORMATION -->

                <div class="faculty-info-card">

                    <h3>

                        <i class="bi bi-person-vcard me-2"></i>

                        Faculty Information

                    </h3>


                    <p>

                        <strong>Name:</strong>

                        ${faculty.name}

                    </p>


                    <p>

                        <strong>Email:</strong>

                        ${faculty.email}

                    </p>


                    <p>

                        <strong>Department:</strong>

                        ${faculty.departmentName}

                    </p>

                </div>


                <!-- ACADEMIC ACCESS -->

                <div class="faculty-info-card">

                    <h3>

                        <i class="bi bi-mortarboard me-2"></i>

                        Academic Access

                    </h3>


                    <div class="access-item">

                        <i class="bi bi-check-circle-fill"></i>

                        <span>
                            View assigned courses
                        </span>

                    </div>


                    <div class="access-item">

                        <i class="bi bi-check-circle-fill"></i>

                        <span>
                            View enrolled student rosters
                        </span>

                    </div>


                    <div class="access-item">

                        <i class="bi bi-check-circle-fill"></i>

                        <span>
                            Download student lists
                        </span>

                    </div>

                </div>

            </div>


            <!-- ACTION BUTTON -->

            <div class="faculty-action">

                <a
                    href="${pageContext.request.contextPath}/faculty/courses">

                    <i class="bi bi-journal-bookmark-fill"></i>

                    View Assigned Courses

                    <i class="bi bi-arrow-right"></i>

                </a>

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

