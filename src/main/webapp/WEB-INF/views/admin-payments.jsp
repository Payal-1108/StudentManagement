<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>
<head>


<meta charset="UTF-8">

<title>Payment Management</title>

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


    /* =========================
       LAYOUT
    ========================= */

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


    /* =========================
       HEADER
    ========================= */

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


    /* =========================
       PAGE ACTIONS
    ========================= */

    .page-actions {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 20px;
    }

    .section-heading h2 {
        margin: 0;
        font-size: 19px;
        font-weight: 700;
        color: #24172E;
    }

    .section-heading p {
        margin: 5px 0 0;
        color: #786B82;
        font-size: 12px;
    }


    /* =========================
       PAYMENT COUNT
    ========================= */

    .payment-count {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background: #EEE5F5;
        color: #6D3FA0;
        padding: 8px 13px;
        border-radius: 9px;
        font-size: 12px;
        font-weight: 600;
    }

    .payment-count i {
        font-size: 15px;
    }


    /* =========================
       TABLE
    ========================= */

    .table-card {
        background: #FFFFFF;
        border: 1px solid #DDD2E5;
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(36,23,46,0.04);
    }

    .table-wrapper {
        width: 100%;
        overflow-x: auto;
    }

    .payment-table {
        width: 100%;
        min-width: 850px;
        border-collapse: collapse;
    }

    .payment-table thead th {
        background: #FAF8FC;
        color: #786B82;
        padding: 14px 16px;
        text-align: left;
        font-size: 11px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.4px;
        border-bottom: 1px solid #DDD2E5;
        white-space: nowrap;
    }

    .payment-table tbody td {
        padding: 15px 16px;
        border-bottom: 1px solid #EEE8F1;
        color: #4B3D52;
        font-size: 12px;
        vertical-align: middle;
    }

    .payment-table tbody tr {
        transition: background 0.2s ease;
    }

    .payment-table tbody tr:hover {
        background: #FAF8FC;
    }

    .payment-table tbody tr:last-child td {
        border-bottom: none;
    }


    /* =========================
       STUDENT ID
    ========================= */

    .student-id {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        font-weight: 600;
        color: #4B3D52;
    }

    .student-icon {
        width: 32px;
        height: 32px;
        border-radius: 9px;
        background: #EEE5F5;
        color: #6D3FA0;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 13px;
    }


    /* =========================
       AMOUNT
    ========================= */

    .amount {
        font-size: 13px;
        font-weight: 700;
        color: #24172E;
        white-space: nowrap;
    }


    /* =========================
       DATE
    ========================= */

    .payment-date {
        color: #4B3D52;
        white-space: nowrap;
    }


    /* =========================
       STATUS
    ========================= */

    .payment-status {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        padding: 6px 10px;
        border-radius: 20px;
        font-size: 10px;
        font-weight: 700;
        white-space: nowrap;
    }

    .payment-status::before {
        content: "";
        width: 6px;
        height: 6px;
        border-radius: 50%;
        background: currentColor;
    }

    .status-paid {
        background: #E5F2E8;
        color: #477A58;
    }

    .status-pending {
        background: #F3EEF7;
        color: #6D3FA0;
    }

    .status-other {
        background: #F3EEF7;
        color: #4B3D52;
    }


    /* =========================
       RECEIPT
    ========================= */

    .receipt-number {
        display: inline-block;
        padding: 5px 9px;
        background: #F3EEF7;
        color: #4B286B;
        border-radius: 6px;
        font-size: 10px;
        font-weight: 600;
        white-space: nowrap;
    }


    /* =========================
       VIEW RECEIPT
    ========================= */

    .view-receipt {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 7px 11px;
        border-radius: 7px;
        text-decoration: none;
        font-size: 10px;
        font-weight: 700;
        background: #EEE5F5;
        color: #6D3FA0;
        transition: all 0.2s ease;
        white-space: nowrap;
    }

    .view-receipt:hover {
        background: #CDB1E8;
        color: #4B286B;
        transform: translateY(-1px);
    }


    /* =========================
       EMPTY STATE
    ========================= */

    .empty-state {
        padding: 65px 20px;
        text-align: center;
    }

    .empty-icon {
        width: 64px;
        height: 64px;
        margin: 0 auto 15px;
        border-radius: 50%;
        background: #EEE5F5;
        color: #6D3FA0;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 27px;
    }

    .empty-state h3 {
        margin: 0;
        font-size: 16px;
        font-weight: 700;
        color: #4B3D52;
    }

    .empty-state p {
        margin: 7px 0 0;
        color: #786B82;
        font-size: 12px;
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
            align-items: flex-start;
            gap: 12px;
            flex-direction: column;
        }
    }


    @media (max-width: 600px) {

        .page-title {
            font-size: 21px;
        }

        .main-content {
            padding: 18px;
        }

        .admin-profile {
            padding-right: 7px;
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


<!-- MAIN CONTENT -->

<main class="main-content">


    <!-- HEADER -->

    <header class="top-header">

        <div style="display:flex; align-items:center; gap:12px;">

            <button
                class="mobile-menu-btn"
                type="button"
                onclick="toggleSidebar()">

                <i class="bi bi-list"></i>

            </button>


            <div>

                <h1 class="page-title">
                    Payment Management
                </h1>

                <p class="page-subtitle">
                    View and manage student fee payments
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


    <!-- PAGE HEADER -->

    <div class="page-actions">

        <div class="section-heading">

            <h2>
                Student Payments
            </h2>

            <p>
                All student fee payment records
            </p>

        </div>


        <c:if test="${not empty payments}">

            <div class="payment-count">

                <i class="bi bi-credit-card-fill"></i>

                ${payments.size()} Payment Records

            </div>

        </c:if>

    </div>


    <!-- PAYMENT TABLE -->

    <div class="table-card">

        <c:choose>

            <c:when test="${not empty payments}">

                <div class="table-wrapper">

                    <table class="payment-table">

                        <thead>

                            <tr>

                                <th>Student ID</th>

                                <th>Amount</th>

                                <th>Payment Date</th>

                                <th>Status</th>

                                <th>Receipt Number</th>

                                <th>Action</th>

                            </tr>

                        </thead>


                        <tbody>

                            <c:forEach
                                var="payment"
                                items="${payments}">

                                <tr>


                                    <!-- STUDENT ID -->

                                    <td>

                                        <div class="student-id">

                                            <div class="student-icon">

                                                <i class="bi bi-person-fill"></i>

                                            </div>

                                            ${payment.studentId}

                                        </div>

                                    </td>


                                    <!-- AMOUNT -->

                                    <td>

                                        <span class="amount">

                                            ₹${payment.amount}

                                        </span>

                                    </td>


                                    <!-- PAYMENT DATE -->

                                    <td>

                                        <span class="payment-date">

                                            ${payment.paymentDate}

                                        </span>

                                    </td>


                                    <!-- STATUS -->

                                    <td>

                                        <c:choose>

                                            <c:when
                                                test="${payment.paymentStatus == 'Paid'}">

                                                <span class="payment-status status-paid">

                                                    Paid

                                                </span>

                                            </c:when>


                                            <c:when
                                                test="${payment.paymentStatus == 'Pending'}">

                                                <span class="payment-status status-pending">

                                                    Pending

                                                </span>

                                            </c:when>


                                            <c:otherwise>

                                                <span class="payment-status status-other">

                                                    ${payment.paymentStatus}

                                                </span>

                                            </c:otherwise>

                                        </c:choose>

                                    </td>


                                    <!-- RECEIPT NUMBER -->

                                    <td>

                                        <span class="receipt-number">

                                            ${payment.receiptNumber}

                                        </span>

                                    </td>


                                    <!-- ACTION -->

                                    <td>

                                        <a
                                            href="${pageContext.request.contextPath}/admin/receipt?receiptNumber=${payment.receiptNumber}"
                                            class="view-receipt">

                                            <i class="bi bi-receipt"></i>
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

                <div class="empty-state">

                    <div class="empty-icon">

                        <i class="bi bi-credit-card-2-front"></i>

                    </div>

                    <h3>
                        No Payment Records
                    </h3>

                    <p>
                        There are currently no student payment records to display.
                    </p>

                </div>

            </c:otherwise>

        </c:choose>

    </div>


</main>
```

</div>

<script>

    function toggleSidebar() {

        const sidebar =
            document.getElementById("sidebar");

        sidebar.classList.toggle("show");

    }


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
