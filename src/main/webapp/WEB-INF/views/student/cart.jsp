<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>


<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Enrollment Cart | Student Portal</title>

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
        transform: translateX(3px);
    }

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

    /* ================= CART ================= */

    .cart-card {
        background: #FFFFFF;
        border: 1px solid #DDD2E5;
        border-radius: 14px;
        overflow: hidden;
        box-shadow: 0 4px 15px rgba(36,23,46,0.05);
    }

    .cart-header {
        padding: 20px 22px;
        border-bottom: 1px solid #DDD2E5;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .cart-heading {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .cart-heading-icon {
        width: 44px;
        height: 44px;
        border-radius: 11px;
        background: #EEE5F5;
        color: #6D3FA0;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 19px;
    }

    .cart-header h3 {
        margin: 0;
        font-size: 17px;
        font-weight: 800;
        color: #24172E;
    }

    .cart-header p {
        margin: 4px 0 0;
        color: #786B82;
        font-size: 11px;
    }

    .cart-count {
        background: #EEE5F5;
        color: #6D3FA0;
        padding: 8px 12px;
        border-radius: 20px;
        font-size: 11px;
        font-weight: 700;
    }

    /* ================= TABLE ================= */

    .table-wrapper {
        overflow-x: auto;
    }

    .cart-table {
        width: 100%;
        border-collapse: collapse;
        min-width: 750px;
    }

    .cart-table th {
        padding: 13px 20px;
        background: #FAF8FC;
        border-bottom: 1px solid #DDD2E5;
        color: #786B82;
        font-size: 10px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: .5px;
        text-align: left;
    }

    .cart-table td {
        padding: 17px 20px;
        border-bottom: 1px solid #EEE5F5;
        font-size: 12px;
        vertical-align: middle;
        color: #24172E;
    }

    .cart-table tbody tr:hover {
        background: #FAF8FC;
    }

    .course-cell {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .course-icon {
        width: 40px;
        height: 40px;
        border-radius: 10px;
        background: #EEE5F5;
        color: #6D3FA0;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
    }

    .course-code {
        display: block;
        color: #6D3FA0;
        font-size: 10px;
        font-weight: 800;
        margin-bottom: 3px;
    }

    .course-title {
        font-size: 12px;
        font-weight: 700;
        color: #24172E;
    }

    .credits-badge {
        display: inline-block;
        background: #F3EEF7;
        color: #5F5368;
        padding: 6px 9px;
        border-radius: 7px;
        font-size: 10px;
        font-weight: 700;
    }

    .fee {
        color: #477A58;
        font-weight: 800;
        font-size: 12px;
    }

    .remove-btn {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        border: 1px solid #E8C8D0;
        background: #F8EDEF;
        color: #B4475B;
        padding: 7px 10px;
        border-radius: 7px;
        text-decoration: none;
        font-size: 10px;
        font-weight: 700;
    }

    .remove-btn:hover {
        background: #F3DDE2;
        color: #963649;
    }

    /* ================= CART FOOTER ================= */

    .cart-footer {
        padding: 20px 22px;
        background: #FAF8FC;
        border-top: 1px solid #DDD2E5;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 20px;
    }

    .total-label {
        color: #786B82;
        font-size: 11px;
        margin-bottom: 3px;
    }

    .total-amount {
        color: #24172E;
        font-size: 21px;
        font-weight: 800;
    }

    .footer-actions {
        display: flex;
        gap: 10px;
    }

    .continue-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 7px;
        border: none;
        background: #6D3FA0;
        color: white;
        padding: 11px 17px;
        border-radius: 8px;
        text-decoration: none;
        font-size: 11px;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .continue-btn:hover {
        background: #4B286B;
        color: white;
        transform: translateY(-1px);
    }

    .browse-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 7px;
        background: #FFFFFF;
        border: 1px solid #DDD2E5;
        color: #4B286B;
        padding: 11px 17px;
        border-radius: 8px;
        text-decoration: none;
        font-size: 11px;
        font-weight: 700;
    }

    .browse-btn:hover {
        background: #FAF8FC;
        color: #24172E;
    }

    /* ================= EMPTY ================= */

    .empty-state {
        padding: 70px 20px;
        text-align: center;
    }

    .empty-icon {
        width: 74px;
        height: 74px;
        margin: 0 auto 17px;
        border-radius: 50%;
        background: #EEE5F5;
        color: #6D3FA0;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 30px;
    }

    .empty-state h4 {
        font-size: 17px;
        font-weight: 800;
        margin-bottom: 7px;
        color: #24172E;
    }

    .empty-state p {
        color: #786B82;
        font-size: 12px;
        margin-bottom: 18px;
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

    }

    @media (max-width: 600px) {

        .page-title {
            font-size: 21px;
        }

        .cart-header {
            align-items: flex-start;
            gap: 12px;
        }

        .cart-footer {
            flex-direction: column;
            align-items: stretch;
        }

        .footer-actions {
            width: 100%;
            flex-direction: column;
        }

        .continue-btn,
        .browse-btn {
            width: 100%;
        }

    }

</style>


</head>

<body>

<div class="dashboard-container">

```
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


        <a href="${pageContext.request.contextPath}/student/dashboard"
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


        <a href="${pageContext.request.contextPath}/student/courses"
           class="menu-item">

            <i class="bi bi-journal-bookmark-fill"></i>
            Available Courses

        </a>


        <a href="${pageContext.request.contextPath}/student/enrollments"
           class="menu-item">

            <i class="bi bi-journal-check"></i>
            My Enrollments

        </a>


        <div class="menu-label">
            ACCOUNT
        </div>


        <a href="${pageContext.request.contextPath}/student/fees"
           class="menu-item">

            <i class="bi bi-credit-card-fill"></i>
            Fee & Receipt

        </a>


        <a href="${pageContext.request.contextPath}/student/logout"
           class="menu-item logout-link">

            <i class="bi bi-box-arrow-right"></i>
            Logout

        </a>

    </nav>

</aside>


<!-- ================= MAIN ================= -->

<main class="main-content">

    <div class="top-header">

        <div>

            <button
                class="mobile-menu-btn"
                onclick="toggleSidebar()">

                <i class="bi bi-list"></i>

            </button>

            <h1 class="page-title">
                Enrollment Cart
            </h1>

            <p class="page-subtitle">
                Review your selected courses before enrollment.
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


    <!-- ================= CART ================= -->

    <div class="cart-card">

        <div class="cart-header">

            <div class="cart-heading">

                <div class="cart-heading-icon">

                    <i class="bi bi-cart3"></i>

                </div>

                <div>

                    <h3>
                        Selected Courses
                    </h3>

                    <p>
                        Courses currently added to your enrollment cart.
                    </p>

                </div>

            </div>


            <div class="cart-count">

                ${cart.size()} Items

            </div>

        </div>


        <c:choose>

            <c:when test="${not empty cart}">

                <div class="table-wrapper">

                    <table class="cart-table">

                        <thead>

                            <tr>

                                <th>
                                    Course
                                </th>

                                <th>
                                    Credits
                                </th>

                                <th>
                                    Fee
                                </th>

                                <th>
                                    Action
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                            <c:forEach
                                var="item"
                                items="${cart}">

                                <tr>

                                    <td>

                                        <div class="course-cell">

                                            <div class="course-icon">

                                                <i class="bi bi-book-half"></i>

                                            </div>

                                            <div>

                                                <span class="course-code">

                                                    ${item.courseCode}

                                                </span>

                                                <div class="course-title">

                                                    ${item.courseTitle}

                                                </div>

                                            </div>

                                        </div>

                                    </td>


                                    <td>

                                        <span class="credits-badge">

                                            ${item.credits} Credits

                                        </span>

                                    </td>


                                    <td>

                                        <span class="fee">

                                            ₹ ${item.feeAmount}

                                        </span>

                                    </td>


                                    <td>

                                        <a
                                            href="${pageContext.request.contextPath}/student/cart/remove?courseId=${item.courseId}"
                                            class="remove-btn"
                                            onclick="return confirmRemove();">

                                            <i class="bi bi-trash3"></i>

                                            Remove

                                        </a>

                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>


                <!-- ================= FOOTER ================= -->

                <div class="cart-footer">

                    <div>

                        <div class="total-label">
                            Total Enrollment Fee
                        </div>

                        <div class="total-amount">

                            ₹ ${totalFee}

                        </div>

                    </div>


                    <div class="footer-actions">

                        <a
                            href="${pageContext.request.contextPath}/student/courses"
                            class="browse-btn">

                            <i class="bi bi-arrow-left"></i>

                            Add More Courses

                        </a>


                        <form
                            action="${pageContext.request.contextPath}/student/cart/confirm"
                            method="post"
                            style="margin:0;">

                            <button
                                type="submit"
                                class="continue-btn"
                                onclick="return confirmEnrollment();">

                                Continue to Enroll

                                <i class="bi bi-arrow-right"></i>

                            </button>

                        </form>

                    </div>

                </div>

            </c:when>


            <c:otherwise>

                <div class="empty-state">

                    <div class="empty-icon">

                        <i class="bi bi-cart-x"></i>

                    </div>

                    <h4>
                        Your Cart is Empty
                    </h4>

                    <p>
                        You have not added any courses yet.
                        Browse available courses and add them to your cart.
                    </p>

                    <a
                        href="${pageContext.request.contextPath}/student/courses"
                        class="continue-btn">

                        <i class="bi bi-journal-bookmark"></i>

                        Browse Courses

                    </a>

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


    function confirmRemove() {

        return confirm(
            "Are you sure you want to remove this course from your cart?"
        );

    }


    function confirmEnrollment() {

        return confirm(
            "Are you sure you want to continue with enrollment for the selected courses?"
        );

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
