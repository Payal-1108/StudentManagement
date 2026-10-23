
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Courses - Student Management</title>

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
           DASHBOARD CONTAINER
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

        .course-count {
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
           TABLE CARD
        ========================== */

        .table-card {
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            box-shadow: 0 4px 18px rgba(36,23,46,0.05);
            overflow: hidden;
        }

        .table-header {
            padding: 20px 22px;
            border-bottom: 1px solid #EEE5F5;
        }

        .table-header h2 {
            margin: 0;
            color: #24172E;
            font-size: 17px;
            font-weight: 700;
        }

        .table-header p {
            margin: 5px 0 0;
            color: #786B82;
            font-size: 12px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .course-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        .course-table th {
            background: #FAF8FC;
            padding: 14px 20px;
            text-align: left;
            color: #786B82;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            border-bottom: 1px solid #DDD2E5;
        }

        .course-table td {
            padding: 15px 20px;
            color: #4B286B;
            font-size: 13px;
            border-bottom: 1px solid #EEE5F5;
            vertical-align: middle;
        }

        .course-table tbody tr {
            transition: background 0.2s ease;
        }

        .course-table tbody tr:hover {
            background: #FAF8FC;
        }

        .course-number {
            color: #786B82;
            font-size: 12px;
            font-weight: 500;
        }

        .course-code {
            display: inline-block;
            padding: 6px 10px;
            background: #EEE5F5;
            color: #6D3FA0;
            border-radius: 7px;
            font-size: 11px;
            font-weight: 700;
        }

        .course-title {
            color: #24172E;
            font-weight: 600;
        }

        .credits-badge {
            display: inline-block;
            padding: 5px 9px;
            background: #F3EEF7;
            color: #4B286B;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
        }

        .department-name {
            color: #4B286B;
            font-weight: 500;
        }

        .capacity {
            color: #4B286B;
            font-weight: 600;
        }

        .fee {
            color: #24172E;
            font-weight: 700;
        }

        /* =========================
           ROW ACTIONS
        ========================== */

        .row-actions {
            display: flex;
            gap: 7px;
        }

        .row-btn {
            width: 34px;
            height: 34px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        .edit-btn {
            background: #EEE5F5;
            color: #6D3FA0;
        }

        .edit-btn:hover {
            background: #CDB1E8;
            color: #4B286B;
        }

        .delete-btn {
            background: #F8EDEF;
            color: #9B3D52;
        }

        .delete-btn:hover {
            background: #E8C8D0;
            color: #9B3D52;
        }

        /* =========================
           EMPTY STATE
        ========================== */

        .empty-state {
            text-align: center;
            padding: 55px 20px;
            color: #786B82;
        }

        .empty-icon {
            width: 58px;
            height: 58px;
            margin: 0 auto 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 15px;
            background: #F3EEF7;
            color: #786B82;
            font-size: 25px;
        }

        .empty-state h3 {
            margin: 0 0 5px;
            color: #4B286B;
            font-size: 15px;
            font-weight: 700;
        }

        .empty-state p {
            margin: 0;
            font-size: 12px;
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

            .top-header {
                align-items: flex-start;
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

            .table-header {
                padding: 18px;
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
                    Courses
                </h1>


                <p class="page-subtitle">
                    Manage academic courses
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


        <!-- =========================
             PAGE ACTIONS
        ========================== -->

        <div class="page-actions">

            <div class="course-count">

                <i class="bi bi-journal-bookmark-fill"></i>

                Course Records

            </div>


            <div class="action-buttons">


                <a
                    href="${pageContext.request.contextPath}/admin/courses/add"
                    class="btn-modern btn-primary-modern">

                    <i class="bi bi-plus-lg"></i>

                    Add Course

                </a>


                <a
                    href="${pageContext.request.contextPath}/admin/dashboard"
                    class="btn-modern btn-secondary-modern">

                    <i class="bi bi-grid-1x2-fill"></i>

                    Dashboard

                </a>

            </div>

        </div>


        <!-- =========================
             COURSE TABLE
        ========================== -->

        <div class="table-card">


            <div class="table-header">

                <h2>
                    Course List
                </h2>

                <p>
                    All courses available in the system
                </p>

            </div>


            <div class="table-responsive">

                <table class="course-table">


                    <thead>

                        <tr>

                            <th>
                                ID
                            </th>

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
                                Department
                            </th>

                            <th>
                                Capacity
                            </th>

                            <th>
                                Fee
                            </th>

                            <th>
                                Actions
                            </th>

                        </tr>

                    </thead>


                    <tbody>


                        <c:choose>

                            <c:when test="${not empty courses}">

                                <c:forEach
                                    var="course"
                                    items="${courses}">


                                    <tr>


                                        <!-- ID -->

                                        <td class="course-number">

                                            ${course.id}

                                        </td>


                                        <!-- COURSE CODE -->

                                        <td>

                                            <span class="course-code">

                                                ${course.courseCode}

                                            </span>

                                        </td>


                                        <!-- COURSE TITLE -->

                                        <td>

                                            <span class="course-title">

                                                ${course.title}

                                            </span>

                                        </td>


                                        <!-- CREDITS -->

                                        <td>

                                            <span class="credits-badge">

                                                ${course.credits} Credits

                                            </span>

                                        </td>


                                        <!-- DEPARTMENT -->

                                        <td class="department-name">

                                            ${course.departmentName}

                                        </td>


                                        <!-- CAPACITY -->

                                        <td class="capacity">

                                            ${course.capacity}

                                        </td>


                                        <!-- FEE -->

                                        <td class="fee">

                                            Rs. ${course.feeAmount}

                                        </td>


                                        <!-- ACTIONS -->

                                        <td>

                                            <div class="row-actions">


                                                <!-- EDIT -->

                                                <a
                                                    href="${pageContext.request.contextPath}/admin/courses/edit?id=${course.id}"
                                                    class="row-btn edit-btn"
                                                    title="Edit Course">

                                                    <i class="bi bi-pencil-fill"></i>

                                                </a>


                                                <!-- DELETE -->

                                                <a
                                                    href="${pageContext.request.contextPath}/admin/courses/delete?id=${course.id}"
                                                    class="row-btn delete-btn"
                                                    title="Delete Course"
                                                    onclick="return confirmDelete('${course.title}');">

                                                    <i class="bi bi-trash-fill"></i>

                                                </a>


                                            </div>

                                        </td>


                                    </tr>


                                </c:forEach>

                            </c:when>


                            <c:otherwise>

                                <tr>

                                    <td colspan="8">

                                        <div class="empty-state">

                                            <div class="empty-icon">

                                                <i class="bi bi-journal-x"></i>

                                            </div>

                                            <h3>
                                                No Courses Found
                                            </h3>

                                            <p>
                                                There are currently no courses available in the system.
                                            </p>

                                        </div>

                                    </td>

                                </tr>

                            </c:otherwise>

                        </c:choose>


                    </tbody>

                </table>

            </div>

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


    function confirmDelete(courseTitle) {

        return confirm(
            "Are you sure you want to delete " +
            courseTitle +
            "?\n\nThis action cannot be undone."
        );

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

