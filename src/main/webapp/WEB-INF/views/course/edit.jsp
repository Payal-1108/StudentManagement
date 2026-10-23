
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <title>Edit Course | Student Management</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <!-- Inter Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <!-- Main CSS -->
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

        .page-actions {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .btn-modern {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 15px;
            border-radius: 9px;
            text-decoration: none;
            font-size: 12px;
            font-weight: 600;
            transition: 0.2s ease;
        }

        .btn-secondary-modern {
            background: #FFFFFF;
            color: #4B286B;
            border: 1px solid #DDD2E5;
        }

        .btn-secondary-modern:hover {
            background: #EEE5F5;
            color: #4B286B;
        }

        .btn-primary-modern {
            background: #6D3FA0;
            color: white;
            border: 1px solid #6D3FA0;
        }

        .btn-primary-modern:hover {
            background: #4B286B;
            color: white;
        }

        /* ================= FORM CARD ================= */

        .form-card {
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(36,23,46,0.05);
            overflow: hidden;
            max-width: 900px;
        }

        .form-card-header {
            padding: 22px 25px;
            border-bottom: 1px solid #DDD2E5;
        }

        .form-card-header h3 {
            margin: 0;
            font-size: 17px;
            font-weight: 700;
            color: #24172E;
        }

        .form-card-header h3 i {
            color: #6D3FA0 !important;
            margin-right: 7px;
        }

        .form-card-header p {
            margin: 5px 0 0;
            color: #786B82;
            font-size: 12px;
        }

        .course-form {
            padding: 25px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label-modern {
            display: block;
            margin-bottom: 7px;
            font-size: 12px;
            font-weight: 600;
            color: #4B286B;
        }

        .required-star {
            color: #B4475B;
        }

        .form-control-modern,
        .form-select-modern {
            width: 100%;
            height: 44px;
            padding: 0 13px;
            border: 1px solid #DDD2E5;
            border-radius: 9px;
            background: #F8F6FA;
            color: #24172E;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            outline: none;
            transition: 0.2s ease;
        }

        .form-control-modern:focus,
        .form-select-modern:focus {
            border-color: #6D3FA0;
            box-shadow: 0 0 0 3px rgba(109,63,160,0.10);
            background: #FFFFFF;
        }

        .form-control-modern::placeholder {
            color: #786B82;
        }

        .input-group-modern {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 13px;
            top: 50%;
            transform: translateY(-50%);
            color: #786B82;
            font-size: 15px;
            pointer-events: none;
        }

        .input-with-icon {
            padding-left: 38px;
        }

        .form-help {
            margin-top: 6px;
            font-size: 10px;
            color: #786B82;
        }

        .form-divider {
            border: 0;
            border-top: 1px solid #DDD2E5;
            margin: 5px 0 25px;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding-top: 5px;
        }

        .btn-form {
            min-width: 120px;
            height: 42px;
            border: none;
            border-radius: 9px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-family: 'Inter', sans-serif;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: 0.2s ease;
        }

        .btn-cancel {
            background: #FFFFFF;
            color: #4B286B;
            border: 1px solid #DDD2E5;
        }

        .btn-cancel:hover {
            background: #EEE5F5;
            color: #4B286B;
        }

        .btn-update {
            background: #6D3FA0;
            color: white;
        }

        .btn-update:hover {
            background: #4B286B;
        }

        .btn-update:disabled {
            opacity: 0.7;
            cursor: not-allowed;
        }

        .mobile-menu-btn {
            display: none;
            width: 42px;
            height: 42px;
            border: 1px solid #DDD2E5;
            border-radius: 10px;
            background: #FFFFFF;
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

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }
        }

        @media (max-width: 600px) {

            .page-title {
                font-size: 21px;
            }

            .top-header {
                align-items: flex-start;
            }

            .page-actions {
                flex-direction: column;
            }

            .btn-modern {
                justify-content: center;
            }

            .form-card-header,
            .course-form {
                padding: 20px;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .btn-form {
                width: 100%;
            }
        }

    </style>

</head>

<body>

<div class="dashboard-container">

    <!-- ================= SIDEBAR ================= -->

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


    <!-- ================= MAIN CONTENT ================= -->

    <main class="main-content">

        <!-- Top Header -->

        <div class="top-header">

            <div style="display:flex; align-items:flex-start; gap:12px;">

                <button class="mobile-menu-btn"
                        type="button"
                        onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>

                <div>

                    <h1 class="page-title">
                        Edit Course
                    </h1>

                    <p class="page-subtitle">
                        Update academic course information
                    </p>

                </div>

            </div>


            <!-- Admin Profile -->

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


        <!-- Page Actions -->

        <div class="page-actions">

            <a href="${pageContext.request.contextPath}/admin/courses"
               class="btn-modern btn-secondary-modern">

                <i class="bi bi-arrow-left"></i>
                Back to Courses

            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="btn-modern btn-primary-modern">

                <i class="bi bi-grid-1x2-fill"></i>
                Dashboard

            </a>

        </div>


        <!-- ================= FORM CARD ================= -->

        <div class="form-card">

            <div class="form-card-header">

                <h3>
                    <i class="bi bi-pencil-square"
                       style="color:#6D3FA0; margin-right:7px;"></i>

                    Course Details
                </h3>

                <p>
                    Modify the information below and save the changes.
                </p>

            </div>


            <form action="${pageContext.request.contextPath}/admin/courses/edit"
                  method="post"
                  class="course-form"
                  id="courseForm">


                <!-- Hidden Course ID -->

                <input type="hidden"
                       name="id"
                       value="${course.id}">


                <!-- Course Code + Course Title -->

                <div class="form-row">

                    <div class="form-group">

                        <label class="form-label-modern">
                            Course Code
                            <span class="required-star">*</span>
                        </label>

                        <div class="input-group-modern">

                            <i class="bi bi-upc-scan input-icon"></i>

                            <input type="text"
                                   name="courseCode"
                                   class="form-control-modern input-with-icon"
                                   value="${course.courseCode}"
                                   placeholder="Example: CS101"
                                   required>

                        </div>

                        <div class="form-help">
                            Enter the unique course code.
                        </div>

                    </div>


                    <div class="form-group">

                        <label class="form-label-modern">
                            Course Title
                            <span class="required-star">*</span>
                        </label>

                        <div class="input-group-modern">

                            <i class="bi bi-journal-text input-icon"></i>

                            <input type="text"
                                   name="title"
                                   class="form-control-modern input-with-icon"
                                   value="${course.title}"
                                   placeholder="Example: Data Structures"
                                   required>

                        </div>

                    </div>

                </div>


                <!-- Credits + Department -->

                <div class="form-row">

                    <div class="form-group">

                        <label class="form-label-modern">
                            Credits
                            <span class="required-star">*</span>
                        </label>

                        <div class="input-group-modern">

                            <i class="bi bi-award input-icon"></i>

                            <input type="number"
                                   name="credits"
                                   class="form-control-modern input-with-icon"
                                   value="${course.credits}"
                                   min="1"
                                   max="20"
                                   required>

                        </div>

                        <div class="form-help">
                            Number of academic credits.
                        </div>

                    </div>


                    <div class="form-group">

                        <label class="form-label-modern">
                            Department
                            <span class="required-star">*</span>
                        </label>

                        <select name="deptId"
                                class="form-select-modern"
                                required>

                            <option value="">
                                Select Department
                            </option>

                            <c:forEach var="department"
                                       items="${departments}">

                                <option value="${department.id}"
                                    <c:if test="${department.id == course.deptId}">
                                        selected
                                    </c:if>>

                                    ${department.deptName}

                                </option>

                            </c:forEach>

                        </select>

                    </div>

                </div>


                <!-- Capacity + Fee -->

                <div class="form-row">

                    <div class="form-group">

                        <label class="form-label-modern">
                            Course Capacity
                            <span class="required-star">*</span>
                        </label>

                        <div class="input-group-modern">

                            <i class="bi bi-people input-icon"></i>

                            <input type="number"
                                   name="capacity"
                                   class="form-control-modern input-with-icon"
                                   value="${course.capacity}"
                                   min="1"
                                   required>

                        </div>

                        <div class="form-help">
                            Maximum number of students allowed.
                        </div>

                    </div>


                    <div class="form-group">

                        <label class="form-label-modern">
                            Fee Amount
                            <span class="required-star">*</span>
                        </label>

                        <div class="input-group-modern">

                            <i class="bi bi-currency-rupee input-icon"></i>

                            <input type="number"
                                   name="feeAmount"
                                   class="form-control-modern input-with-icon"
                                   value="${course.feeAmount}"
                                   min="0"
                                   step="0.01"
                                   required>

                        </div>

                        <div class="form-help">
                            Course fee amount in INR.
                        </div>

                    </div>

                </div>


                <hr class="form-divider">


                <!-- Prerequisite Course -->

                <div class="form-group">

                    <label class="form-label-modern">

                        Prerequisite Course

                    </label>

                    <select name="prerequisiteCourseId"
                            class="form-select-modern">

                        <option value="">
                            No Prerequisite
                        </option>

                        <c:forEach var="prerequisite"
                                   items="${courses}">

                            <c:if test="${prerequisite.id != course.id}">

                                <option value="${prerequisite.id}"
                                    <c:if test="${prerequisite.id == course.prerequisiteCourseId}">
                                        selected
                                    </c:if>>

                                    ${prerequisite.courseCode}
                                    -
                                    ${prerequisite.title}

                                </option>

                            </c:if>

                        </c:forEach>

                    </select>

                    <div class="form-help">
                        Select a course that students must complete first.
                    </div>

                </div>


                <!-- Form Actions -->

                <div class="form-actions">

                    <a href="${pageContext.request.contextPath}/admin/courses"
                       class="btn-form btn-cancel">

                        <i class="bi bi-x-lg"></i>
                        Cancel

                    </a>


                    <button type="submit"
                            class="btn-form btn-update"
                            id="updateBtn">

                        <i class="bi bi-check2-circle"></i>

                        <span id="updateText">
                            Update Course
                        </span>

                    </button>

                </div>

            </form>

        </div>

    </main>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script>

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");
    }


    document.querySelectorAll(".menu-item")
        .forEach(function(item) {

            item.addEventListener("click", function() {

                if (window.innerWidth <= 800) {

                    document
                        .getElementById("sidebar")
                        .classList.remove("show");

                }

            });

        });


    document.getElementById("courseForm")
        .addEventListener("submit", function() {

            const button =
                document.getElementById("updateBtn");

            const text =
                document.getElementById("updateText");

            button.disabled = true;

            text.innerHTML =
                '<span class="spinner-border spinner-border-sm"></span> Updating...';

        });

</script>

</body>
</html>

