
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Faculty Registration | Student Management</title>

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

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html,
        body {
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #F6F3F8;
        }

        /* ================================
           MAIN PAGE
        ================================= */

        .register-page {
            width: 100vw;
            height: 100vh;
            display: flex;
            overflow: hidden;
            background: #F6F3F8;
        }

        /* ================================
           LEFT SIDE
        ================================= */

        .register-left {
            width: 52%;
            height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            padding: 60px;
            color: white;
            overflow: hidden;

            background:
                linear-gradient(
                    135deg,
                    rgba(27, 16, 40, 0.95),
                    rgba(75, 40, 107, 0.88)
                ),
                url("https://images.unsplash.com/photo-1564981797816-1043664bf78d?auto=format&fit=crop&w=1400&q=85");

            background-size: cover;
            background-position: center;
        }

        .register-left::after {
            content: "";
            position: absolute;
            width: 420px;
            height: 420px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
            right: -180px;
            bottom: -180px;
        }

        .brand-content {
            position: relative;
            z-index: 2;
            max-width: 560px;
        }

        /* ================================
           UNIVERSITY LOGO
        ================================= */

        .university-logo {
            width: 58px;
            height: 58px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 16px;
            background: rgba(255, 255, 255, 0.14);
            border: 1px solid rgba(255, 255, 255, 0.18);
            font-size: 28px;
            margin-bottom: 22px;
        }

        .brand-name {
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: rgba(255, 255, 255, 0.75);
            margin-bottom: 12px;
        }

        .brand-content h1 {
            font-size: 42px;
            line-height: 1.15;
            font-weight: 800;
            margin-bottom: 18px;
        }

        .brand-content p {
            font-size: 15px;
            line-height: 1.7;
            color: rgba(255, 255, 255, 0.78);
            max-width: 500px;
            margin-bottom: 28px;
        }

        /* ================================
           FEATURES
        ================================= */

        .feature-list {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
            max-width: 500px;
        }

        .feature {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 11px 14px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.09);
            border: 1px solid rgba(255, 255, 255, 0.10);
            font-size: 12px;
            color: rgba(255, 255, 255, 0.88);
        }

        .feature i {
            font-size: 17px;
            color: #CDB1E8;
        }

        /* ================================
           RIGHT SIDE
        ================================= */

        .register-right {
            width: 48%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
            background: #FFFFFF;
            overflow: hidden;
        }

        .register-box {
            width: 100%;
            max-width: 460px;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {

            from {
                opacity: 0;
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }

        }

        /* ================================
           HEADER
        ================================= */

        .register-badge {
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 14px;
            background: #EEE5F5;
            color: #6D3FA0;
            font-size: 23px;
            margin-bottom: 18px;
        }

        .register-box h2 {
            font-size: 28px;
            font-weight: 800;
            color: #24172E;
            margin-bottom: 7px;
        }

        .register-subtitle {
            color: #786B82;
            font-size: 13px;
            margin-bottom: 25px;
        }

        /* ================================
           ERROR MESSAGE
        ================================= */

        .error-message {
            display: flex;
            align-items: center;
            gap: 9px;
            background: #F8EDEF;
            border: 1px solid #E8C8D0;
            color: #9B3D52;
            padding: 11px 13px;
            border-radius: 9px;
            font-size: 12px;
            margin-bottom: 18px;
        }

        /* ================================
           FORM
        ================================= */

        .form-group {
            margin-bottom: 17px;
        }

        .form-label {
            display: block;
            color: #3E3447;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper > i:first-child {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #786B82;
            font-size: 16px;
            pointer-events: none;
            z-index: 2;
        }

        .form-input {
            width: 100%;
            height: 46px;
            border: 1px solid #DDD2E5;
            border-radius: 9px;
            padding: 0 14px 0 43px;
            color: #24172E;
            background: #FFFFFF;
            font-size: 13px;
            outline: none;
            transition: all 0.2s ease;
        }

        .form-input::placeholder {
            color: #786B82;
        }

        .form-input:focus {
            border-color: #6D3FA0;
            box-shadow: 0 0 0 3px rgba(109, 63, 160, 0.10);
        }

        /* Department select */

        select.form-input {
            appearance: auto;
            cursor: pointer;
        }

        /* ================================
           PASSWORD
        ================================= */

        .password-input {
            padding-right: 45px;
        }

        .password-toggle {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: none;
            background: transparent;
            color: #786B82;
            cursor: pointer;
            border-radius: 6px;
            font-size: 15px;
            z-index: 3;
        }

        .password-toggle:hover {
            background: #EEE5F5;
            color: #6D3FA0;
        }

        .password-hint {
            margin-top: 6px;
            font-size: 10px;
            color: #786B82;
        }

        /* ================================
           REGISTER BUTTON
        ================================= */

        .register-button {
            width: 100%;
            height: 47px;
            border: none;
            border-radius: 9px;
            background: #6D3FA0;
            color: white;
            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 5px;
            transition: all 0.2s ease;
        }

        .register-button:hover {
            background: #4B286B;
            transform: translateY(-1px);
            box-shadow: 0 8px 18px rgba(109, 63, 160, 0.20);
        }

        .register-button:active {
            transform: translateY(0);
        }

        /* ================================
           LOGIN LINK
        ================================= */

        .login-link {
            text-align: center;
            margin-top: 22px;
            color: #786B82;
            font-size: 12px;
        }

        .login-link a {
            color: #6D3FA0;
            font-weight: 700;
            text-decoration: none;
            margin-left: 4px;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* ================================
           SECURITY NOTE
        ================================= */

        .security-note {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;
            margin-top: 20px;
            padding-top: 16px;
            border-top: 1px solid #DDD2E5;
            color: #786B82;
            font-size: 10px;
        }

        .security-note i {
            color: #6D3FA0;
            font-size: 13px;
        }

        /* ================================
           TABLET
        ================================= */

        @media (max-width: 1000px) {

            .register-left {
                width: 48%;
                padding: 40px;
            }

            .register-right {
                width: 52%;
                padding: 30px;
            }

            .brand-content h1 {
                font-size: 34px;
            }

        }

        /* ================================
           MOBILE
        ================================= */

        @media (max-width: 768px) {

            .register-page {
                height: 100vh;
                flex-direction: column;
                overflow: hidden;
            }

            .register-left {
                width: 100%;
                height: 34vh;
                min-height: 0;
                flex-shrink: 0;
                padding: 25px;
                align-items: center;
            }

            .register-right {
                width: 100%;
                height: 66vh;
                min-height: 0;
                flex-shrink: 0;
                padding: 25px;
                overflow: hidden;
            }

            .brand-content h1 {
                font-size: 26px;
                margin-bottom: 8px;
            }

            .brand-content p {
                font-size: 11px;
                line-height: 1.5;
                margin-bottom: 0;
            }

            .brand-name {
                font-size: 10px;
                margin-bottom: 7px;
            }

            .university-logo {
                width: 45px;
                height: 45px;
                font-size: 21px;
                margin-bottom: 12px;
            }

            .feature-list {
                display: none;
            }

            .register-box {
                max-width: 480px;
            }

            .register-box h2 {
                font-size: 24px;
            }

        }

        /* ================================
           SMALL MOBILE
        ================================= */

        @media (max-width: 450px) {

            .register-left {
                height: 29vh;
                padding: 18px;
            }

            .register-right {
                height: 71vh;
                padding: 18px;
                overflow: hidden;
            }

            .brand-content h1 {
                font-size: 22px;
            }

            .brand-content p {
                display: none;
            }

            .university-logo {
                width: 40px;
                height: 40px;
                font-size: 18px;
                margin-bottom: 9px;
            }

            .register-box h2 {
                font-size: 21px;
            }

            .register-subtitle {
                font-size: 11px;
                margin-bottom: 17px;
            }

            .form-group {
                margin-bottom: 10px;
            }

            .form-label {
                margin-bottom: 5px;
            }

            .form-input {
                height: 42px;
            }

            .password-hint {
                display: none;
            }

            .register-button {
                height: 43px;
            }

            .security-note {
                display: none;
            }

            .login-link {
                margin-top: 13px;
            }

        }

    </style>

</head>


<body>

<div class="register-page">


    <!-- LEFT SIDE -->

    <section class="register-left">

        <div class="brand-content">

            <div class="university-logo">

                <i class="bi bi-mortarboard-fill"></i>

            </div>

            <div class="brand-name">

                Student Management System

            </div>

            <h1>

                Join Our<br>

                Faculty Community.

            </h1>

            <p>

                Create your faculty account and access

                the academic management portal to manage

                courses, students and academic activities.

            </p>

            <div class="feature-list">

                <div class="feature">

                    <i class="bi bi-journal-bookmark-fill"></i>

                    Course Management

                </div>

                <div class="feature">

                    <i class="bi bi-people-fill"></i>

                    Student Roster

                </div>

                <div class="feature">

                    <i class="bi bi-bar-chart-fill"></i>

                    Academic Overview

                </div>

                <div class="feature">

                    <i class="bi bi-shield-check"></i>

                    Secure Faculty Portal

                </div>

            </div>

        </div>

    </section>


    <!-- RIGHT SIDE -->

    <section class="register-right">

        <div class="register-box">

            <div class="register-badge">

                <i class="bi bi-person-plus-fill"></i>

            </div>

            <h2>

                Faculty Registration

            </h2>

            <p class="register-subtitle">

                Create your faculty account to get started.

            </p>


            <!-- Error -->

            <% if (request.getAttribute("error") != null) { %>

                <div class="error-message">

                    <i class="bi bi-exclamation-circle-fill"></i>

                    <span>

                        <%= request.getAttribute("error") %>

                    </span>

                </div>

            <% } %>


            <!-- Registration Form -->

            <form
                action="${pageContext.request.contextPath}/faculty/register"
                method="post">


                <!-- Faculty Name -->

                <div class="form-group">

                    <label class="form-label">

                        Faculty Name

                    </label>

                    <div class="input-wrapper">

                        <i class="bi bi-person-fill"></i>

                        <input
                            type="text"
                            name="name"
                            class="form-input"
                            placeholder="Enter your full name"
                            autocomplete="name"
                            required>

                    </div>

                </div>


                <!-- Email -->

                <div class="form-group">

                    <label class="form-label">

                        Email Address

                    </label>

                    <div class="input-wrapper">

                        <i class="bi bi-envelope-fill"></i>

                        <input
                            type="email"
                            name="email"
                            class="form-input"
                            placeholder="Enter your email address"
                            autocomplete="email"
                            required>

                    </div>

                </div>


                <!-- Department -->

                <div class="form-group">

                    <label class="form-label">

                        Department Name

                    </label>

                    <div class="input-wrapper">

                        <i class="bi bi-building-fill"></i>

                        <select
                            name="deptId"
                            class="form-input"
                            required>

                            <option value="">
                                Select Department
                            </option>

                            <c:forEach
                                var="department"
                                items="${departments}">

                                <option value="${department.id}">
                                    ${department.deptName}
                                </option>

                            </c:forEach>

                        </select>

                    </div>

                </div>


                <!-- Password -->

                <div class="form-group">

                    <label class="form-label">

                        Password

                    </label>

                    <div class="input-wrapper">

                        <i class="bi bi-lock-fill"></i>

                        <input
                            type="password"
                            name="password"
                            id="password"
                            class="form-input password-input"
                            placeholder="Create a password"
                            autocomplete="new-password"
                            minlength="6"
                            required>

                        <button
                            type="button"
                            class="password-toggle"
                            id="togglePassword"
                            aria-label="Show password">

                            <i class="bi bi-eye-fill"></i>

                        </button>

                    </div>

                    <div class="password-hint">

                        Password must contain at least 6 characters.

                    </div>

                </div>


                <!-- Register Button -->

                <button
                    type="submit"
                    class="register-button">

                    <i class="bi bi-person-plus-fill"></i>

                    Register Faculty

                </button>

            </form>


            <!-- Login -->

            <div class="login-link">

                Already registered?

                <a
                    href="${pageContext.request.contextPath}/faculty/login">

                    Login here

                </a>

            </div>


            <!-- Security -->

            <div class="security-note">

                <i class="bi bi-shield-check"></i>

                Your faculty information is securely handled.

            </div>

        </div>

    </section>

</div>


<!-- Bootstrap JS -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


<!-- Password Show / Hide -->

<script>

    const passwordInput =
        document.getElementById("password");

    const togglePassword =
        document.getElementById("togglePassword");


    togglePassword.addEventListener(
        "click",
        function () {

            if (passwordInput.type === "password") {

                passwordInput.type = "text";

                this.querySelector("i")
                    .classList.remove("bi-eye-fill");

                this.querySelector("i")
                    .classList.add("bi-eye-slash-fill");

                this.setAttribute(
                    "aria-label",
                    "Hide password"
                );

            } else {

                passwordInput.type = "password";

                this.querySelector("i")
                    .classList.remove("bi-eye-slash-fill");

                this.querySelector("i")
                    .classList.add("bi-eye-fill");

                this.setAttribute(
                    "aria-label",
                    "Show password"
                );

            }

        }
    );

</script>

</body>

</html>

