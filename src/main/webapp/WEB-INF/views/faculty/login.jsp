
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Faculty Login | Student Management</title>

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
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            overflow: hidden;
        }


        /* ================================
           MAIN BACKGROUND
        ================================= */

        .login-page {

            min-height: 100vh;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 25px;

            position: relative;

            background-image:

                linear-gradient(
                    90deg,
                    rgba(27, 16, 40, 0.94),
                    rgba(59, 31, 82, 0.74),
                    rgba(36, 23, 46, 0.48)
                ),

                url('${pageContext.request.contextPath}/images/campus-login.jpg');

            background-size: cover;

            background-position: center;

            background-repeat: no-repeat;
        }


        /* ================================
           LOGIN CONTAINER
        ================================= */

        .login-container {

            width: 100%;

            max-width: 1100px;

            min-height: 650px;

            display: grid;

            grid-template-columns: 1fr 430px;

            background: rgba(255, 255, 255, 0.08);

            border: 1px solid rgba(255, 255, 255, 0.18);

            border-radius: 24px;

            overflow: hidden;

            box-shadow:
                0 30px 80px rgba(36, 23, 46, 0.35);

            backdrop-filter: blur(10px);
        }


        /* ================================
           LEFT SIDE
        ================================= */

        .left-section {

            padding: 55px;

            display: flex;

            flex-direction: column;

            justify-content: space-between;

            color: white;

            background:

                linear-gradient(
                    135deg,
                    rgba(27, 16, 40, 0.82),
                    rgba(109, 63, 160, 0.25)
                );
        }


        .university-brand {

            display: flex;

            align-items: center;

            gap: 14px;
        }


        .brand-icon {

            width: 52px;

            height: 52px;

            border-radius: 14px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: rgba(255, 255, 255, 0.14);

            border: 1px solid rgba(255, 255, 255, 0.20);

            font-size: 25px;
        }


        .brand-name {

            font-size: 16px;

            font-weight: 700;

            line-height: 1.2;
        }


        .brand-subtitle {

            display: block;

            font-size: 11px;

            color: rgba(255, 255, 255, 0.65);

            margin-top: 4px;
        }


        /* ================================
           HERO CONTENT
        ================================= */

        .hero-content {

            max-width: 570px;
        }


        .hero-content h1 {

            font-size: 48px;

            line-height: 1.1;

            font-weight: 800;

            margin-bottom: 20px;

            letter-spacing: -1px;
        }


        .hero-content h1 span {

            color: #D6C1E8;
        }


        .hero-content p {

            font-size: 15px;

            line-height: 1.8;

            color: rgba(255, 255, 255, 0.78);

            max-width: 520px;

            margin-bottom: 28px;
        }


        /* ================================
           FEATURE PILLS
        ================================= */

        .features {

            display: flex;

            flex-wrap: wrap;

            gap: 10px;
        }


        .feature {

            display: flex;

            align-items: center;

            gap: 8px;

            padding: 9px 13px;

            border-radius: 30px;

            background: rgba(255, 255, 255, 0.10);

            border: 1px solid rgba(255, 255, 255, 0.14);

            font-size: 11px;

            color: rgba(255, 255, 255, 0.85);
        }


        .feature i {

            color: #D6C1E8;

            font-size: 13px;
        }


        .copyright {

            font-size: 10px;

            color: rgba(255, 255, 255, 0.45);
        }


        /* ================================
           RIGHT LOGIN SECTION
        ================================= */

        .login-section {

            background: rgba(255, 255, 255, 0.97);

            padding: 55px 45px;

            display: flex;

            flex-direction: column;

            justify-content: center;
        }


        .portal-icon {

            width: 58px;

            height: 58px;

            border-radius: 16px;

            background: #EEE5F5;

            color: #6D3FA0;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 26px;

            margin-bottom: 20px;
        }


        .login-section h2 {

            font-size: 27px;

            font-weight: 800;

            color: #24172E;

            margin-bottom: 7px;
        }


        .login-description {

            font-size: 12px;

            color: #786B82;

            margin-bottom: 28px;
        }


        /* ================================
           ERROR MESSAGE
        ================================= */

        .error-message {

            padding: 11px 13px;

            border-radius: 10px;

            background: #F8EDEF;

            border: 1px solid #E8C8D0;

            color: #9B3D52;

            font-size: 12px;

            margin-bottom: 18px;

            display: flex;

            align-items: center;

            gap: 8px;
        }


        /* ================================
           FORM
        ================================= */

        .form-group {

            margin-bottom: 18px;
        }


        .form-label {

            display: block;

            font-size: 11px;

            font-weight: 700;

            color: #3E3447;

            margin-bottom: 7px;
        }


        .input-wrapper {

            position: relative;
        }


        .input-wrapper > i {

            position: absolute;

            left: 14px;

            top: 50%;

            transform: translateY(-50%);

            color: #786B82;

            font-size: 16px;

            z-index: 2;
        }


        .form-control-modern {

            width: 100%;

            height: 48px;

            border: 1px solid #DDD2E5;

            border-radius: 11px;

            padding: 0 42px;

            font-size: 13px;

            color: #24172E;

            outline: none;

            transition: all 0.2s ease;

            background: #FFFFFF;
        }


        .form-control-modern::placeholder {

            color: #786B82;
        }


        .form-control-modern:focus {

            border-color: #6D3FA0;

            box-shadow:
                0 0 0 3px rgba(109, 63, 160, 0.10);
        }


        /* ================================
           PASSWORD TOGGLE
        ================================= */

        .password-toggle {

            position: absolute;

            right: 14px;

            top: 50%;

            transform: translateY(-50%);

            border: none;

            background: transparent;

            color: #786B82;

            cursor: pointer;

            font-size: 16px;

            padding: 4px;
        }


        .password-toggle:hover {

            color: #6D3FA0;
        }


        /* ================================
           OPTIONS
        ================================= */

        .login-options {

            display: flex;

            align-items: center;

            margin-bottom: 22px;

            font-size: 11px;
        }


        .remember {

            display: flex;

            align-items: center;

            gap: 7px;

            color: #786B82;

            cursor: pointer;
        }


        .remember input {

            width: 14px;

            height: 14px;

            accent-color: #6D3FA0;

            cursor: pointer;
        }


        /* ================================
           LOGIN BUTTON
        ================================= */

        .login-btn {

            width: 100%;

            height: 49px;

            border: none;

            border-radius: 11px;

            background:

                linear-gradient(
                    135deg,
                    #6D3FA0,
                    #4B286B
                );

            color: white;

            font-size: 13px;

            font-weight: 700;

            cursor: pointer;

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 8px;

            box-shadow:
                0 8px 20px rgba(109, 63, 160, 0.25);

            transition: all 0.2s ease;
        }


        .login-btn:hover {

            transform: translateY(-1px);

            box-shadow:
                0 12px 25px rgba(109, 63, 160, 0.30);
        }


        .login-btn:active {

            transform: translateY(0);
        }


        .login-btn:disabled {

            opacity: 0.75;

            cursor: not-allowed;
        }


        /* ================================
           REGISTER
        ================================= */

        .register-text {

            text-align: center;

            font-size: 11px;

            color: #786B82;

            margin-top: 23px;
        }


        .register-text a {

            color: #6D3FA0;

            font-weight: 700;

            text-decoration: none;
        }


        .register-text a:hover {

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

            margin-top: 28px;

            padding-top: 18px;

            border-top: 1px solid #EEE5F5;

            color: #786B82;

            font-size: 10px;
        }


        .security-note i {

            color: #477A58;
        }


        /* ================================
           RESPONSIVE
        ================================= */

        @media (max-width: 900px) {

            body {

                overflow: auto;
            }


            .login-page {

                padding: 20px;

                background-position: center;
            }


            .login-container {

                max-width: 520px;

                min-height: auto;

                display: block;
            }


            .left-section {

                padding: 35px;

                min-height: 300px;
            }


            .hero-content h1 {

                font-size: 34px;
            }


            .hero-content p {

                font-size: 13px;
            }


            .copyright {

                display: none;
            }


            .login-section {

                padding: 40px 35px;
            }

        }


        @media (max-width: 550px) {

            .login-page {

                padding: 0;

                align-items: stretch;
            }


            .login-container {

                min-height: 100vh;

                border-radius: 0;

                border: none;
            }


            .left-section {

                padding: 28px 24px;

                min-height: 250px;
            }


            .hero-content h1 {

                font-size: 29px;
            }


            .hero-content p {

                font-size: 12px;

                line-height: 1.6;

                margin-bottom: 18px;
            }


            .feature {

                font-size: 10px;

                padding: 7px 10px;
            }


            .login-section {

                padding: 35px 24px;
            }


            .login-section h2 {

                font-size: 24px;
            }

        }

    </style>

</head>


<body>

<div class="login-page">

    <div class="login-container">


        <!-- ================================
             LEFT SIDE
        ================================= -->

        <section class="left-section">


            <div>

                <div class="university-brand">


                    <div class="brand-icon">

                        <i class="bi bi-mortarboard-fill"></i>

                    </div>


                    <div class="brand-name">

                        Student Management

                        <span class="brand-subtitle">

                            UNIVERSITY MANAGEMENT PORTAL

                        </span>

                    </div>


                </div>

            </div>


            <div class="hero-content">


                <h1>

                    Empowering

                    <span>Educators.</span>

                    <br>

                    Inspiring Students.

                </h1>


                <p>

                    Manage your courses, access student information,

                    track academic activities and stay connected with

                    your university community through the Faculty Portal.

                </p>


                <div class="features">


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


                </div>

            </div>


            <div class="copyright">

                © 2026 Student Management System.

                All rights reserved.

            </div>


        </section>


        <!-- ================================
             RIGHT SIDE LOGIN
        ================================= -->

        <section class="login-section">


            <div class="portal-icon">

                <i class="bi bi-person-workspace"></i>

            </div>


            <h2>

                Faculty Portal

            </h2>


            <p class="login-description">

                Sign in to access your faculty dashboard.

            </p>


            <!-- ERROR MESSAGE -->

            <c:if test="${not empty error}">

                <div class="error-message">

                    <i class="bi bi-exclamation-circle-fill"></i>

                    <span>

                        ${error}

                    </span>

                </div>

            </c:if>


            <!-- LOGIN FORM -->

            <form

                action="${pageContext.request.contextPath}/faculty/login"

                method="post"

                id="loginForm">


                <!-- EMAIL -->

                <div class="form-group">


                    <label class="form-label">

                        Faculty Email

                    </label>


                    <div class="input-wrapper">


                        <i class="bi bi-envelope-fill"></i>


                        <input

                            type="email"

                            name="email"

                            class="form-control-modern"

                            placeholder="Enter your faculty email"

                            required

                            autocomplete="email">


                    </div>

                </div>


                <!-- PASSWORD -->

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

                            class="form-control-modern"

                            placeholder="Enter your faculty password"

                            required

                            autocomplete="current-password">


                        <button

                            type="button"

                            class="password-toggle"

                            onclick="togglePassword()"

                            aria-label="Show password">


                            <i

                                class="bi bi-eye"

                                id="passwordIcon">

                            </i>


                        </button>


                    </div>

                </div>


                <!-- REMEMBER ME ONLY -->

                <div class="login-options">


                    <label class="remember">


                        <input

                            type="checkbox"

                            name="rememberMe">


                        Remember me


                    </label>


                </div>


                <!-- LOGIN BUTTON -->

                <button

                    type="submit"

                    class="login-btn"

                    id="loginButton">


                    <i class="bi bi-box-arrow-in-right"></i>


                    <span id="buttonText">

                        Sign In to Faculty Portal

                    </span>


                </button>


            </form>


            <!-- REGISTER -->

            <div class="register-text">


                Don't have a faculty account?


                <a

                    href="${pageContext.request.contextPath}/faculty/register">

                    Register here

                </a>


            </div>


            <!-- SECURITY -->

            <div class="security-note">


                <i class="bi bi-shield-lock-fill"></i>


                Secure faculty portal · Protected access


            </div>


        </section>


    </div>

</div>


<!-- ================================
     JAVASCRIPT
================================= -->

<script>


    /* ================================
       SHOW / HIDE PASSWORD
    ================================= */

    function togglePassword() {


        const password =

            document.getElementById("password");


        const icon =

            document.getElementById("passwordIcon");


        if (password.type === "password") {


            password.type = "text";


            icon.classList.remove("bi-eye");

            icon.classList.add("bi-eye-slash");


        } else {


            password.type = "password";


            icon.classList.remove("bi-eye-slash");

            icon.classList.add("bi-eye");

        }

    }


    /* ================================
       LOGIN LOADING
    ================================= */

    document

        .getElementById("loginForm")

        .addEventListener("submit", function () {


            const button =

                document.getElementById("loginButton");


            const text =

                document.getElementById("buttonText");


            button.disabled = true;


            text.textContent = "Signing in...";


            button.insertAdjacentHTML(

                "afterbegin",

                '<span class="spinner-border spinner-border-sm"></span>'

            );

        });


</script>


</body>

</html>

