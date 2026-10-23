
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Student Registration | Student Management System</title>

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

        html,
        body {
            margin: 0;
            width: 100%;
            height: 100%;
            font-family: 'Inter', sans-serif;
        }

        body {
            overflow: hidden;
            background: #E8E0F0;
        }

        /* ================= MAIN PAGE ================= */

        .register-page {
            width: 100%;
            height: 100vh;
            display: flex;
        }

        /* ================= LEFT SIDE ================= */

        .register-left {
            width: 46%;
            height: 100vh;
            position: relative;
            overflow: hidden;

            background:
                linear-gradient(
                    135deg,
                    rgba(36, 18, 53, 0.96),
                    rgba(91, 52, 128, 0.88)
                ),
                url('https://images.unsplash.com/photo-1564981797816-1043664bf78d?auto=format&fit=crop&w=1400&q=85');

            background-size: cover;
            background-position: center;
        }

        .register-left-content {
            position: absolute;
            inset: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 60px;
            color: white;
        }

        .university-logo {
            width: 56px;
            height: 56px;
            border-radius: 15px;
            background: rgba(255,255,255,0.14);
            border: 1px solid rgba(255,255,255,0.20);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 27px;
            margin-bottom: 25px;
        }

        .register-left h1 {
            font-size: 38px;
            line-height: 1.15;
            font-weight: 800;
            margin: 0 0 16px;
            max-width: 500px;
        }

        .register-left p {
            font-size: 14px;
            line-height: 1.7;
            color: rgba(255,255,255,0.78);
            max-width: 490px;
            margin-bottom: 28px;
        }

        .feature-list {
            display: flex;
            flex-direction: column;
            gap: 11px;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 11px;
            font-size: 12px;
            color: rgba(255,255,255,0.88);
        }

        .feature-item-icon {
            width: 32px;
            height: 32px;
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(255,255,255,0.11);
            font-size: 14px;
        }

        .register-left-footer {
            position: absolute;
            bottom: 25px;
            left: 60px;
            color: rgba(255,255,255,0.45);
            font-size: 10px;
        }

        /* ================= RIGHT SIDE ================= */

        .register-right {
            width: 54%;
            height: 100vh;
            background: #F8F6FA;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 25px 50px;
            overflow-y: auto;
        }

        .register-card {
            width: 100%;
            max-width: 500px;
        }

        .portal-icon {
            width: 48px;
            height: 48px;
            border-radius: 13px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #E0D4E9;
            color: #63378F;
            font-size: 21px;
            margin-bottom: 14px;
        }

        .register-card h2 {
            margin: 0 0 5px;
            color: #241B2D;
            font-size: 25px;
            font-weight: 800;
        }

        .subtitle {
            color: #6F6577;
            font-size: 12px;
            margin: 0 0 20px;
        }

        /* ================= ERROR ================= */

        .error-alert {
            display: flex;
            align-items: center;
            gap: 8px;
            background: #F8EDEF;
            border: 1px solid #E8C8D0;
            color: #9B3D52;
            border-radius: 8px;
            padding: 9px 12px;
            margin-bottom: 15px;
            font-size: 11px;
        }

        /* ================= FORM ================= */

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .form-group {
            margin-bottom: 13px;
        }

        .form-label {
            display: block;
            color: #3E3447;
            font-size: 11px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #9A8EA3;
            font-size: 14px;
            z-index: 2;
        }

        .form-control-modern,
        .form-select-modern {
            width: 100%;
            height: 42px;
            padding: 0 12px 0 37px;
            border: 1px solid #D2C5DB;
            border-radius: 8px;
            outline: none;
            color: #241B2D;
            font-size: 11px;
            background: #FFFFFF;
            transition: 0.2s ease;
        }

        .form-select-modern {
            padding-left: 37px;
            cursor: pointer;
        }

        .form-control-modern:focus,
        .form-select-modern:focus {
            border-color: #63378F;
            box-shadow: 0 0 0 3px rgba(99,55,143,0.10);
        }

        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background: transparent;
            color: #9A8EA3;
            cursor: pointer;
            font-size: 14px;
            padding: 3px;
        }

        .password-toggle:hover {
            color: #63378F;
        }

        .password-input {
            padding-right: 38px;
        }

        .password-hint {
            margin-top: 4px;
            color: #9A8EA3;
            font-size: 9px;
        }

        /* ================= BUTTON ================= */

        .register-button {
            width: 100%;
            height: 44px;
            border: none;
            border-radius: 8px;
            background: #63378F;
            color: white;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 5px;
            transition: 0.2s ease;
        }

        .register-button:hover {
            background: #4E2875;
            transform: translateY(-1px);
            box-shadow: 0 7px 18px rgba(99,55,143,0.20);
        }

        .register-button:disabled {
            opacity: 0.75;
            cursor: not-allowed;
            transform: none;
        }

        .spinner {
            display: none;
        }

        /* ================= LOGIN LINK ================= */

        .login-link {
            text-align: center;
            margin-top: 15px;
            color: #6F6577;
            font-size: 10px;
        }

        .login-link a {
            color: #63378F;
            text-decoration: none;
            font-weight: 700;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* ================= SECURITY ================= */

        .security-note {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            margin-top: 13px;
            color: #9A8EA3;
            font-size: 9px;
        }

        .security-note i {
            color: #63378F;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 950px) {

            .register-left {
                width: 42%;
            }

            .register-right {
                width: 58%;
                padding: 25px 30px;
            }

            .register-left-content {
                padding: 40px;
            }

            .register-left h1 {
                font-size: 31px;
            }

            .register-left p {
                font-size: 12px;
            }
        }

        @media (max-width: 800px) {

            body {
                overflow: auto;
            }

            .register-page {
                min-height: 100vh;
                height: auto;
            }

            .register-left {
                display: none;
            }

            .register-right {
                width: 100%;
                min-height: 100vh;
                height: auto;
                padding: 30px 20px;
                overflow: visible;
            }

            .register-card {
                max-width: 500px;
            }
        }

        @media (max-width: 550px) {

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .register-right {
                padding: 25px 18px;
            }

            .register-card h2 {
                font-size: 23px;
            }
        }

    </style>

</head>

<body>

<div class="register-page">

    <!-- ================= LEFT SIDE ================= -->

    <section class="register-left">

        <div class="register-left-content">

            <div class="university-logo">
                <i class="bi bi-mortarboard-fill"></i>
            </div>

            <h1>
                Begin Your<br>
                Academic Journey.
            </h1>

            <p>
                Create your student account and get access to
                courses, academic records, enrollments, payments,
                and everything you need for your university journey.
            </p>

            <div class="feature-list">

                <div class="feature-item">

                    <div class="feature-item-icon">
                        <i class="bi bi-person-check-fill"></i>
                    </div>

                    <span>
                        Manage your student profile
                    </span>

                </div>


                <div class="feature-item">

                    <div class="feature-item-icon">
                        <i class="bi bi-journal-bookmark-fill"></i>
                    </div>

                    <span>
                        Browse and enroll in courses
                    </span>

                </div>


                <div class="feature-item">

                    <div class="feature-item-icon">
                        <i class="bi bi-credit-card-fill"></i>
                    </div>

                    <span>
                        Manage fees and payments
                    </span>

                </div>


                <div class="feature-item">

                    <div class="feature-item-icon">
                        <i class="bi bi-file-earmark-text-fill"></i>
                    </div>

                    <span>
                        Access your academic information
                    </span>

                </div>

            </div>

        </div>


        <div class="register-left-footer">
            © 2026 Student Management System
        </div>

    </section>


    <!-- ================= RIGHT SIDE ================= -->

    <section class="register-right">

        <div class="register-card">

            <div class="portal-icon">
                <i class="bi bi-person-plus-fill"></i>
            </div>

            <h2>
                Student Registration
            </h2>

            <p class="subtitle">
                Create your student account to get started
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


            <!-- REGISTRATION FORM -->

            <form
                method="post"
                action="${pageContext.request.contextPath}/student/register"
                id="studentRegisterForm">


                <!-- ROLL NUMBER + NAME -->

                <div class="form-row">

                    <div class="form-group">

                        <label class="form-label">
                            Roll Number
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-person-vcard-fill input-icon"></i>

                            <input
                                type="text"
                                name="rollNumber"
                                value="${student.rollNumber}"
                                class="form-control-modern"
                                placeholder="Enter roll number"
                                required>

                        </div>

                    </div>


                    <div class="form-group">

                        <label class="form-label">
                            Full Name
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-person-fill input-icon"></i>

                            <input
                                type="text"
                                name="name"
                                value="${student.name}"
                                class="form-control-modern"
                                placeholder="Enter full name"
                                required>

                        </div>

                    </div>

                </div>


                <!-- EMAIL -->

                <div class="form-group">

                    <label class="form-label">
                        Email Address
                    </label>

                    <div class="input-wrapper">

                        <i class="bi bi-envelope-fill input-icon"></i>

                        <input
                            type="email"
                            name="email"
                            value="${student.email}"
                            class="form-control-modern"
                            placeholder="Enter email address"
                            autocomplete="email"
                            required>

                    </div>

                </div>


                <!-- DEPARTMENT + SEMESTER -->

                <div class="form-row">

                    <div class="form-group">

                        <label class="form-label">
                            Department
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-building-fill input-icon"></i>

                            <select
                                name="deptId"
                                class="form-select-modern"
                                required>

                                <option value="">
                                    Select Department
                                </option>

                                <c:forEach
                                    var="department"
                                    items="${departments}">

                                    <option
                                        value="${department.id}"
                                        <c:if test="${student.deptId == department.id}">
                                            selected
                                        </c:if>>

                                        ${department.deptName}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>

                    </div>


                    <div class="form-group">

                        <label class="form-label">
                            Current Semester
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-calendar3 input-icon"></i>

                            <select
                                name="currentSemester"
                                class="form-select-modern"
                                required>

                                <option value="">
                                    Select Semester
                                </option>

                                <c:forEach
                                    var="semester"
                                    begin="1"
                                    end="8">

                                    <option
                                        value="${semester}"
                                        <c:if test="${student.currentSemester == semester}">
                                            selected
                                        </c:if>>

                                        Semester ${semester}

                                    </option>

                                </c:forEach>

                            </select>

                        </div>

                    </div>

                </div>


                <!-- PASSWORD + CONFIRM PASSWORD -->

                <div class="form-row">

                    <div class="form-group">

                        <label class="form-label">
                            Password
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-lock-fill input-icon"></i>

                            <input
                                type="password"
                                name="password"
                                id="password"
                                class="form-control-modern password-input"
                                placeholder="Create password"
                                minlength="6"
                                autocomplete="new-password"
                                required>

                            <button
                                type="button"
                                class="password-toggle"
                                onclick="togglePassword('password', 'passwordIcon')">

                                <i
                                    class="bi bi-eye-fill"
                                    id="passwordIcon">
                                </i>

                            </button>

                        </div>

                        <div class="password-hint">
                            Minimum 6 characters
                        </div>

                    </div>


                    <div class="form-group">

                        <label class="form-label">
                            Confirm Password
                        </label>

                        <div class="input-wrapper">

                            <i class="bi bi-shield-lock-fill input-icon"></i>

                            <input
                                type="password"
                                name="confirmPassword"
                                id="confirmPassword"
                                class="form-control-modern password-input"
                                placeholder="Confirm password"
                                minlength="6"
                                autocomplete="new-password"
                                required>

                            <button
                                type="button"
                                class="password-toggle"
                                onclick="togglePassword('confirmPassword', 'confirmPasswordIcon')">

                                <i
                                    class="bi bi-eye-fill"
                                    id="confirmPasswordIcon">
                                </i>

                            </button>

                        </div>

                    </div>

                </div>


                <!-- REGISTER BUTTON -->

                <button
                    type="submit"
                    class="register-button"
                    id="registerButton">

                    <span id="buttonText">
                        Create Student Account
                    </span>

                    <span
                        class="spinner"
                        id="spinner">

                        <span
                            class="spinner-border spinner-border-sm"
                            role="status">
                        </span>

                    </span>

                </button>

            </form>


            <!-- LOGIN LINK -->

            <div class="login-link">

                Already have an account?

                <a
                    href="${pageContext.request.contextPath}/student/login">

                    Student Login

                </a>

            </div>


            <!-- SECURITY -->

            <div class="security-note">

                <i class="bi bi-shield-check"></i>

                Secure Student Registration

            </div>

        </div>

    </section>

</div>


<script>

    function togglePassword(inputId, iconId) {

        const input =
            document.getElementById(inputId);

        const icon =
            document.getElementById(iconId);

        if (input.type === "password") {

            input.type = "text";

            icon.classList.remove("bi-eye-fill");
            icon.classList.add("bi-eye-slash-fill");

        } else {

            input.type = "password";

            icon.classList.remove("bi-eye-slash-fill");
            icon.classList.add("bi-eye-fill");

        }
    }


    document
        .getElementById("studentRegisterForm")
        .addEventListener("submit", function(event) {

            const password =
                document.getElementById("password").value;

            const confirmPassword =
                document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {

                event.preventDefault();

                alert("Password and Confirm Password do not match.");

                return;
            }

            const button =
                document.getElementById("registerButton");

            const text =
                document.getElementById("buttonText");

            const spinner =
                document.getElementById("spinner");

            button.disabled = true;

            text.textContent = "Creating Account...";

            spinner.style.display = "inline-flex";

        });

</script>

</body>
</html>

