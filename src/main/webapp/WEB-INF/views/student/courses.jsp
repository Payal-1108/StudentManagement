
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Available Courses | Student Portal</title>

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

        /* ================= MAIN ================= */

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

        .student-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 7px 12px 7px 7px;
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

        /* ================= ALERT ================= */

        .alert-modern {
            border: none;
            border-radius: 10px;
            padding: 13px 16px;
            font-size: 13px;
            margin-bottom: 20px;
        }

        /* ================= COURSE CARD ================= */

        .course-card {
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(36,23,46,0.05);
        }

        .course-card-header {
            padding: 20px 22px;
            border-bottom: 1px solid #DDD2E5;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .course-card-header h3 {
            margin: 0;
            font-size: 17px;
            font-weight: 800;
            color: #24172E;
        }

        .course-card-header p {
            margin: 4px 0 0;
            color: #786B82;
            font-size: 11px;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .course-count {
            background: #EEE5F5;
            color: #6D3FA0;
            border-radius: 20px;
            padding: 8px 12px;
            font-size: 11px;
            font-weight: 700;
            white-space: nowrap;
        }

        .view-cart-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 9px 14px;
            background: #6D3FA0;
            color: #FFFFFF;
            border-radius: 8px;
            text-decoration: none;
            font-size: 11px;
            font-weight: 700;
            transition: all 0.2s ease;
            white-space: nowrap;
        }

        .view-cart-btn:hover {
            background: #4B286B;
            color: #FFFFFF;
            transform: translateY(-1px);
        }

        /* ================= COURSE ROW ================= */

        .course-row {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 19px 22px;
            border-bottom: 1px solid #EEE5F5;
            transition: background 0.2s ease;
        }

        .course-row:last-child {
            border-bottom: none;
        }

        .course-row:hover {
            background: #FAF8FC;
        }

        .course-icon {
            width: 48px;
            height: 48px;
            flex-shrink: 0;
            border-radius: 12px;
            background: #EEE5F5;
            color: #6D3FA0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .course-info {
            flex: 1;
            min-width: 0;
        }

        .course-code {
            display: inline-block;
            color: #6D3FA0;
            font-size: 10px;
            font-weight: 800;
            background: #EEE5F5;
            padding: 4px 7px;
            border-radius: 5px;
            margin-bottom: 5px;
        }

        .course-title {
            margin: 0;
            font-size: 14px;
            font-weight: 700;
            color: #24172E;
        }

        .course-department {
            margin-top: 5px;
            color: #786B82;
            font-size: 11px;
        }

        .course-details {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
        }

        .detail-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: #F8F6FA;
            border: 1px solid #DDD2E5;
            color: #4B286B;
            padding: 6px 8px;
            border-radius: 7px;
            font-size: 10px;
            font-weight: 600;
            white-space: nowrap;
        }

        .fee-badge {
            color: #477A58;
            background: #F1F7F3;
            border-color: #C7DDCD;
        }

        .add-cart-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 9px 13px;
            border: none;
            border-radius: 8px;
            background: #6D3FA0;
            color: #FFFFFF;
            font-size: 10px;
            font-weight: 700;
            text-decoration: none;
            white-space: nowrap;
            transition: all 0.2s ease;
        }

        .add-cart-btn:hover {
            background: #4B286B;
            color: #FFFFFF;
            transform: translateY(-1px);
        }

        /* ================= EMPTY ================= */

        .empty-state {
            padding: 65px 20px;
            text-align: center;
        }

        .empty-icon {
            width: 70px;
            height: 70px;
            margin: 0 auto 15px;
            border-radius: 50%;
            background: #EEE5F5;
            color: #6D3FA0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
        }

        .empty-state h4 {
            font-size: 16px;
            font-weight: 800;
            margin-bottom: 7px;
            color: #24172E;
        }

        .empty-state p {
            color: #786B82;
            font-size: 12px;
            margin: 0;
        }

        /* ================= MOBILE ================= */

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

        @media (max-width: 900px) {

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

            .student-details {
                display: none;
            }

            .course-row {
                align-items: flex-start;
                flex-wrap: wrap;
            }

            .course-info {
                min-width: calc(100% - 70px);
            }

            .course-details {
                width: 100%;
                padding-left: 64px;
            }

            .add-cart-btn {
                margin-left: 64px;
            }
        }

        @media (max-width: 650px) {

            .top-header {
                align-items: flex-start;
            }

            .page-title {
                font-size: 21px;
            }

            .course-card-header {
                align-items: flex-start;
                flex-direction: column;
                gap: 14px;
            }

            .header-actions {
                width: 100%;
                justify-content: space-between;
            }

            .course-row {
                padding: 17px;
            }

            .course-details {
                padding-left: 0;
            }

            .add-cart-btn {
                margin-left: 0;
                width: 100%;
                justify-content: center;
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

                Fee &amp; Receipt

            </a>


            <a
                href="${pageContext.request.contextPath}/student/logout"
                class="menu-item logout-link">

                <i class="bi bi-box-arrow-right"></i>

                Logout

            </a>

        </nav>

    </aside>


    <!-- ================= MAIN CONTENT ================= -->

    <main class="main-content">

        <div class="top-header">

            <div>

                <button
                    class="mobile-menu-btn"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>

                <h1 class="page-title">
                    Available Courses
                </h1>

                <p class="page-subtitle">
                    Browse courses and add them to your enrollment cart.
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


        <!-- ERROR -->

        <c:if test="${not empty error}">

            <div class="alert alert-danger alert-modern">

                <i class="bi bi-exclamation-circle-fill me-2"></i>

                ${error}

            </div>

        </c:if>


        <!-- ================= COURSE CATALOG ================= -->

        <div class="course-card">

            <div class="course-card-header">

                <div>

                    <h3>
                        Course Catalog
                    </h3>

                    <p>
                        Select courses you want to enroll in.
                    </p>

                </div>


                <div class="header-actions">

                    <c:if test="${not empty courses}">

                        <div class="course-count">

                            ${courses.size()} Courses

                        </div>

                    </c:if>


                    <a
                        href="${pageContext.request.contextPath}/student/cart"
                        class="view-cart-btn">

                        <i class="bi bi-cart3"></i>

                        View Cart

                    </a>

                </div>

            </div>


            <!-- ================= COURSES ================= -->

            <c:choose>

                <c:when test="${not empty courses}">

                    <c:forEach var="course" items="${courses}">

                        <div class="course-row">

                            <div class="course-icon">

                                <i class="bi bi-book-half"></i>

                            </div>


                            <div class="course-info">

                                <div class="course-code">

                                    ${course.courseCode}

                                </div>

                                <h4 class="course-title">

                                    ${course.title}

                                </h4>

                                <div class="course-department">

                                    <i class="bi bi-building me-1"></i>

                                    ${course.departmentName}

                                </div>

                            </div>


                            <div class="course-details">

                                <span class="detail-badge">

                                    <i class="bi bi-award"></i>

                                    ${course.credits} Credits

                                </span>


                                <span class="detail-badge">

                                    <i class="bi bi-person-check"></i>

                                    ${course.availableSeats} Seats

                                </span>


                                <span class="detail-badge fee-badge">

                                    <i class="bi bi-currency-rupee"></i>

                                    ${course.feeAmount}

                                </span>

                            </div>


                            <a
                                href="${pageContext.request.contextPath}/student/cart/add?courseId=${course.id}"
                                class="add-cart-btn">

                                <i class="bi bi-cart-plus"></i>

                                Add to Cart

                            </a>

                        </div>

                    </c:forEach>

                </c:when>


                <c:otherwise>

                    <div class="empty-state">

                        <div class="empty-icon">

                            <i class="bi bi-journal-x"></i>

                        </div>

                        <h4>
                            No Courses Available
                        </h4>

                        <p>
                            There are currently no courses available for enrollment.
                        </p>

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

                if (window.innerWidth <= 900) {

                    document
                        .getElementById("sidebar")
                        .classList.remove("show");

                }

            });

        });

</script>

</body>

</html>
