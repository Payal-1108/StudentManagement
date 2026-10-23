
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Fee & Receipt</title>

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
           COMMON CARD
           ========================= */

        .fee-card {
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(36,23,46,0.05);
            margin-bottom: 22px;
            overflow: hidden;
        }

        .card-header-modern {
            display: flex;
            align-items: center;
            gap: 13px;
            padding: 21px 25px;
            border-bottom: 1px solid #EEE5F5;
        }

        .card-icon {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 11px;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 18px;
        }

        .card-header-modern h2 {
            margin: 0;
            font-size: 16px;
            font-weight: 800;
            color: #24172E;
        }

        .card-header-modern p {
            margin: 3px 0 0;
            color: #786B82;
            font-size: 10px;
        }

        .card-body-modern {
            padding: 24px 25px;
        }


        /* =========================
           STUDENT INFORMATION
           ========================= */

        .student-info {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
        }

        .info-box {
            padding: 17px;
            background: #FAF8FC;
            border: 1px solid #EEE5F5;
            border-radius: 11px;
        }

        .info-box label {
            display: flex;
            align-items: center;
            gap: 6px;
            color: #786B82;
            font-size: 9px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }

        .info-box label i {
            color: #6D3FA0;
            font-size: 11px;
        }

        .info-box p {
            margin: 0;
            color: #24172E;
            font-size: 12px;
            font-weight: 700;
            word-break: break-word;
        }


        /* =========================
           FEE SUMMARY
           ========================= */

        .fee-summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .fee-label {
            color: #786B82;
            font-size: 10px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .fee-amount {
            color: #24172E;
            font-size: 29px;
            font-weight: 800;
        }

        .fee-note {
            margin-top: 5px;
            color: #786B82;
            font-size: 10px;
        }

        .pay-btn {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 11px 18px;
            background: #6D3FA0;
            color: white;
            text-decoration: none;
            border-radius: 9px;
            font-size: 11px;
            font-weight: 700;
            box-shadow: 0 6px 14px rgba(109,63,160,0.16);
            transition: all 0.2s ease;
        }

        .pay-btn:hover {
            background: #4B286B;
            color: white;
            transform: translateY(-1px);
        }

        .payment-completed {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 10px 14px;
            background: #F1F7F3;
            color: #477A58;
            border-radius: 9px;
            font-size: 10px;
            font-weight: 700;
        }


        /* =========================
           TABLE
           ========================= */

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .fee-table {
            width: 100%;
            min-width: 650px;
            border-collapse: collapse;
        }

        .fee-table th {
            padding: 13px 18px;
            text-align: left;
            background: #FAF8FC;
            color: #786B82;
            border-bottom: 1px solid #DDD2E5;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .fee-table td {
            padding: 16px 18px;
            border-bottom: 1px solid #EEE5F5;
            color: #4B286B;
            font-size: 11px;
            vertical-align: middle;
        }

        .fee-table tbody tr {
            transition: background 0.2s ease;
        }

        .fee-table tbody tr:hover {
            background: #FAF8FC;
        }

        .fee-table tbody tr:last-child td {
            border-bottom: none;
        }


        /* =========================
           COURSE DATA
           ========================= */

        .course-code {
            color: #6D3FA0 !important;
            font-weight: 700;
        }

        .course-title {
            color: #24172E !important;
            font-weight: 600;
        }

        .credits-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 5px 9px;
            background: #F3EEF7;
            color: #4B286B;
            border-radius: 7px;
            font-size: 10px;
            font-weight: 600;
        }

        .credits-badge i {
            color: #6D3FA0;
        }

        .fee {
            color: #477A58;
            font-weight: 700;
        }


        /* =========================
           STATUS
           ========================= */

        .status,
        .payment-status {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 6px 10px;
            border-radius: 20px;
            background: #F1F7F3;
            color: #477A58;
            font-size: 9px;
            font-weight: 700;
        }

        .status::before,
        .payment-status::before {
            content: "";
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: currentColor;
        }


        /* =========================
           RECEIPT
           ========================= */

        .view-receipt {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #6D3FA0;
            text-decoration: none;
            font-size: 10px;
            font-weight: 700;
        }

        .view-receipt:hover {
            color: #4B286B;
            text-decoration: underline;
        }


        /* =========================
           EMPTY STATE
           ========================= */

        .empty-data {
            text-align: center;
            padding: 55px 20px;
        }

        .empty-icon {
            width: 58px;
            height: 58px;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 24px;
        }

        .empty-data h3 {
            margin: 0 0 7px;
            color: #24172E;
            font-size: 15px;
            font-weight: 700;
        }

        .empty-data p {
            margin: 0;
            color: #786B82;
            font-size: 10px;
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
            background: white;
            color: #4B286B;
            font-size: 20px;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
        }


        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 1000px) {

            .student-info {
                grid-template-columns: repeat(2, 1fr);
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

        }


        @media (max-width: 600px) {

            .page-title {
                font-size: 21px;
            }

            .student-info {
                grid-template-columns: 1fr;
            }

            .card-header-modern,
            .card-body-modern {
                padding: 18px;
            }

            .fee-summary {
                flex-direction: column;
                align-items: flex-start;
                gap: 18px;
            }

            .fee-amount {
                font-size: 25px;
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


        <!-- HEADER -->

        <div class="top-header">

            <div>

                <button
                    type="button"
                    class="mobile-menu-btn"
                    onclick="toggleSidebar()">

                    <i class="bi bi-list"></i>

                </button>

                <h1 class="page-title">
                    Fee & Receipt
                </h1>

                <p class="page-subtitle">
                    View your semester fees, enrolled courses and payment history.
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


        <!-- =========================
             STUDENT INFORMATION
             ========================= -->

        <div class="fee-card">

            <div class="card-header-modern">

                <div class="card-icon">

                    <i class="bi bi-person-vcard-fill"></i>

                </div>

                <div>

                    <h2>
                        Student Information
                    </h2>

                    <p>
                        Your academic information
                    </p>

                </div>

            </div>


            <div class="card-body-modern">

                <div class="student-info">


                    <div class="info-box">

                        <label>
                            <i class="bi bi-person-fill"></i>
                            Name
                        </label>

                        <p>
                            ${student.name}
                        </p>

                    </div>


                    <div class="info-box">

                        <label>
                            <i class="bi bi-card-text"></i>
                            Roll Number
                        </label>

                        <p>
                            ${student.rollNumber}
                        </p>

                    </div>


                    <div class="info-box">

                        <label>
                            <i class="bi bi-envelope-fill"></i>
                            Email
                        </label>

                        <p>
                            ${student.email}
                        </p>

                    </div>


                    <div class="info-box">

                        <label>
                            <i class="bi bi-calendar3"></i>
                            Semester
                        </label>

                        <p>
                            Semester ${student.currentSemester}
                        </p>

                    </div>


                </div>

            </div>

        </div>


        <!-- =========================
             SEMESTER FEE
             ========================= -->

        <div class="fee-card">

            <div class="card-header-modern">

                <div class="card-icon">

                    <i class="bi bi-wallet2"></i>

                </div>

                <div>

                    <h2>
                        Semester Fee
                    </h2>

                    <p>
                        Total fee calculated from your active enrollments
                    </p>

                </div>

            </div>


            <div class="card-body-modern">

                <div class="fee-summary">


                    <div>

                        <div class="fee-label">
                            PENDING FEE
                        </div>

                        <div class="fee-amount">
                            Rs. ${pendingFee}
                        </div>

                        <div class="fee-note">
                            Amount remaining for your current enrollment
                        </div>

                    </div>


                    <div>

                        <c:choose>

                            <c:when test="${pendingFee > 0}">

                                <a
                                    href="${pageContext.request.contextPath}/student/payment"
                                    class="pay-btn">

                                    <i class="bi bi-credit-card-fill"></i>

                                    Pay Now

                                </a>

                            </c:when>


                            <c:otherwise>

                                <span class="payment-completed">

                                    <i class="bi bi-check-circle-fill"></i>

                                    Payment Completed

                                </span>

                            </c:otherwise>

                        </c:choose>

                    </div>


                </div>

            </div>

        </div>


        <!-- =========================
             ENROLLED COURSES
             ========================= -->

        <div class="fee-card">

            <div class="card-header-modern">

                <div class="card-icon">

                    <i class="bi bi-journal-check"></i>

                </div>

                <div>

                    <h2>
                        Enrolled Courses
                    </h2>

                    <p>
                        Courses included in your semester fee
                    </p>

                </div>

            </div>


            <c:choose>

                <c:when test="${not empty enrollments}">

                    <div class="table-wrapper">

                        <table class="fee-table">

                            <thead>

                                <tr>

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
                                        Fee
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:forEach
                                    var="enrollment"
                                    items="${enrollments}">

                                    <c:if
                                        test="${enrollment.status == 'Enrolled'}">

                                        <tr>

                                            <td class="course-code">
                                                ${enrollment.courseCode}
                                            </td>


                                            <td class="course-title">
                                                ${enrollment.courseTitle}
                                            </td>


                                            <td>

                                                <span class="credits-badge">

                                                    <i class="bi bi-award"></i>

                                                    ${enrollment.credits}

                                                </span>

                                            </td>


                                            <td class="fee">

                                                Rs. ${enrollment.feeAmount}

                                            </td>


                                            <td>

                                                <span class="status">

                                                    Enrolled

                                                </span>

                                            </td>

                                        </tr>

                                    </c:if>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="empty-data">

                        <div class="empty-icon">

                            <i class="bi bi-journal-x"></i>

                        </div>

                        <h3>
                            No Enrolled Courses
                        </h3>

                        <p>
                            You have not enrolled in any active courses.
                        </p>

                    </div>

                </c:otherwise>

            </c:choose>

        </div>


        <!-- =========================
             PAYMENT HISTORY
             ========================= -->

        <div class="fee-card">

            <div class="card-header-modern">

                <div class="card-icon">

                    <i class="bi bi-receipt-cutoff"></i>

                </div>

                <div>

                    <h2>
                        Payment History
                    </h2>

                    <p>
                        View your previous fee payments and receipts
                    </p>

                </div>

            </div>


            <c:choose>

                <c:when test="${not empty payments}">

                    <div class="table-wrapper">

                        <table class="fee-table">

                            <thead>

                                <tr>

                                    <th>
                                        Receipt Number
                                    </th>

                                    <th>
                                        Amount
                                    </th>

                                    <th>
                                        Payment Date
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                    <th>
                                        Receipt
                                    </th>

                                </tr>

                            </thead>


                            <tbody>

                                <c:forEach
                                    var="payment"
                                    items="${payments}">

                                    <tr>


                                        <td class="course-code">

                                            ${payment.receiptNumber}

                                        </td>


                                        <td class="fee">

                                            Rs. ${payment.amount}

                                        </td>


                                        <td>

                                            ${payment.paymentDate}

                                        </td>


                                        <td>

                                            <span class="payment-status">

                                                ${payment.paymentStatus}

                                            </span>

                                        </td>


                                        <td>

                                            <a
                                                href="${pageContext.request.contextPath}/student/receipt?receiptNumber=${payment.receiptNumber}"
                                                class="view-receipt">

                                                <i class="bi bi-file-earmark-text"></i>

                                                View Receipt

                                            </a>

                                        </td>


                                    </tr>

                                </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </c:when>


                <c:otherwise>

                    <div class="empty-data">

                        <div class="empty-icon">

                            <i class="bi bi-receipt"></i>

                        </div>

                        <h3>
                            No Payment History
                        </h3>

                        <p>
                            No fee payments have been made yet.
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

