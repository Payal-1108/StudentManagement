
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Make Payment</title>

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
           PAYMENT LAYOUT
           ========================= */

        .payment-layout {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 350px;
            gap: 22px;
            max-width: 1050px;
        }


        /* =========================
           PAYMENT CARD
           ========================= */

        .payment-card {
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(36,23,46,0.05);
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
           PAYMENT DETAILS
           ========================= */

        .payment-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            padding: 15px 0;
            border-bottom: 1px solid #EEE5F5;
        }

        .payment-label {
            display: flex;
            align-items: center;
            gap: 9px;
            color: #786B82;
            font-size: 11px;
            font-weight: 600;
        }

        .payment-label i {
            width: 27px;
            height: 27px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 7px;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 12px;
        }

        .payment-value {
            color: #24172E;
            font-size: 11px;
            font-weight: 700;
            text-align: right;
        }


        /* =========================
           TOTAL
           ========================= */

        .total-row {
            margin-top: 10px;
            padding: 20px 0 5px;
            border-top: 2px solid #DDD2E5;
            border-bottom: none;
        }

        .total-label {
            color: #24172E;
            font-size: 14px;
            font-weight: 800;
        }

        .total-amount {
            color: #6D3FA0;
            font-size: 25px;
            font-weight: 800;
        }


        /* =========================
           PAYMENT METHOD
           ========================= */

        .form-section {
            margin-top: 25px;
            padding-top: 23px;
            border-top: 1px solid #EEE5F5;
        }

        .form-label-modern {
            display: block;
            margin-bottom: 8px;
            color: #3E3447;
            font-size: 11px;
            font-weight: 700;
        }

        .form-label-modern i {
            color: #6D3FA0;
            margin-right: 5px;
        }

        .payment-select {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #DDD2E5;
            border-radius: 9px;
            background: #FFFFFF;
            color: #4B286B;
            font-family: 'Inter', sans-serif;
            font-size: 11px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .payment-select:focus {
            border-color: #6D3FA0;
            box-shadow: 0 0 0 3px rgba(109,63,160,0.10);
        }


        /* =========================
           BUTTONS
           ========================= */

        .button-row {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 22px;
        }

        .pay-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            border: none;
            padding: 11px 20px;
            background: #6D3FA0;
            color: white;
            border-radius: 9px;
            font-family: 'Inter', sans-serif;
            font-size: 11px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 6px 14px rgba(109,63,160,0.16);
            transition: all 0.2s ease;
        }

        .pay-button:hover {
            background: #4B286B;
            transform: translateY(-1px);
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            padding: 10px 17px;
            background: #F8F6FA;
            color: #4B286B;
            text-decoration: none;
            border-radius: 9px;
            font-size: 11px;
            font-weight: 700;
            transition: all 0.2s ease;
        }

        .back-button:hover {
            background: #EEE5F5;
            color: #24172E;
        }


        /* =========================
           SUMMARY CARD
           ========================= */

        .summary-card {
            background: linear-gradient(145deg, #1B1028, #6D3FA0);
            color: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 10px 25px rgba(36,23,46,0.14);
            height: fit-content;
        }

        .summary-icon {
            width: 46px;
            height: 46px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            background: rgba(255,255,255,0.12);
            font-size: 19px;
            margin-bottom: 20px;
        }

        .summary-card h3 {
            margin: 0 0 7px;
            font-size: 17px;
            font-weight: 800;
        }

        .summary-card p {
            margin: 0 0 22px;
            color: rgba(255,255,255,0.65);
            font-size: 10px;
            line-height: 1.6;
        }

        .summary-amount-label {
            color: rgba(255,255,255,0.55);
            font-size: 9px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.7px;
        }

        .summary-amount {
            margin-top: 5px;
            font-size: 28px;
            font-weight: 800;
        }

        .secure-note {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 24px;
            padding-top: 18px;
            border-top: 1px solid rgba(255,255,255,0.12);
            color: rgba(255,255,255,0.62);
            font-size: 9px;
            line-height: 1.5;
        }

        .secure-note i {
            color: #D6C1E8;
            font-size: 14px;
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
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
        }


        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 900px) {

            .payment-layout {
                grid-template-columns: 1fr;
                max-width: 700px;
            }

            .summary-card {
                order: -1;
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

            .card-header-modern,
            .card-body-modern {
                padding: 18px;
            }

            .payment-row {
                align-items: flex-start;
            }

            .payment-value {
                max-width: 55%;
                word-break: break-word;
            }

            .button-row {
                flex-direction: column;
                align-items: stretch;
            }

            .pay-button,
            .back-button {
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
                    Make Payment
                </h1>

                <p class="page-subtitle">
                    Complete your semester fee payment securely.
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
             PAYMENT LAYOUT
             ========================= -->

        <div class="payment-layout">


            <!-- PAYMENT FORM CARD -->

            <div class="payment-card">

                <div class="card-header-modern">

                    <div class="card-icon">

                        <i class="bi bi-credit-card-fill"></i>

                    </div>

                    <div>

                        <h2>
                            Payment Details
                        </h2>

                        <p>
                            Review your details before making payment
                        </p>

                    </div>

                </div>


                <div class="card-body-modern">


                    <!-- STUDENT NAME -->

                    <div class="payment-row">

                        <span class="payment-label">

                            <i class="bi bi-person-fill"></i>

                            Student Name

                        </span>

                        <span class="payment-value">

                            ${student.name}

                        </span>

                    </div>


                    <!-- ROLL NUMBER -->

                    <div class="payment-row">

                        <span class="payment-label">

                            <i class="bi bi-card-text"></i>

                            Roll Number

                        </span>

                        <span class="payment-value">

                            ${student.rollNumber}

                        </span>

                    </div>


                    <!-- SEMESTER -->

                    <div class="payment-row">

                        <span class="payment-label">

                            <i class="bi bi-calendar3"></i>

                            Semester

                        </span>

                        <span class="payment-value">

                            Semester ${student.currentSemester}

                        </span>

                    </div>


                    <!-- TOTAL -->

                    <div class="payment-row total-row">

                        <span class="total-label">
                            Total Payable
                        </span>

                        <span class="total-amount">
                            Rs. ${totalFee}
                        </span>

                    </div>


                    <!-- PAYMENT FORM -->

                    <form
                        action="${pageContext.request.contextPath}/student/payment"
                        method="post"
                        id="paymentForm">


                        <div class="form-section">

                            <label
                                for="paymentMethod"
                                class="form-label-modern">

                                <i class="bi bi-wallet2"></i>

                                Payment Method

                            </label>


                            <select
                                id="paymentMethod"
                                name="paymentMethod"
                                class="payment-select"
                                required>

                                <option value="">
                                    Select Payment Method
                                </option>

                                <option value="UPI">
                                    UPI
                                </option>

                                <option value="CARD">
                                    Debit / Credit Card
                                </option>

                                <option value="NET_BANKING">
                                    Net Banking
                                </option>

                            </select>

                        </div>


                        <div class="button-row">

                            <button
                                type="submit"
                                class="pay-button"
                                id="payButton">

                                <i class="bi bi-lock-fill"></i>

                                Pay Now

                            </button>


                            <a
                                href="${pageContext.request.contextPath}/student/fees"
                                class="back-button">

                                <i class="bi bi-arrow-left"></i>

                                Cancel

                            </a>

                        </div>


                    </form>

                </div>

            </div>


            <!-- PAYMENT SUMMARY -->

            <div class="summary-card">

                <div class="summary-icon">

                    <i class="bi bi-wallet2"></i>

                </div>


                <h3>
                    Payment Summary
                </h3>


                <p>
                    Your payment will be recorded against your current semester enrollment.
                </p>


                <div class="summary-amount-label">
                    Amount Payable
                </div>


                <div class="summary-amount">
                    Rs. ${totalFee}
                </div>


                <div class="secure-note">

                    <i class="bi bi-shield-lock-fill"></i>

                    <span>
                        Your payment information is handled securely by the university portal.
                    </span>

                </div>

            </div>


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


    document
        .getElementById("paymentForm")
        .addEventListener("submit", function() {

            const button =
                document.getElementById("payButton");

            button.innerHTML =
                '<i class="bi bi-arrow-repeat"></i> Processing...';

            button.disabled = true;

        });

</script>


</body>

</html>

