
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add Department | Admin Portal</title>

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

        .page-info {
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
            box-shadow: 0 6px 15px rgba(109,63,160,0.18);
        }

        .btn-primary-modern:hover {
            background: #4B286B;
            color: white;
            transform: translateY(-2px);
        }

        .btn-secondary-modern {
            background: white;
            color: #4B286B;
            border: 1px solid #DDD2E5;
        }

        .btn-secondary-modern:hover {
            background: #FAF8FC;
            color: #24172E;
        }

        /* =========================
           FORM CARD
        ========================== */

        .form-card {
            background: white;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(36,23,46,0.04);
            max-width: 900px;
        }

        .form-header {
            padding: 22px 24px;
            border-bottom: 1px solid #EEE5F5;
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .form-header-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: #EEE5F5;
            color: #6D3FA0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 21px;
            flex-shrink: 0;
        }

        .form-header h3 {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            color: #24172E;
        }

        .form-header p {
            margin: 4px 0 0;
            color: #786B82;
            font-size: 11px;
        }

        .form-body {
            padding: 28px 24px;
        }

        /* =========================
           ALERT
        ========================== */

        .error-alert {
            border: none;
            border-radius: 10px;
            background: #F8EDEF;
            color: #9B3D52;
            font-size: 12px;
            padding: 12px 15px;
            margin-bottom: 22px;
        }

        /* =========================
           FORM
        ========================== */

        .form-section {
            margin-bottom: 25px;
        }

        .section-title {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            font-weight: 700;
            color: #4B286B;
            margin-bottom: 18px;
        }

        .section-title i {
            color: #6D3FA0;
            font-size: 17px;
        }

        .form-label {
            font-size: 12px;
            font-weight: 600;
            color: #24172E;
            margin-bottom: 7px;
        }

        .required {
            color: #B4475B;
        }

        .form-control {
            width: 100%;
            min-height: 45px;
            border: 1px solid #DDD2E5;
            border-radius: 9px;
            padding: 10px 13px;
            font-size: 13px;
            color: #24172E;
            background: #F8F6FA;
            outline: none;
            transition: 0.2s;
        }

        .form-control:focus {
            border-color: #6D3FA0;
            box-shadow: 0 0 0 3px rgba(109,63,160,0.10);
            background: white;
        }

        .form-help {
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
            border-top: 1px solid #EEE5F5;
            padding-top: 22px;
            margin-top: 28px;
        }

        .cancel-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            min-height: 42px;
            padding: 0 18px;
            border-radius: 10px;
            background: white;
            color: #4B286B;
            border: 1px solid #DDD2E5;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
            transition: 0.2s;
        }

        .cancel-button:hover {
            background: #FAF8FC;
            color: #24172E;
        }

        .save-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 42px;
            padding: 0 20px;
            border: none;
            border-radius: 10px;
            background: #6D3FA0;
            color: white;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 6px 15px rgba(109,63,160,0.18);
            transition: all 0.2s ease;
        }

        .save-button:hover {
            background: #4B286B;
            transform: translateY(-2px);
        }

        .save-button:disabled {
            opacity: 0.7;
            cursor: not-allowed;
            transform: none;
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
            background: white;
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

            .page-title {
                font-size: 21px;
            }

            .form-card {
                border-radius: 13px;
            }

            .form-body {
                padding: 22px 18px;
            }

            .form-header {
                padding: 20px 18px;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .cancel-button,
            .save-button {
                width: 100%;
            }
        }

        @media (max-width: 400px) {

            .main-content {
                padding: 18px 12px;
            }

            .page-subtitle {
                display: none;
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

        <!-- HEADER -->

        <header class="top-header">

            <div class="d-flex align-items-center gap-3">

                <button
                    class="mobile-menu-btn"
                    type="button"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>

                <div>

                    <h1 class="page-title">
                        Add Department
                    </h1>

                    <p class="page-subtitle">
                        Create a new academic department
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

            <div class="page-info">

                <i class="bi bi-building-fill me-1"></i>
                Department Management

            </div>

            <div class="action-buttons">

                <a
                    href="${pageContext.request.contextPath}/admin/departments"
                    class="btn-modern btn-secondary-modern">

                    <i class="bi bi-arrow-left"></i>
                    Departments

                </a>

                <a
                    href="${pageContext.request.contextPath}/admin/dashboard"
                    class="btn-modern btn-primary-modern">

                    <i class="bi bi-grid-1x2-fill"></i>
                    Dashboard

                </a>

            </div>

        </div>


        <!-- FORM CARD -->

        <div class="form-card">

            <!-- FORM HEADER -->

            <div class="form-header">

                <div class="form-header-icon">

                    <i class="bi bi-building-add"></i>

                </div>

                <div>

                    <h3>
                        Department Information
                    </h3>

                    <p>
                        Enter the details of the new academic department
                    </p>

                </div>

            </div>


            <!-- FORM BODY -->

            <div class="form-body">

                <!-- ERROR MESSAGE -->

                <c:if test="${not empty error}">

                    <div class="alert error-alert">

                        <i class="bi bi-exclamation-circle-fill me-2"></i>

                        ${error}

                    </div>

                </c:if>


                <!-- SUCCESS MESSAGE -->

                <c:if test="${not empty success}">

                    <div
                        class="alert alert-success"
                        style="border:none;border-radius:10px;font-size:12px;">

                        <i class="bi bi-check-circle-fill me-2"></i>

                        ${success}

                    </div>

                </c:if>


                <!-- FORM -->

                <form
                    action="${pageContext.request.contextPath}/admin/departments/add"
                    method="post"
                    id="departmentForm"
                    onsubmit="return validateDepartmentForm()">

                    <!-- DEPARTMENT INFORMATION -->

                    <div class="form-section">

                        <div class="section-title">

                            <i class="bi bi-building-fill"></i>

                            Department Details

                        </div>


                        <div class="row g-4">

                            <!-- DEPARTMENT NAME -->

                            <div class="col-md-6">

                                <label
                                    class="form-label"
                                    for="deptName">

                                    Department Name

                                    <span class="required">
                                        *
                                    </span>

                                </label>

                                <input
                                    type="text"
                                    class="form-control"
                                    id="deptName"
                                    name="deptName"
                                    placeholder="Enter department name"
                                    maxlength="100"
                                    required>

                                <div class="form-help">
                                    Example: Computer Engineering
                                </div>

                            </div>


                            <!-- DEPARTMENT CODE -->

                            <div class="col-md-6">

                                <label
                                    class="form-label"
                                    for="deptCode">

                                    Department Code

                                    <span class="required">
                                        *
                                    </span>

                                </label>

                                <input
                                    type="text"
                                    class="form-control"
                                    id="deptCode"
                                    name="deptCode"
                                    maxlength="20"
                                    placeholder="Enter department code"
                                    required>

                                <div class="form-help">
                                    Example: CE, CSE, IT, ECE
                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- ACTIONS -->

                    <div class="form-actions">

                        <a
                            href="${pageContext.request.contextPath}/admin/departments"
                            class="cancel-button">

                            <i class="bi bi-x-circle"></i>

                            Cancel

                        </a>


                        <button
                            type="submit"
                            class="save-button"
                            id="saveButton">

                            <i
                                class="bi bi-check2-circle"
                                id="saveIcon"></i>

                            <span id="saveText">
                                Add Department
                            </span>

                            <span
                                class="spinner-border spinner-border-sm d-none"
                                id="saveSpinner"
                                role="status">
                            </span>

                        </button>

                    </div>

                </form>

            </div>

        </div>

    </main>

</div>


<!-- =========================
     JAVASCRIPT
========================== -->

<script>

    /* Mobile sidebar */

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");
    }


    /* Department form validation */

    function validateDepartmentForm() {

        const deptName =
            document.getElementById("deptName")
                .value.trim();

        const deptCode =
            document.getElementById("deptCode")
                .value.trim();


        /* Department name validation */

        if (deptName.length < 2) {

            alert(
                "Please enter a valid department name."
            );

            return false;
        }


        /* Department code validation */

        if (deptCode.length < 2) {

            alert(
                "Please enter a valid department code."
            );

            return false;
        }


        /* Allow letters, numbers, hyphen and underscore */

        const codePattern =
            /^[A-Za-z0-9_-]+$/;


        if (!codePattern.test(deptCode)) {

            alert(
                "Department code can contain only letters, numbers, hyphen and underscore."
            );

            return false;
        }


        /* Disable button */

        const button =
            document.getElementById("saveButton");

        const text =
            document.getElementById("saveText");

        const icon =
            document.getElementById("saveIcon");

        const spinner =
            document.getElementById("saveSpinner");


        button.disabled = true;

        text.textContent =
            "Adding Department...";

        icon.classList.add("d-none");

        spinner.classList.remove("d-none");


        return true;
    }


    /* Automatically uppercase department code */

    document
        .getElementById("deptCode")
        .addEventListener("input", function () {

            this.value =
                this.value.toUpperCase();

        });


    /* Close sidebar on mobile */

    document
        .querySelectorAll(".menu-item")
        .forEach(item => {

            item.addEventListener("click", function () {

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

