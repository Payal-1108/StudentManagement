
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Official Payment Receipt</title>

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


        /* =========================
           PAGE
           ========================= */

        .receipt-page {
            min-height: 100vh;
            padding: 35px 20px;
        }


        /* =========================
           RECEIPT
           ========================= */

        .receipt-container {
            width: 100%;
            max-width: 850px;
            margin: 0 auto;
            background: #FFFFFF;
            border: 1px solid #DDD2E5;
            border-radius: 18px;
            box-shadow: 0 10px 35px rgba(36,23,46,0.08);
            overflow: hidden;
        }


        /* =========================
           RECEIPT HEADER
           ========================= */

        .receipt-header {
            position: relative;
            padding: 30px 35px;
            background: linear-gradient(135deg, #1B1028, #6D3FA0);
            color: white;
        }

        .university-brand {
            display: flex;
            align-items: center;
            gap: 13px;
        }

        .brand-icon {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 13px;
            background: rgba(255,255,255,0.12);
            font-size: 22px;
        }

        .brand-name {
            font-size: 18px;
            font-weight: 800;
            line-height: 1.3;
        }

        .brand-subtitle {
            display: block;
            margin-top: 3px;
            color: rgba(255,255,255,0.65);
            font-size: 10px;
            font-weight: 400;
        }

        .official-badge {
            position: absolute;
            top: 30px;
            right: 35px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 7px 11px;
            border: 1px solid rgba(255,255,255,0.18);
            border-radius: 20px;
            background: rgba(255,255,255,0.08);
            color: rgba(255,255,255,0.85);
            font-size: 9px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }


        /* =========================
           RECEIPT TITLE
           ========================= */

        .receipt-title {
            padding: 28px 35px 22px;
            text-align: center;
            border-bottom: 1px solid #EEE5F5;
        }

        .receipt-title h1 {
            margin: 0;
            color: #24172E;
            font-size: 22px;
            font-weight: 800;
            letter-spacing: 0.5px;
        }

        .receipt-title p {
            margin: 7px 0 0;
            color: #786B82;
            font-size: 10px;
        }

        .receipt-number {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            margin-top: 14px;
            padding: 7px 12px;
            background: #EEE5F5;
            color: #6D3FA0;
            border-radius: 8px;
            font-size: 10px;
        }

        .receipt-number strong {
            font-weight: 800;
        }


        /* =========================
           CONTENT
           ========================= */

        .receipt-content {
            padding: 28px 35px;
        }


        /* =========================
           SECTION TITLE
           ========================= */

        .section-title {
            display: flex;
            align-items: center;
            gap: 9px;
            margin-bottom: 15px;
            color: #24172E;
            font-size: 13px;
            font-weight: 800;
        }

        .section-title i {
            color: #6D3FA0;
            font-size: 15px;
        }


        /* =========================
           STUDENT INFORMATION
           ========================= */

        .student-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            margin-bottom: 30px;
        }

        .info-box {
            padding: 15px 16px;
            background: #FAF8FC;
            border: 1px solid #EEE5F5;
            border-radius: 10px;
        }

        .info-label {
            display: block;
            margin-bottom: 6px;
            color: #786B82;
            font-size: 9px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-value {
            display: block;
            color: #24172E;
            font-size: 11px;
            font-weight: 700;
            word-break: break-word;
        }


        /* =========================
           PAYMENT DETAILS
           ========================= */

        .payment-section {
            margin-top: 5px;
        }

        .payment-table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #DDD2E5;
            border-radius: 11px;
        }

        .payment-table {
            width: 100%;
            min-width: 600px;
            border-collapse: collapse;
        }

        .payment-table th {
            padding: 13px 15px;
            background: #FAF8FC;
            color: #786B82;
            text-align: left;
            border-bottom: 1px solid #DDD2E5;
            font-size: 9px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .payment-table td {
            padding: 16px 15px;
            color: #4B286B;
            font-size: 10px;
            border-bottom: 1px solid #EEE5F5;
            vertical-align: middle;
        }

        .payment-table tbody tr:last-child td {
            border-bottom: none;
        }

        .amount {
            color: #477A58 !important;
            font-size: 16px !important;
            font-weight: 800 !important;
        }


        /* =========================
           STATUS
           ========================= */

        .status {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 10px;
            border-radius: 20px;
            background: #F1F7F3;
            color: #477A58;
            font-size: 9px;
            font-weight: 700;
        }

        .status::before {
            content: "";
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: currentColor;
        }


        /* =========================
           THANK YOU
           ========================= */

        .receipt-footer {
            margin-top: 28px;
            padding: 20px;
            text-align: center;
            background: #FAF8FC;
            border: 1px solid #EEE5F5;
            border-radius: 11px;
        }

        .receipt-footer i {
            display: block;
            margin-bottom: 8px;
            color: #6D3FA0;
            font-size: 21px;
        }

        .receipt-footer p {
            margin: 3px 0;
            color: #786B82;
            font-size: 10px;
        }

        .receipt-footer strong {
            color: #4B286B;
        }


        /* =========================
           BUTTONS
           ========================= */

        .buttons {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            padding: 22px 35px 28px;
        }

        .back-button,
        .print-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            padding: 10px 17px;
            border-radius: 9px;
            font-family: 'Inter', sans-serif;
            font-size: 10px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .back-button {
            background: #F8F6FA;
            color: #4B286B;
        }

        .back-button:hover {
            background: #EEE5F5;
            color: #24172E;
        }

        .print-button {
            border: none;
            background: #6D3FA0;
            color: white;
            box-shadow: 0 5px 12px rgba(109,63,160,0.15);
        }

        .print-button:hover {
            background: #4B286B;
            transform: translateY(-1px);
        }


        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 650px) {

            .receipt-page {
                padding: 15px 10px;
            }

            .receipt-header {
                padding: 25px 22px;
            }

            .official-badge {
                position: static;
                display: inline-flex;
                margin-top: 18px;
            }

            .receipt-title {
                padding: 24px 20px 20px;
            }

            .receipt-content {
                padding: 22px 20px;
            }

            .student-info {
                grid-template-columns: 1fr;
            }

            .buttons {
                padding: 20px;
                flex-direction: column;
            }

            .back-button,
            .print-button {
                width: 100%;
            }

        }


        /* =========================
           PRINT
           ========================= */

        @media print {

            body {
                background: white;
            }

            .receipt-page {
                padding: 0;
            }

            .receipt-container {
                max-width: none;
                border: none;
                border-radius: 0;
                box-shadow: none;
            }

            .buttons {
                display: none;
            }

            .receipt-header {
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }

            .status {
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }

        }

    </style>

</head>


<body>


<div class="receipt-page">


    <div class="receipt-container">


        <!-- =========================
             UNIVERSITY HEADER
             ========================= -->

        <div class="receipt-header">

            <div class="university-brand">

                <div class="brand-icon">

                    <i class="bi bi-mortarboard-fill"></i>

                </div>

                <div>

                    <div class="brand-name">
                        Student Management System
                    </div>

                    <span class="brand-subtitle">
                        Student Course Enrollment Department
                    </span>

                </div>

            </div>


            <div class="official-badge">

                <i class="bi bi-patch-check-fill"></i>

                OFFICIAL RECEIPT

            </div>

        </div>


        <!-- =========================
             RECEIPT TITLE
             ========================= -->

        <div class="receipt-title">

            <h1>
                PAYMENT RECEIPT
            </h1>

            <p>
                Official Fee Payment Confirmation
            </p>

            <div class="receipt-number">

                <i class="bi bi-receipt"></i>

                Receipt No:

                <strong>
                    ${payment.receiptNumber}
                </strong>

            </div>

        </div>


        <!-- =========================
             CONTENT
             ========================= -->

        <div class="receipt-content">


            <!-- STUDENT INFORMATION -->

            <div class="section-title">

                <i class="bi bi-person-vcard-fill"></i>

                Student Information

            </div>


            <div class="student-info">


                <div class="info-box">

                    <span class="info-label">
                        Student Name
                    </span>

                    <span class="info-value">
                        ${student.name}
                    </span>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Roll Number
                    </span>

                    <span class="info-value">
                        ${student.rollNumber}
                    </span>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Email Address
                    </span>

                    <span class="info-value">
                        ${student.email}
                    </span>

                </div>


                <div class="info-box">

                    <span class="info-label">
                        Department
                    </span>

                    <span class="info-value">
                        ${student.departmentName}
                    </span>

                </div>


            </div>


            <!-- PAYMENT DETAILS -->

            <div class="payment-section">

                <div class="section-title">

                    <i class="bi bi-credit-card-fill"></i>

                    Payment Details

                </div>


                <div class="payment-table-wrapper">

                    <table class="payment-table">

                        <thead>

                            <tr>

                                <th>
                                    Payment Date
                                </th>

                                <th>
                                    Payment Method
                                </th>

                                <th>
                                    Amount
                                </th>

                                <th>
                                    Status
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                            <tr>

                                <td>
                                    ${payment.paymentDate}
                                </td>

                                <td>
                                    Online Payment
                                </td>

                                <td class="amount">
                                    ₹${payment.amount}
                                </td>

                                <td>

                                    <span class="status">

                                        ${payment.paymentStatus}

                                    </span>

                                </td>

                            </tr>

                        </tbody>

                    </table>

                </div>

            </div>


            <!-- FOOTER MESSAGE -->

            <div class="receipt-footer">

                <i class="bi bi-check-circle-fill"></i>

                <p>
                    <strong>Payment successfully recorded.</strong>
                </p>

                <p>
                    This is an electronically generated payment receipt.
                </p>

                <p>
                    Please retain this receipt for your records.
                </p>

            </div>


        </div>


        <!-- =========================
             ACTION BUTTONS
             ========================= -->

        <div class="buttons">

            <a
                href="${pageContext.request.contextPath}/student/fees"
                class="back-button">

                <i class="bi bi-arrow-left"></i>

                Back to Fees

            </a>


            <button
                type="button"
                onclick="window.print()"
                class="print-button">

                <i class="bi bi-printer-fill"></i>

                Print Receipt

            </button>

        </div>


    </div>

</div>


</body>

</html>