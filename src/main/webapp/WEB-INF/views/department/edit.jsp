
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Edit Department - Student Management</title>

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
        ========================= */

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
        ========================= */

        .page-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
            gap: 15px;
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
            background: white;
            color: #4B286B;
            border-color: #DDD2E5;
        }

        .btn-secondary-modern:hover {
            background: #FAF8FC;
            color: #24172E;
        }

        /* =========================
           FORM CARD
        ========================= */

        .form-card {
            background: white;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            box-shadow: 0 4px 18px rgba(36,23,46,0.04);
            overflow: hidden;
            max-width: 850px;
        }

        .form-card-header {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 22px 25px;
            border-bottom: 1px solid #EEE5F5;
        }

        .form-header-icon {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 20px;
        }

        .form-card-header h2 {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            color: #24172E;
        }

        .form-card-header p {
            margin: 4px 0 0;
            color: #786B82;
            font-size: 12px;
        }

        .department-form {
            padding: 25px;
        }

        .form-row {
            margin-bottom: 22px;
        }

        .form-row label {
            display: block;
            margin-bottom: 8px;
            color: #24172E;
            font-size: 13px;
            font-weight: 600;
        }

        .form-row input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #DDD2E5;
            border-radius: 9px;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            color: #24172E;
            background: #F8F6FA;
            outline: none;
            transition: all 0.2s ease;
        }

        .form-row input:focus {
            border-color: #6D3FA0;
            box-shadow: 0 0 0 3px rgba(109,63,160,0.10);
            background: white;
        }

        .form-row input::placeholder {
            color: #786B82;
        }

        .form-hint {
            margin-top: 6px;
            color: #786B82;
            font-size: 11px;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 28px;
            padding-top: 20px;
            border-top: 1px solid #EEE5F5;
        }

        .update-button,
        .cancel-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            padding: 11px 18px;
            border-radius: 9px;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .update-button {
            border: none;
            background: #6D3FA0;
            color: white;
            box-shadow: 0 6px 15px rgba(109,63,160,0.18);
        }

        .update-button:hover {
            background: #4B286B;
        }

        .cancel-button {
            background: white;
            color: #4B286B;
            border: 1px solid #DDD2E5;
        }

        .cancel-button:hover {
            background: #FAF8FC;
            color: #24172E;
        }

        /* =========================
           MOBILE BUTTON
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
                align-items: center;
                justify-content: center;
            }

            .admin-details {
                display: none;
            }

            .top-header {
                gap: 12px;
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

            .form-card {
                max-width: 100%;
            }
        }

        @media (max-width: 600px) {

            .main-content {
                padding: 18px;
            }

            .page-title {
                font-size: 21px;
            }

            .form-card-header {
                padding: 18px;
            }

            .department-form {
                padding: 18px;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .update-button,
            .cancel-button {
                width: 100%;
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


    <!-- =========================
         MAIN CONTENT
    ========================= -->

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
                    Edit Department
                </h1>

                <p class="page-subtitle">
                    Update academic department information
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


        <!-- PAGE ACTIONS -->

        <div class="page-actions">

            <div>

                <span
                    style="
                        color:#786B82;
                        font-size:13px;
                        font-weight:600;
                    ">

                    Department Records

                </span>

            </div>

            <div class="action-buttons">

                <a
                    href="${pageContext.request.contextPath}/admin/departments"
                    class="btn-modern btn-secondary-modern">

                    <i class="bi bi-arrow-left"></i>
                    Back to Departments

                </a>

                <a
                    href="${pageContext.request.contextPath}/admin/dashboard"
                    class="btn-modern btn-primary-modern">

                    <i class="bi bi-grid-1x2-fill"></i>
                    Dashboard

                </a>

            </div>

        </div>


        <!-- =========================
             EDIT DEPARTMENT FORM
        ========================== -->

        <div class="form-card">

            <div class="form-card-header">

                <div class="form-header-icon">

                    <i class="bi bi-building-fill"></i>

                </div>

                <div>

                    <h2>
                        Department Information
                    </h2>

                    <p>
                        Update the department name and department code.
                    </p>

                </div>

            </div>


            <form
                action="${pageContext.request.contextPath}/admin/departments/edit"
                method="post"
                class="department-form"
                onsubmit="return validateDepartmentForm();">


                <!-- DEPARTMENT ID -->

                <input
                    type="hidden"
                    name="id"
                    value="${department.id}">


                <!-- DEPARTMENT NAME -->

                <div class="form-row">

                    <label for="deptName">
                        Department Name
                    </label>

                    <input
                        type="text"
                        id="deptName"
                        name="deptName"
                        value="${department.deptName}"
                        placeholder="Enter department name"
                        required>

                    <div class="form-hint">
                        Example: Computer Engineering
                    </div>

                </div>


                <!-- DEPARTMENT CODE -->

                <div class="form-row">

                    <label for="deptCode">
                        Department Code
                    </label>

                    <input
                        type="text"
                        id="deptCode"
                        name="deptCode"
                        value="${department.deptCode}"
                        maxlength="20"
                        placeholder="Enter department code"
                        required>

                    <div class="form-hint">
                        Example: CE
                    </div>

                </div>


                <!-- BUTTONS -->

                <div class="form-actions">

                    <a
                        href="${pageContext.request.contextPath}/admin/departments"
                        class="cancel-button">

                        <i class="bi bi-x-lg"></i>
                        Cancel

                    </a>

                    <button
                        type="submit"
                        class="update-button"
                        id="updateButton">

                        <i class="bi bi-check2-circle"></i>
                        Update Department

                    </button>

                </div>

            </form>

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


    function validateDepartmentForm() {

        const deptName =
            document.getElementById("deptName");

        const deptCode =
            document.getElementById("deptCode");

        const name =
            deptName.value.trim();

        const code =
            deptCode.value.trim();

        if (name.length < 2) {

            alert("Department name must contain at least 2 characters.");

            deptName.focus();

            return false;
        }


        if (code.length < 2) {

            alert("Department code must contain at least 2 characters.");

            deptCode.focus();

            return false;
        }


        const codePattern =
            /^[A-Za-z0-9_-]+$/;

        if (!codePattern.test(code)) {

            alert(
                "Department code can contain only letters, numbers, hyphen and underscore."
            );

            deptCode.focus();

            return false;
        }


        const button =
            document.getElementById("updateButton");

        button.innerHTML =
            '<span class="spinner-border spinner-border-sm"></span> Updating...';

        button.disabled = true;

        return true;
    }


    document.querySelectorAll(".menu-item")
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
