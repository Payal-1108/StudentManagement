
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Login | Student Management System</title>

    <!-- Bootstrap -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
        rel="stylesheet">

    <!-- Google Font -->
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

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
        }


        /* =========================
           MAIN PAGE
        ========================== */

        .login-page {

            min-height: 100vh;

            display: flex;

            overflow: hidden;
        }


        /* =========================
           LEFT SIDE
        ========================== */

        .login-left {

            width: 52%;

            min-height: 100vh;

            position: relative;

            display: flex;

            align-items: center;

            padding: 70px;

            color: white;

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


        .login-left::after {

            content: "";

            position: absolute;

            width: 300px;

            height: 300px;

            border-radius: 50%;

            background: rgba(255, 255, 255, 0.07);

            right: -100px;

            bottom: -100px;
        }


        .brand-content {

            max-width: 560px;

            position: relative;

            z-index: 2;
        }


        .university-logo {

            width: 58px;

            height: 58px;

            border-radius: 16px;

            background: rgba(255, 255, 255, 0.15);

            border: 1px solid rgba(255, 255, 255, 0.25);

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 28px;

            margin-bottom: 24px;

            backdrop-filter: blur(8px);
        }


        .brand-name {

            font-size: 16px;

            font-weight: 700;

            letter-spacing: 1px;

            text-transform: uppercase;

            margin-bottom: 35px;
        }


        .brand-content h1 {

            font-size: clamp(38px, 4vw, 62px);

            line-height: 1.08;

            font-weight: 800;

            margin-bottom: 22px;
        }


        .brand-content p {

            font-size: 17px;

            line-height: 1.8;

            color: rgba(255, 255, 255, 0.82);

            max-width: 500px;
        }


        /* =========================
           FEATURES
        ========================== */

        .feature-list {

            display: flex;

            flex-wrap: wrap;

            gap: 12px;

            margin-top: 35px;
        }


        .feature {

            padding: 10px 16px;

            border-radius: 30px;

            background: rgba(255, 255, 255, 0.10);

            border: 1px solid rgba(255, 255, 255, 0.18);

            font-size: 13px;

            font-weight: 500;

            backdrop-filter: blur(8px);
        }


        /* =========================
           RIGHT SIDE
        ========================== */

        .login-right {

            width: 48%;

            min-height: 100vh;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 40px;

            background: #FFFFFF;
        }


        .login-box {

            width: 100%;

            max-width: 450px;

            animation: slideUp 0.7s ease;
        }


        @keyframes slideUp {

            from {

                opacity: 0;

                transform: translateY(25px);
            }

            to {

                opacity: 1;

                transform: translateY(0);
            }
        }


        /* =========================
           LOGIN HEADER
        ========================== */

        .login-badge {

            display: inline-flex;

            align-items: center;

            gap: 8px;

            padding: 8px 13px;

            border-radius: 30px;

            background: #EEE5F5;

            color: #6D3FA0;

            font-size: 12px;

            font-weight: 700;

            margin-bottom: 20px;
        }


        .login-box h2 {

            font-size: 34px;

            font-weight: 800;

            color: #24172E;

            margin-bottom: 10px;
        }


        .login-subtitle {

            color: #786B82;

            font-size: 14px;

            margin-bottom: 30px;
        }


        /* =========================
           ERROR MESSAGE
        ========================== */

        .login-error {

            padding: 12px 15px;

            border-radius: 10px;

            background: #F8EDEF;

            border: 1px solid #E8C8D0;

            color: #9B3D52;

            font-size: 13px;

            margin-bottom: 20px;
        }


        /* =========================
           FORM
        ========================== */

        .form-group {

            margin-bottom: 20px;
        }


        .form-label {

            display: block;

            font-size: 13px;

            font-weight: 600;

            color: #3E3447;

            margin-bottom: 8px;
        }


        .input-wrapper {

            position: relative;
        }


        .input-icon {

            position: absolute;

            left: 15px;

            top: 50%;

            transform: translateY(-50%);

            color: #786B82;

            font-size: 18px;

            pointer-events: none;
        }


        .login-input {

            width: 100%;

            height: 52px;

            border: 1px solid #DDD2E5;

            border-radius: 12px;

            padding: 0 45px;

            font-size: 14px;

            outline: none;

            transition: all 0.25s ease;

            background: #F8F6FA;

            color: #24172E;
        }


        .login-input::placeholder {

            color: #786B82;
        }


        .login-input:focus {

            background: white;

            border-color: #6D3FA0;

            box-shadow:
                0 0 0 4px rgba(109, 63, 160, 0.10);
        }


        /* =========================
           PASSWORD TOGGLE
        ========================== */

        .password-toggle {

            position: absolute;

            right: 14px;

            top: 50%;

            transform: translateY(-50%);

            border: none;

            background: transparent;

            color: #786B82;

            font-size: 18px;

            cursor: pointer;

            padding: 4px;
        }


        .password-toggle:hover {

            color: #6D3FA0;
        }


        /* =========================
           REMEMBER ME
        ========================== */

        .login-options {

            display: flex;

            align-items: center;

            margin-bottom: 25px;

            font-size: 13px;
        }


        .remember {

            display: flex;

            align-items: center;

            gap: 8px;

            color: #786B82;

            cursor: pointer;
        }


        .remember input {

            width: 15px;

            height: 15px;

            accent-color: #6D3FA0;

            cursor: pointer;
        }


        /* =========================
           LOGIN BUTTON
        ========================== */

        .login-button {

            width: 100%;

            height: 54px;

            border: none;

            border-radius: 12px;

            background:
                linear-gradient(
                    135deg,
                    #6D3FA0,
                    #4B286B
                );

            color: white;

            font-size: 14px;

            font-weight: 700;

            cursor: pointer;

            box-shadow:
                0 10px 25px rgba(109, 63, 160, 0.20);

            transition: all 0.25s ease;
        }


        .login-button:hover {

            transform: translateY(-2px);

            box-shadow:
                0 14px 30px rgba(109, 63, 160, 0.28);
        }


        .login-button:active {

            transform: translateY(0);
        }


        .login-button:disabled {

            opacity: 0.75;

            cursor: not-allowed;

            transform: none;
        }


        /* =========================
           SECURITY NOTE
        ========================== */

        .security-note {

            display: flex;

            align-items: flex-start;

            gap: 10px;

            margin-top: 25px;

            padding: 14px;

            border-radius: 12px;

            background: #FAF8FC;

            border: 1px solid #DDD2E5;

            color: #786B82;

            font-size: 12px;

            line-height: 1.6;
        }


        .security-note i {

            color: #6D3FA0;

            font-size: 17px;
        }


        /* =========================
           FOOTER
        ========================== */

        .login-footer {

            text-align: center;

            margin-top: 28px;

            color: #786B82;

            font-size: 12px;

            line-height: 1.7;
        }


        /* =========================
           TABLET
        ========================== */

        @media (max-width: 1000px) {

            .login-left {

                width: 45%;

                padding: 45px;
            }


            .login-right {

                width: 55%;

                padding: 30px;
            }


            .brand-content h1 {

                font-size: 40px;
            }
        }


        /* =========================
           MOBILE
        ========================== */

        @media (max-width: 768px) {

            .login-page {

                flex-direction: column;

                overflow: visible;
            }


            .login-left {

                width: 100%;

                min-height: 330px;

                padding: 40px 25px;

                background-position: center;
            }


            .login-left::after {

                display: none;
            }


            .brand-name {

                margin-bottom: 20px;
            }


            .brand-content h1 {

                font-size: 34px;
            }


            .brand-content p {

                font-size: 14px;

                line-height: 1.6;
            }


            .feature-list {

                display: none;
            }


            .login-right {

                width: 100%;

                min-height: auto;

                padding: 40px 25px;
            }


            .login-box {

                max-width: 500px;
            }
        }


        @media (max-width: 450px) {

            .login-left {

                min-height: 290px;

                padding: 30px 20px;
            }


            .university-logo {

                width: 48px;

                height: 48px;

                font-size: 23px;

                margin-bottom: 16px;
            }


            .brand-content h1 {

                font-size: 29px;
            }


            .login-right {

                padding: 35px 20px;
            }


            .login-box h2 {

                font-size: 28px;
            }
        }

    </style>

</head>


<body>


<div class="login-page">


    <!-- =========================
         LEFT SIDE
    ========================== -->

    <section class="login-left">


        <div class="brand-content">


            <div class="university-logo">

                <i class="bi bi-mortarboard-fill"></i>

            </div>


            <div class="brand-name">

                Student Management System

            </div>


            <h1>

                Your Campus.<br>

                Your Future.

            </h1>


            <p>

                A centralized academic management platform for
                students, faculty and administrators. Manage
                courses, enrollments, fees and academic records
                from one secure portal.

            </p>


            <div class="feature-list">


                <span class="feature">

                    <i class="bi bi-people me-1"></i>

                    Student Management

                </span>


                <span class="feature">

                    <i class="bi bi-book me-1"></i>

                    Course Management

                </span>


                <span class="feature">

                    <i class="bi bi-person-badge me-1"></i>

                    Faculty Management

                </span>


                <span class="feature">

                    <i class="bi bi-credit-card me-1"></i>

                    Fee Management

                </span>


            </div>


        </div>


    </section>


    <!-- =========================
         RIGHT SIDE
    ========================== -->

    <section class="login-right">


        <div class="login-box">


            <!-- LOGIN BADGE -->

            <div class="login-badge">

                <i class="bi bi-shield-lock-fill"></i>

                Administration Portal

            </div>


            <h2>

                Welcome back

            </h2>


            <p class="login-subtitle">

                Sign in to access the university administration portal.

            </p>


            <!-- ERROR MESSAGE -->

            <c:if test="${not empty error}">

                <div class="login-error">

                    <i class="bi bi-exclamation-circle me-2"></i>

                    ${error}

                </div>

            </c:if>


            <!-- LOGIN FORM -->

            <form

                action="${pageContext.request.contextPath}/admin/login"

                method="post"

                onsubmit="handleLogin(this)">


                <!-- USERNAME -->

                <div class="form-group">


                    <label class="form-label">

                        Username

                    </label>


                    <div class="input-wrapper">


                        <i class="bi bi-person input-icon"></i>


                        <input

                            type="text"

                            name="username"

                            class="login-input"

                            placeholder="Enter your username"

                            autocomplete="username"

                            required>


                    </div>


                </div>


                <!-- PASSWORD -->

                <div class="form-group">


                    <label class="form-label">

                        Password

                    </label>


                    <div class="input-wrapper">


                        <i class="bi bi-lock input-icon"></i>


                        <input

                            type="password"

                            id="password"

                            name="password"

                            class="login-input"

                            placeholder="Enter your password"

                            autocomplete="current-password"

                            required>


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

                            name="remember">


                        Remember me


                    </label>


                </div>


                <!-- LOGIN BUTTON -->

                <button

                    type="submit"

                    class="login-button"

                    id="loginButton">


                    <span id="buttonText">


                        <i class="bi bi-box-arrow-in-right me-2"></i>

                        Sign In to Admin Portal


                    </span>


                </button>


            </form>


            <!-- SECURITY NOTE -->

            <div class="security-note">


                <i class="bi bi-shield-check"></i>


                <div>

                    Your login information is protected.
                    This portal is restricted to authorized
                    university administrators.

                </div>


            </div>


            <!-- FOOTER -->

            <div class="login-footer">

                © 2026 Student Management System

                <br>

                University Academic Administration Portal

            </div>


        </div>


    </section>


</div>


<!-- =========================
     JAVASCRIPT
========================== -->

<script>


    /* =========================
       SHOW / HIDE PASSWORD
    ========================== */

    function togglePassword() {


        const password =
            document.getElementById("password");


        const icon =
            document.getElementById("passwordIcon");


        if (password.type === "password") {


            password.type = "text";


            icon.classList.remove("bi-eye");

            icon.classList.add("bi-eye-slash");


            document
                .querySelector(".password-toggle")
                .setAttribute("aria-label", "Hide password");


        } else {


            password.type = "password";


            icon.classList.remove("bi-eye-slash");

            icon.classList.add("bi-eye");


            document
                .querySelector(".password-toggle")
                .setAttribute("aria-label", "Show password");

        }

    }


    /* =========================
       LOGIN BUTTON ANIMATION
    ========================== */

    function handleLogin(form) {


        const button =
            document.getElementById("loginButton");


        const buttonText =
            document.getElementById("buttonText");


        if (form.checkValidity()) {


            button.disabled = true;


            buttonText.innerHTML =

                '<span class="spinner-border spinner-border-sm me-2"></span>' +

                'Signing in...';

        }

    }

</script>


</body>

</html>
