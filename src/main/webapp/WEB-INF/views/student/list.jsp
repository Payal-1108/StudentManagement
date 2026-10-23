
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Students | Admin Portal</title>

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

        /* =========================
           LAYOUT
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

            background: linear-gradient(
                180deg,
                #1B1028,
                #3B1F52
            );

            color: white;
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

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 12px;

            background:
                rgba(255,255,255,0.12);

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

            color:
                rgba(255,255,255,0.60);

            margin-top: 3px;
        }

        .sidebar-menu {
            padding: 22px 14px;
        }

        .menu-label {
            font-size: 10px;
            font-weight: 700;

            letter-spacing: 1.2px;

            color:
                rgba(255,255,255,0.42);

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

            color:
                rgba(255,255,255,0.70);

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
            background:
                rgba(255,255,255,0.08);

            color: white;

            transform: translateX(3px);
        }

        .logout-link {
            color: #D6A5B2;
        }

        .logout-link:hover {
            color: #E5C2CB;

            background:
                rgba(214,165,178,0.12);
        }

        /* =========================
           MAIN
        ========================== */

        .main-content {
            margin-left: 260px;

            width: calc(100% - 260px);

            min-height: 100vh;

            padding: 28px 34px;
        }

        /* =========================
           HEADER
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

        .admin-profile {
            display: flex;
            align-items: center;

            gap: 10px;

            padding: 7px 12px 7px 7px;

            background: #FFFFFF;

            border:
                1px solid #DDD2E5;

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

            gap: 15px;

            margin-bottom: 20px;
        }

        .student-count {
            color: #786B82;
            font-size: 13px;
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

            min-height: 42px;

            padding: 0 16px;

            border-radius: 10px;

            text-decoration: none;

            font-size: 12px;
            font-weight: 600;

            border: none;

            transition: all 0.2s ease;
        }

        .btn-primary-modern {
            background: #6D3FA0;
            color: white;

            box-shadow:
                0 6px 15px rgba(109,63,160,0.18);
        }

        .btn-primary-modern:hover {
            background: #4B286B;
            color: white;

            transform: translateY(-2px);
        }

        .btn-secondary-modern {
            background: #FFFFFF;
            color: #4B286B;

            border:
                1px solid #DDD2E5;
        }

        .btn-secondary-modern:hover {
            background: #FAF8FC;
            color: #24172E;
        }

        /* =========================
           SEARCH
        ========================== */

        .search-card {
            background: #FFFFFF;

            border:
                1px solid #DDD2E5;

            border-radius: 16px;

            padding: 18px;

            margin-bottom: 20px;
        }

        .search-form {
            display: flex;
            gap: 10px;
        }

        .search-wrapper {
            position: relative;
            flex: 1;
        }

        .search-wrapper i {
            position: absolute;

            left: 15px;
            top: 50%;

            transform: translateY(-50%);

            color: #786B82;
        }

        .search-input {
            width: 100%;
            height: 45px;

            border:
                1px solid #DDD2E5;

            border-radius: 10px;

            padding: 0 15px 0 43px;

            outline: none;

            font-size: 13px;

            background: #F8F6FA;

            color: #24172E;

            transition: 0.2s;
        }

        .search-input:focus {
            background: #FFFFFF;

            border-color: #6D3FA0;

            box-shadow:
                0 0 0 4px rgba(109,63,160,0.08);
        }

        .search-button {
            height: 45px;

            padding: 0 20px;

            border: none;

            border-radius: 10px;

            background: #4B286B;

            color: white;

            font-size: 12px;

            font-weight: 600;
        }

        .search-button:hover {
            background: #3B1F52;
        }

        /* =========================
           TABLE
        ========================== */

        .table-card {
            background: #FFFFFF;

            border:
                1px solid #DDD2E5;

            border-radius: 16px;

            overflow: hidden;

            box-shadow:
                0 5px 20px rgba(36,23,46,0.03);
        }

        .table-header {
            padding: 18px 20px;

            border-bottom:
                1px solid #EEE5F5;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-header h3 {
            margin: 0;

            font-size: 15px;
            font-weight: 700;

            color: #24172E;
        }

        .table-header span {
            color: #786B82;
            font-size: 11px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .student-table {
            width: 100%;

            border-collapse: collapse;

            min-width: 850px;
        }

        .student-table th {
            padding: 14px 18px;

            text-align: left;

            background: #FAF8FC;

            color: #786B82;

            font-size: 10px;

            text-transform: uppercase;

            letter-spacing: 0.5px;

            font-weight: 700;

            white-space: nowrap;
        }

        .student-table td {
            padding: 15px 18px;

            border-top:
                1px solid #EEE5F5;

            font-size: 12px;

            color: #4B286B;

            vertical-align: middle;
        }

        .student-table tbody tr {
            transition: background 0.2s ease;
        }

        .student-table tbody tr:hover {
            background: #FAF8FC;
        }

        .student-id {
            color: #786B82;

            font-weight: 600;
        }

        .student-name {
            display: flex;
            align-items: center;

            gap: 10px;
        }

        .student-avatar {
            width: 35px;
            height: 35px;

            border-radius: 10px;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #EEE5F5;

            color: #6D3FA0;

            font-size: 14px;

            font-weight: 700;

            flex-shrink: 0;
        }

        .student-name strong {
            display: block;

            color: #24172E;

            font-size: 12px;
        }

        .student-name small {
            color: #786B82;

            font-size: 10px;
        }

        .roll-badge {
            display: inline-block;

            padding: 5px 9px;

            background: #F3EEF7;

            border-radius: 6px;

            color: #4B286B;

            font-size: 10px;

            font-weight: 600;
        }

        .department {
            font-weight: 500;

            color: #4B286B;
        }

        .semester-badge {
            display: inline-block;

            padding: 5px 9px;

            background: #F1F7F3;

            color: #477A58;

            border-radius: 20px;

            font-size: 10px;

            font-weight: 600;
        }

        .row-actions {
            display: flex;

            gap: 7px;
        }

        .row-btn {
            width: 34px;
            height: 34px;

            border-radius: 8px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            text-decoration: none;

            font-size: 14px;

            transition: 0.2s;
        }

        .edit-btn {
            background: #EEE5F5;
            color: #6D3FA0;
        }

        .edit-btn:hover {
            background: #E5D8EF;
            color: #4B286B;
        }

        .delete-btn {
            background: #F8EDEF;
            color: #B4475B;
        }

        .delete-btn:hover {
            background: #F3DDE2;
            color: #9B3D52;
        }

        /* =========================
           EMPTY
        ========================== */

        .empty-state {
            text-align: center;

            padding: 65px 20px;
        }

        .empty-icon {
            width: 65px;
            height: 65px;

            border-radius: 18px;

            background: #EEE5F5;

            color: #6D3FA0;

            display: flex;
            align-items: center;
            justify-content: center;

            margin: 0 auto 18px;

            font-size: 27px;
        }

        .empty-state h4 {
            font-size: 16px;
            margin-bottom: 7px;

            color: #24172E;
        }

        .empty-state p {
            color: #786B82;

            font-size: 12px;

            margin-bottom: 20px;
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
            }

            .admin-details {
                display: none;
            }

        }

        @media (max-width: 600px) {

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

            .search-form {
                flex-direction: column;
            }

            .search-button {
                width: 100%;
            }

            .page-title {
                font-size: 21px;
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
         MAIN
    ========================== -->

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
                        Students
                    </h1>

                    <p class="page-subtitle">
                        Manage student records and academic information
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



        <!-- PAGE ACTIONS -->

        <div class="page-actions">


            <div class="student-count">

                <i class="bi bi-people me-1"></i>

                Student Records

            </div>


            <div class="action-buttons">


                <a
                    href="${pageContext.request.contextPath}/admin/dashboard"
                    class="btn-modern btn-secondary-modern">

                    <i class="bi bi-arrow-left"></i>

                    Dashboard

                </a>


                <a
                    href="${pageContext.request.contextPath}/admin/students/add"
                    class="btn-modern btn-primary-modern">

                    <i class="bi bi-person-plus-fill"></i>

                    Add Student

                </a>


            </div>


        </div>



        <!-- SEARCH -->

        <div class="search-card">


            <form
                action="${pageContext.request.contextPath}/admin/students/search"
                method="get"
                class="search-form">


                <div class="search-wrapper">

                    <i class="bi bi-search"></i>

                    <input
                        type="text"
                        name="keyword"
                        class="search-input"
                        placeholder="Search by roll number or student name..."
                        autocomplete="off">

                </div>


                <button
                    type="submit"
                    class="search-button">

                    <i class="bi bi-search me-1"></i>

                    Search

                </button>


            </form>

        </div>



        <!-- TABLE -->

        <div class="table-card">


            <div class="table-header">

                <h3>
                    Student Directory
                </h3>

                <span>
                    Academic Records
                </span>

            </div>


            <div class="table-responsive">


                <c:choose>


                    <c:when test="${not empty students}">


                        <table class="student-table">


                            <thead>

                                <tr>

                                    <th>ID</th>

                                    <th>Student</th>

                                    <th>Roll Number</th>

                                    <th>Email</th>

                                    <th>Department</th>

                                    <th>Semester</th>

                                    <th>Actions</th>

                                </tr>

                            </thead>


                            <tbody>


                                <c:forEach var="student"
                                           items="${students}">


                                    <tr>


                                        <td>

                                            <span class="student-id">
                                                #${student.id}
                                            </span>

                                        </td>


                                        <td>

                                            <div class="student-name">


                                                <div class="student-avatar">

                                                    <i class="bi bi-person-fill"></i>

                                                </div>


                                                <div>

                                                    <strong>
                                                        ${student.name}
                                                    </strong>

                                                    <small>
                                                        Student
                                                    </small>

                                                </div>


                                            </div>

                                        </td>


                                        <td>

                                            <span class="roll-badge">
                                                ${student.rollNumber}
                                            </span>

                                        </td>


                                        <td>

                                            ${student.email}

                                        </td>


                                        <td>

                                            <span class="department">

                                                ${student.departmentName}

                                            </span>

                                        </td>


                                        <td>

                                            <span class="semester-badge">

                                                Semester
                                                ${student.currentSemester}

                                            </span>

                                        </td>


                                        <td>


                                            <div class="row-actions">


                                                <a
                                                    href="${pageContext.request.contextPath}/admin/students/edit?id=${student.id}"
                                                    class="row-btn edit-btn"
                                                    title="Edit Student">

                                                    <i class="bi bi-pencil-fill"></i>

                                                </a>


                                                <a
                                                    href="${pageContext.request.contextPath}/admin/students/delete?id=${student.id}"
                                                    class="row-btn delete-btn"
                                                    title="Delete Student"
                                                    onclick="return confirmDelete('${student.name}')">

                                                    <i class="bi bi-trash3-fill"></i>

                                                </a>


                                            </div>


                                        </td>


                                    </tr>


                                </c:forEach>


                            </tbody>


                        </table>


                    </c:when>


                    <c:otherwise>


                        <div class="empty-state">


                            <div class="empty-icon">

                                <i class="bi bi-people"></i>

                            </div>


                            <h4>
                                No students found
                            </h4>


                            <p>
                                There are currently no student records
                                matching your search.
                            </p>


                            <a
                                href="${pageContext.request.contextPath}/admin/students/add"
                                class="btn-modern btn-primary-modern">

                                <i class="bi bi-person-plus-fill"></i>

                                Add First Student

                            </a>


                        </div>


                    </c:otherwise>


                </c:choose>


            </div>


        </div>


    </main>

</div>



<script>

    /* Mobile sidebar */

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");

    }


    /* Delete confirmation */

    function confirmDelete(studentName) {

        return confirm(
            "Are you sure you want to delete " +
            studentName +
            "?\n\nThis action cannot be undone."
        );

    }


    /* Close sidebar after selecting menu on mobile */

    document.querySelectorAll(".menu-item").forEach(item => {

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
