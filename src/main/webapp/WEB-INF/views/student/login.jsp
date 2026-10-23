
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>Student Login | College Academic Portal</title>

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

<style>

    * {
        box-sizing: border-box;
    }

    html,
    body {
        margin: 0;
        width: 100%;
        min-height: 100%;
    }

    body {
        font-family: 'Inter', sans-serif;
        background: #E8E0F0;
        color: #241B2D;
    }

    /* =========================
       MAIN PAGE
    ========================= */

    .login-page {
        min-height: 100vh;

        display: flex;
        align-items: center;
        justify-content: center;

        padding: 25px;

        background:
            radial-gradient(
                circle at 10% 10%,
                rgba(99, 55, 143, 0.08),
                transparent 30%
            ),
            #E8E0F0;
    }

    .login-wrapper {
        width: 100%;
        max-width: 1050px;
        min-height: 600px;

        display: grid;
        grid-template-columns: 42% 58%;

        background: #ffffff;

        border-radius: 20px;
        overflow: hidden;

        box-shadow:
            0 20px 60px rgba(36, 18, 53, 0.12);
    }

    /* =========================
       LEFT SIDE
    ========================= */

    .brand-section {
        position: relative;

        padding: 45px;

        display: flex;
        flex-direction: column;
        justify-content: space-between;

        color: #ffffff;
        overflow: hidden;

        background:
            linear-gradient(
                145deg,
                #241235,
                #5B3480
            );
    }

    .brand-section::before {
        content: "";

        position: absolute;

        width: 350px;
        height: 350px;

        border-radius: 50%;

        right: -170px;
        top: -130px;

        background:
            rgba(255, 255, 255, 0.05);
    }

    .brand-section::after {
        content: "";

        position: absolute;

        width: 260px;
        height: 260px;

        border-radius: 50%;

        left: -150px;
        bottom: -120px;

        background:
            rgba(255, 255, 255, 0.04);
    }

    .brand-content {
        position: relative;
        z-index: 2;
    }

    .university-icon {
        width: 58px;
        height: 58px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 15px;

        background: rgba(255, 255, 255, 0.12);

        border: 1px solid rgba(255, 255, 255, 0.15);

        font-size: 26px;

        margin-bottom: 25px;
    }

    .brand-title {
        font-size: 29px;

        font-weight: 800;

        line-height: 1.2;

        letter-spacing: -0.6px;

        margin-bottom: 15px;
    }

    .brand-description {
        max-width: 340px;

        font-size: 13px;

        line-height: 1.8;

        color: rgba(255, 255, 255, 0.72);
    }

    /* =========================
       FEATURES
    ========================= */

    .feature-list {
        position: relative;

        z-index: 2;

        margin-top: 35px;
    }

    .feature {
        display: flex;

        align-items: center;

        gap: 12px;

        margin-bottom: 16px;

        font-size: 12px;

        color: rgba(255, 255, 255, 0.85);
    }

    .feature-icon {
        width: 36px;
        height: 36px;

        display: flex;

        align-items: center;
        justify-content: center;

        border-radius: 9px;

        background:
            rgba(255, 255, 255, 0.10);

        font-size: 15px;
    }

    .brand-footer {
        position: relative;

        z-index: 2;

        font-size: 10px;

        color: rgba(255, 255, 255, 0.42);
    }

    /* =========================
       RIGHT LOGIN AREA
    ========================= */

    .login-section {
        display: flex;

        align-items: center;
        justify-content: center;

        padding: 50px 70px;
    }

    .login-card {
        width: 100%;
        max-width: 410px;
    }

    /* =========================
       HEADER
    ========================= */

    .portal-badge {
        display: inline-flex;

        align-items: center;

        gap: 8px;

        padding: 7px 12px;

        border-radius: 30px;

        background: #E0D4E9;

        color: #63378F;

        font-size: 10px;

        font-weight: 800;

        letter-spacing: 0.5px;

        margin-bottom: 17px;
    }

    .login-title {
        margin: 0;

        font-size: 30px;

        font-weight: 800;

        letter-spacing: -0.7px;

        color: #241B2D;
    }

    .login-subtitle {
        margin: 9px 0 30px;

        font-size: 13px;

        line-height: 1.7;

        color: #6F6577;
    }

    /* =========================
       ERROR
    ========================= */

    .error-alert {
        display: flex;

        align-items: center;

        gap: 9px;

        padding: 11px 13px;

        margin-bottom: 20px;

        border-radius: 9px;

        background: #fef2f2;

        border: 1px solid #fecaca;

        color: #b91c1c;

        font-size: 12px;
    }

    /* =========================
       FORM
    ========================= */

    .form-group {
        margin-bottom: 20px;
    }

    .form-label {
        display: block;

        margin-bottom: 8px;

        font-size: 12px;

        font-weight: 700;

        color: #334155;
    }

    .input-wrapper {
        position: relative;
    }

    .input-icon {
        position: absolute;

        left: 15px;
        top: 50%;

        transform: translateY(-50%);

        color: #94a3b8;

        font-size: 16px;

        pointer-events: none;
    }

    .form-control-modern {
        width: 100%;

        height: 52px;

        padding: 0 45px;

        border: 1px solid #d2c5db;

        border-radius: 10px;

        background: #f8f6fa;

        color: #241B2D;

        font-family: inherit;

        font-size: 13px;

        outline: none;

        transition: 0.2s;
    }

    .form-control-modern::placeholder {
        color: #a1aab8;
    }

    .form-control-modern:focus {
        border-color: #63378F;

        background: #ffffff;

        box-shadow:
            0 0 0 4px rgba(99, 55, 143, 0.08);
    }

    /* =========================
       PASSWORD TOGGLE
    ========================= */

    .password-toggle {
        position: absolute;

        right: 13px;
        top: 50%;

        transform: translateY(-50%);

        border: none;

        background: transparent;

        color: #94a3b8;

        font-size: 17px;

        cursor: pointer;

        padding: 4px;
    }

    .password-toggle:hover {
        color: #63378F;
    }

    /* =========================
       REMEMBER ME
    ========================= */

    .remember {
        display: flex;

        align-items: center;

        gap: 7px;

        margin: 5px 0 23px;

        font-size: 11px;

        color: #64748b;

        cursor: pointer;
    }

    .remember input {
        width: 14px;
        height: 14px;

        accent-color: #63378F;

        cursor: pointer;
    }

    /* =========================
       LOGIN BUTTON
    ========================= */

    .login-button {
        width: 100%;

        height: 52px;

        border: none;

        border-radius: 10px;

        background: #63378F;

        color: #ffffff;

        font-family: inherit;

        font-size: 13px;

        font-weight: 700;

        cursor: pointer;

        display: flex;

        align-items: center;

        justify-content: center;

        gap: 9px;

        box-shadow:
            0 7px 18px rgba(99, 55, 143, 0.20);

        transition: 0.2s;
    }

    .login-button:hover {
        background: #4E2875;

        transform: translateY(-1px);

        box-shadow:
            0 10px 22px rgba(99, 55, 143, 0.25);
    }

    .login-button:disabled {
        opacity: 0.85;

        cursor: not-allowed;

        transform: none;
    }

    .button-spinner {
        display: none;
    }

    /* =========================
       REGISTER
    ========================= */

    .register-section {
        text-align: center;

        margin-top: 25px;

        padding-top: 22px;

        border-top: 1px solid #E4DDE9;
    }

    .register-text {
        margin: 0;

        font-size: 11px;

        color: #64748b;
    }

    .register-link {
        color: #63378F;

        font-weight: 700;

        text-decoration: none;
    }

    .register-link:hover {
        text-decoration: underline;
    }

    /* =========================
       SECURITY
    ========================= */

    .security-note {
        display: flex;

        align-items: center;
        justify-content: center;

        gap: 7px;

        margin-top: 21px;

        color: #94a3b8;

        font-size: 10px;
    }

    .security-note i {
        color: #63378F;

        font-size: 13px;
    }

    /* =========================
       TABLET
    ========================= */

    @media (max-width: 900px) {

        .login-page {
            padding: 20px;
        }

        .login-wrapper {
            max-width: 520px;

            min-height: auto;

            grid-template-columns: 1fr;
        }

        .brand-section {
            display: none;
        }

        .login-section {
            padding: 50px 45px;
        }
    }

    /* =========================
       MOBILE
    ========================= */

    @media (max-width: 550px) {

        .login-page {
            padding: 0;
        }

        .login-wrapper {
            min-height: 100vh;

            border-radius: 0;

            box-shadow: none;
        }

        .login-section {
            padding: 35px 24px;
        }

        .login-title {
            font-size: 27px;
        }
    }

    @media (max-width: 360px) {

        .login-section {
            padding: 28px 19px;
        }

        .login-title {
            font-size: 24px;
        }

        .form-control-modern,
        .login-button {
            height: 49px;
        }
    }

</style>

</head>

<body>

<div class="login-page">

<div class="login-wrapper">


    <!-- LEFT BRANDING -->

    <div class="brand-section">

        <div class="brand-content">

            <div class="university-icon">

                <i class="bi bi-mortarboard-fill"></i>

            </div>


            <div class="brand-title">

                Student<br>
                Management

            </div>


            <div class="brand-description">

                A centralized academic platform for
                managing student profiles, courses,
                enrollment and academic services.

            </div>


            <div class="feature-list">

                <div class="feature">

                    <div class="feature-icon">
                        <i class="bi bi-journal-bookmark-fill"></i>
                    </div>

                    <span>
                        Course Enrollment
                    </span>

                </div>


                <div class="feature">

                    <div class="feature-icon">
                        <i class="bi bi-person-vcard-fill"></i>
                    </div>

                    <span>
                        Student Profile
                    </span>

                </div>


                <div class="feature">

                    <div class="feature-icon">
                        <i class="bi bi-credit-card-fill"></i>
                    </div>

                    <span>
                        Fee Management
                    </span>

                </div>


                <div class="feature">

                    <div class="feature-icon">
                        <i class="bi bi-bar-chart-fill"></i>
                    </div>

                    <span>
                        Academic Records
                    </span>

                </div>

            </div>

        </div>


        <div class="brand-footer">

            © 2026 College Academic Portal

        </div>

    </div>


    <!-- LOGIN SECTION -->

    <div class="login-section">

        <div class="login-card">


            <!-- HEADER -->

            <div class="portal-badge">

                <i class="bi bi-person-fill"></i>

                STUDENT PORTAL

            </div>


            <h1 class="login-title">

                Welcome Back

            </h1>


            <p class="login-subtitle">

                Sign in to access your academic dashboard
                and student services.

            </p>


            <!-- ERROR -->

            <c:if test="${not empty error}">

                <div class="error-alert">

                    <i class="bi bi-exclamation-circle-fill"></i>

                    <span>
                        ${error}
                    </span>

                </div>

            </c:if>


            <!-- LOGIN FORM -->

            <form
                action="${pageContext.request.contextPath}/student/login"
                method="post"
                id="loginForm">


                <!-- EMAIL -->

                <div class="form-group">

                    <label class="form-label">
                        Email Address
                    </label>


                    <div class="input-wrapper">

                        <i class="bi bi-envelope input-icon"></i>


                        <input
                            type="email"
                            name="email"
                            class="form-control-modern"
                            placeholder="Enter your email address"
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

                        <i class="bi bi-lock input-icon"></i>


                        <input
                            type="password"
                            name="password"
                            id="password"
                            class="form-control-modern"
                            placeholder="Enter your password"
                            required
                            autocomplete="current-password">


                        <button
                            type="button"
                            class="password-toggle"
                            id="passwordToggle"
                            aria-label="Show password">

                            <i class="bi bi-eye"></i>

                        </button>

                    </div>

                </div>


                <!-- REMEMBER ME -->

                <label class="remember">

                    <input
                        type="checkbox"
                        name="rememberMe">

                    <span>
                        Remember me
                    </span>

                </label>


                <!-- LOGIN BUTTON -->

                <button
                    type="submit"
                    class="login-button"
                    id="loginButton">

                    <span id="buttonText">
                        Sign In
                    </span>

                    <span
                        class="button-spinner spinner-border spinner-border-sm"
                        id="buttonSpinner">
                    </span>

                    <i
                        class="bi bi-arrow-right"
                        id="buttonIcon">
                    </i>

                </button>


            </form>


            <!-- REGISTER -->

            <div class="register-section">

                <p class="register-text">

                    Don't have a student account?

                    <a
                        href="${pageContext.request.contextPath}/student/register"
                        class="register-link">

                        Create Account

                    </a>

                </p>

            </div>


            <!-- SECURITY -->

            <div class="security-note">

                <i class="bi bi-shield-check"></i>

                Secure Student Portal

            </div>


        </div>

    </div>

</div>

</div>

<!-- JAVASCRIPT -->

<script>

    // SHOW / HIDE PASSWORD

    const password =
        document.getElementById("password");

    const passwordToggle =
        document.getElementById("passwordToggle");


    passwordToggle.addEventListener("click", function () {

        if (password.type === "password") {

            password.type = "text";

            this.innerHTML =
                '<i class="bi bi-eye-slash"></i>';

            this.setAttribute(
                "aria-label",
                "Hide password"
            );

        } else {

            password.type = "password";

            this.innerHTML =
                '<i class="bi bi-eye"></i>';

            this.setAttribute(
                "aria-label",
                "Show password"
            );

        }

    });


    // LOGIN BUTTON LOADING

    const loginForm =
        document.getElementById("loginForm");

    const loginButton =
        document.getElementById("loginButton");

    const buttonText =
        document.getElementById("buttonText");

    const buttonSpinner =
        document.getElementById("buttonSpinner");

    const buttonIcon =
        document.getElementById("buttonIcon");


    loginForm.addEventListener("submit", function () {

        loginButton.disabled = true;

        buttonText.textContent = "Signing In...";

        buttonIcon.style.display = "none";

        buttonSpinner.style.display = "inline-block";

    });

</script>

</body>

</html>
