
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>College Academic Portal</title>

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

        html {
            scroll-behavior: smooth;
            scroll-padding-top: 80px;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;

            /* Dark purple page background */
            background: #E8E0F0;

            color: #241B2D;
        }

        a {
            text-decoration: none;
        }


        /* ================= NAVBAR ================= */

        .navbar {
            background: #ffffff;
            border-bottom: 1px solid #CFC2DC;
            padding: 15px 0;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;

            color: #281B35;

            font-size: 18px;
            font-weight: 800;
        }

        .brand:hover {
            color: #281B35;
        }

        .brand-icon {
            width: 38px;
            height: 38px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;

            background: #D8CBE5;
            color: #63378F;

            font-size: 20px;
        }

        .nav-link {
            color: #5F5668 !important;

            font-size: 12px;
            font-weight: 600;

            margin-left: 22px;
        }

        .nav-link:hover {
            color: #63378F !important;
        }


        /* ================= LOGIN NAV BUTTON ================= */

        .login-nav-btn {
            background: #63378F;

            color: white !important;

            padding: 10px 18px !important;

            border-radius: 7px;

            margin-left: 22px !important;

            transition: 0.2s;
        }

        .login-nav-btn:hover {
            background: #4E2875;

            color: white !important;
        }


        /* ================= LOGIN DROPDOWN ================= */

        .login-dropdown {
            min-width: 245px;

            padding: 8px;

            margin-top: 10px !important;

            border: 1px solid #CFC2DC;

            border-radius: 10px;

            background: #ffffff;

            box-shadow:
                0 12px 30px rgba(78, 40, 117, 0.12);
        }

        .login-dropdown .dropdown-item {
            display: flex;

            align-items: center;

            gap: 12px;

            padding: 11px 10px;

            border-radius: 7px;

            color: #2D2435;

            transition: 0.2s;
        }

        .login-dropdown .dropdown-item:hover {
            background: #E6DDF0;

            color: #4E2875;
        }

        .dropdown-icon {
            width: 36px;
            height: 36px;

            flex-shrink: 0;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 8px;

            background: #D8CBE5;

            color: #63378F;

            font-size: 17px;
        }

        .login-dropdown strong {
            display: block;

            font-size: 12px;

            font-weight: 700;
        }

        .login-dropdown small {
            display: block;

            margin-top: 2px;

            color: #776D80;

            font-size: 9px;
        }


        /* ================= HERO ================= */

        .hero {
            min-height: 510px;

            display: flex;
            align-items: center;

            position: relative;

            overflow: hidden;

            background:
                linear-gradient(
                    90deg,
                    rgba(36, 18, 53, 0.95),
                    rgba(91, 52, 128, 0.75)
                ),

                url("https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=2200&q=90")

                center / cover;
        }

        .hero-content {
            color: white;

            padding: 75px 0;

            max-width: 650px;
        }

        .hero-label {
            color: #DCCCEB;

            font-size: 11px;

            font-weight: 800;

            letter-spacing: 1.5px;

            text-transform: uppercase;

            margin-bottom: 15px;
        }

        .hero h1 {
            font-size: 48px;

            font-weight: 800;

            line-height: 1.12;

            margin-bottom: 20px;
        }

        .hero h1 span {
            color: #CDB1E8;
        }

        .hero p {
            color: #E9E1EF;

            font-size: 14px;

            line-height: 1.8;

            max-width: 570px;

            margin-bottom: 28px;
        }

        .hero-buttons {
            display: flex;

            flex-wrap: wrap;

            gap: 12px;
        }

        .green-btn,
        .white-btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 8px;

            padding: 13px 20px;

            border-radius: 7px;

            font-size: 11px;

            font-weight: 800;

            transition: 0.2s;
        }

        .green-btn {

            background: #70439D;

            color: white;
        }

        .green-btn:hover {

            background: #5A3180;

            color: white;
        }

        .white-btn {

            background: white;

            color: #56327A;
        }

        .white-btn:hover {

            background: #F1ECF6;

            color: #56327A;
        }


        /* ================= HERO IMAGE ================= */

        .hero-image-wrapper {

            position: relative;

            width: 100%;

            max-width: 390px;

            margin: auto;
        }

        .hero-image-wrapper img {

            width: 100%;

            height: 390px;

            object-fit: cover;

            border-radius: 16px;
        }

        .hero-badge {

            position: absolute;

            bottom: 25px;

            left: -22px;

            background: white;

            padding: 15px 20px;

            border-radius: 10px;

            box-shadow:
                0 12px 30px rgba(0, 0, 0, 0.20);
        }

        .hero-badge strong {

            display: block;

            color: #63378F;

            font-size: 20px;
        }

        .hero-badge span {

            color: #776D80;

            font-size: 10px;
        }


        /* ================= COMMON SECTION ================= */

        .section {

            padding: 75px 0;
        }

        .section-heading {

            text-align: center;

            margin-bottom: 45px;
        }

        .section-label {

            color: #63378F;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 1.4px;

            text-transform: uppercase;

            margin-bottom: 10px;
        }

        .section-heading h2 {

            color: #2B2134;

            font-size: 30px;

            font-weight: 800;

            margin-bottom: 12px;
        }

        .section-heading p {

            color: #6F6577;

            font-size: 12px;

            line-height: 1.7;

            max-width: 600px;

            margin: auto;
        }


        /* ================= SYSTEM OVERVIEW ================= */

        .overview-section {

            background: #E8E0F0;
        }

        .overview-card {

            height: 100%;

            background: #ffffff;

            border: 1px solid #D2C5DB;

            border-radius: 12px;

            padding: 28px 24px;

            transition: 0.2s;
        }

        .overview-card:hover {

            transform: translateY(-5px);

            box-shadow:
                0 12px 28px rgba(78, 40, 117, 0.10);
        }

        .overview-icon {

            width: 50px;

            height: 50px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 12px;

            background: #D8CBE5;

            color: #63378F;

            font-size: 23px;

            margin-bottom: 18px;
        }

        .overview-card h5 {

            color: #2D2435;

            font-size: 15px;

            font-weight: 800;

            margin-bottom: 10px;
        }

        .overview-card p {

            color: #746A7B;

            font-size: 11px;

            line-height: 1.7;

            margin: 0;
        }


        /* ================= FEATURES ================= */

        .feature-section {

            background: #DED3E8;
        }

        .feature-list {

            background: white;

            border: 1px solid #CFC2DC;

            border-radius: 12px;

            padding: 28px;
        }

        .feature-item {

            display: flex;

            align-items: flex-start;

            gap: 13px;

            margin-bottom: 22px;
        }

        .feature-item:last-child {

            margin-bottom: 0;
        }

        .feature-icon {

            width: 35px;

            height: 35px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #D8CBE5;

            color: #63378F;

            border-radius: 8px;
        }

        .feature-item h6 {

            color: #302638;

            font-size: 12px;

            font-weight: 800;

            margin-bottom: 5px;
        }

        .feature-item p {

            color: #746A7B;

            font-size: 10px;

            line-height: 1.6;

            margin: 0;
        }

        .feature-image {

            width: 100%;

            height: 390px;

            object-fit: cover;

            border-radius: 14px;
        }


        /* ================= LOGIN SECTION ================= */

        .login-section {

            background: #E8E0F0;
        }

        .login-card {

            height: 100%;

            background: #ffffff;

            border: 1px solid #CFC2DC;

            border-radius: 14px;

            padding: 35px 28px;

            text-align: center;

            transition: 0.25s;
        }

        .login-card:hover {

            transform: translateY(-6px);

            box-shadow:
                0 15px 35px rgba(78, 40, 117, 0.12);

            border-color: #B9A3CB;
        }

        .login-icon {

            width: 70px;

            height: 70px;

            display: flex;

            align-items: center;

            justify-content: center;

            margin: 0 auto 20px;

            border-radius: 50%;

            background: #D8CBE5;

            color: #63378F;

            font-size: 30px;
        }

        .login-card h4 {

            color: #2D2435;

            font-size: 18px;

            font-weight: 800;

            margin-bottom: 12px;
        }

        .login-card p {

            color: #746A7B;

            font-size: 11px;

            line-height: 1.7;

            min-height: 58px;

            margin-bottom: 22px;
        }

        .login-btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 8px;

            width: 100%;

            background: #63378F;

            color: white;

            padding: 12px;

            border-radius: 7px;

            font-size: 11px;

            font-weight: 800;

            transition: 0.2s;
        }

        .login-btn:hover {

            background: #4E2875;

            color: white;
        }


        /* ================= CTA ================= */

        .cta {

            background:
                linear-gradient(
                    90deg,
                    #4A2670,
                    #70439D
                );

            color: white;

            padding: 60px 0;
        }

        .cta h2 {

            font-size: 30px;

            font-weight: 800;

            margin-bottom: 12px;
        }

        .cta p {

            color: #E9E1EF;

            font-size: 12px;

            line-height: 1.7;

            max-width: 600px;

            margin-bottom: 0;
        }

        .cta-btn {

            display: inline-flex;

            align-items: center;

            gap: 8px;

            background: white;

            color: #56327A;

            padding: 13px 22px;

            border-radius: 7px;

            font-size: 11px;

            font-weight: 800;
        }

        .cta-btn:hover {

            background: #F1ECF6;

            color: #56327A;
        }


        /* ================= FOOTER ================= */

        footer {

            background: #1C1522;

            color: #AFA5B7;

            padding: 30px 0;

            font-size: 10px;
        }

        footer .brand {

            color: white;
        }

        footer .brand:hover {

            color: white;
        }

        footer a {

            color: #AFA5B7;

            margin-left: 18px;
        }

        footer a:hover {

            color: white;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 991px) {

            .nav-link {

                margin-left: 0;

                padding: 10px 0 !important;
            }

            .login-nav-btn {

                display: inline-block;

                margin-left: 0 !important;

                margin-top: 5px;
            }

            .login-dropdown {

                margin-top: 5px !important;

                min-width: 225px;
            }

            .hero-content {

                padding: 60px 0 25px;
            }

            .hero-image-wrapper {

                margin-bottom: 55px;
            }

            .feature-image {

                margin-bottom: 25px;
            }

        }


        @media (max-width: 767px) {

            .hero h1 {

                font-size: 36px;
            }

            .hero p {

                font-size: 12px;
            }

            .section {

                padding: 55px 0;
            }

            .section-heading h2 {

                font-size: 25px;
            }

            .hero-image-wrapper {

                max-width: 300px;
            }

            .hero-image-wrapper img {

                height: 320px;
            }

            .hero-badge {

                left: -5px;
            }

            .cta {

                text-align: center;
            }

            .cta-btn {

                margin-top: 25px;
            }

        }


        @media (max-width: 480px) {

            .brand {

                font-size: 14px;
            }

            .hero h1 {

                font-size: 31px;
            }

            .hero-buttons {

                flex-direction: column;
            }

            .green-btn,
            .white-btn {

                width: 100%;
            }

        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg sticky-top">

    <div class="container">


        <!-- BRAND -->

        <a class="brand"
           href="${pageContext.request.contextPath}/">

            <span class="brand-icon">

                <i class="bi bi-mortarboard-fill"></i>

            </span>

            College Academic Portal

        </a>


        <!-- MOBILE MENU -->

        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#mainNavbar"
            aria-controls="mainNavbar"
            aria-expanded="false"
            aria-label="Toggle navigation">

            <span class="navbar-toggler-icon"></span>

        </button>


        <!-- NAVIGATION -->

        <div
            class="collapse navbar-collapse"
            id="mainNavbar">

            <ul class="navbar-nav ms-auto align-items-lg-center">


                <li class="nav-item">

                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/">

                        Home

                    </a>

                </li>


                <li class="nav-item">

                    <a class="nav-link"
                       href="#overview">

                        Overview

                    </a>

                </li>


                <li class="nav-item">

                    <a class="nav-link"
                       href="#features">

                        Features

                    </a>

                </li>


                <!-- ================= LOGIN DROPDOWN ================= -->

                <li class="nav-item dropdown">

                    <a
                        class="nav-link login-nav-btn dropdown-toggle"
                        href="#"
                        id="loginDropdown"
                        role="button"
                        data-bs-toggle="dropdown"
                        aria-expanded="false">

                        <i class="bi bi-box-arrow-in-right"></i>

                        Login

                    </a>


                    <ul
                        class="dropdown-menu dropdown-menu-end login-dropdown"
                        aria-labelledby="loginDropdown">


                        <!-- STUDENT LOGIN -->

                        <li>

                            <a
                                class="dropdown-item"
                                href="${pageContext.request.contextPath}/student/login">

                                <span class="dropdown-icon">

                                    <i class="bi bi-person-fill"></i>

                                </span>


                                <span>

                                    <strong>
                                        Student
                                    </strong>

                                    <small>
                                        Student Portal
                                    </small>

                                </span>

                            </a>

                        </li>


                        <!-- FACULTY LOGIN -->

                        <li>

                            <a
                                class="dropdown-item"
                                href="${pageContext.request.contextPath}/faculty/login">

                                <span class="dropdown-icon">

                                    <i class="bi bi-person-workspace"></i>

                                </span>


                                <span>

                                    <strong>
                                        Faculty
                                    </strong>

                                    <small>
                                        Faculty Portal
                                    </small>

                                </span>

                            </a>

                        </li>


                        <!-- ADMIN LOGIN -->

                        <li>

                            <a
                                class="dropdown-item"
                                href="${pageContext.request.contextPath}/admin/login">

                                <span class="dropdown-icon">

                                    <i class="bi bi-shield-lock-fill"></i>

                                </span>


                                <span>

                                    <strong>
                                        Admin
                                    </strong>

                                    <small>
                                        College Administration
                                    </small>

                                </span>

                            </a>

                        </li>


                    </ul>

                </li>


            </ul>

        </div>

    </div>

</nav>



<!-- ================= HERO ================= -->

<section class="hero">

    <div class="container">

        <div class="row align-items-center">


            <!-- HERO TEXT -->

            <div class="col-lg-7">

                <div class="hero-content">


                    <div class="hero-label">

                        Student Management & Course Enrollment System

                    </div>


                    <h1>

                        Manage Your

                        <span>
                            Academic Journey
                        </span>

                        With Confidence.

                    </h1>


                    <p>

                        A centralized college academic platform designed
                        to manage student records, academic departments,
                        course enrollment, faculty activities and fee payments
                        in one secure system.

                    </p>


                    <div class="hero-buttons">


                        <!-- HERO LOGIN -->

                        <a href="#login"
                           class="green-btn">

                            LOGIN

                            <i class="bi bi-arrow-right"></i>

                        </a>


                        <!-- EXPLORE -->

                        <a href="#overview"
                           class="white-btn">

                            EXPLORE SYSTEM

                            <i class="bi bi-arrow-down"></i>

                        </a>


                    </div>

                </div>

            </div>



            <!-- HERO IMAGE -->

            <div class="col-lg-5">

                <div class="hero-image-wrapper">

                    <img
                        src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=900&q=90"
                        alt="College students">


                    <div class="hero-badge">

                        <strong>
                            College Academic Portal
                        </strong>

                        <span>
                            One platform for your college
                        </span>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>



<!-- ================= SYSTEM OVERVIEW ================= -->

<section class="section overview-section"
         id="overview">

    <div class="container">


        <div class="section-heading">

            <div class="section-label">

                System Overview

            </div>


            <h2>

                One Platform For College Academic Management

            </h2>


            <p>

                Our system connects college administration,
                students, faculty and course enrollment through
                a centralized academic platform.

            </p>

        </div>



        <div class="row g-4">


            <!-- ADMIN -->

            <div class="col-md-6 col-lg-3">

                <div class="overview-card">

                    <div class="overview-icon">

                        <i class="bi bi-shield-lock-fill"></i>

                    </div>


                    <h5>

                        Admin / Administrator

                    </h5>


                    <p>

                        Manage departments, courses, student records,
                     enrollment approvals and payments.

                    </p>

                </div>

            </div>



            <!-- STUDENT -->

            <div class="col-md-6 col-lg-3">

                <div class="overview-card">

                    <div class="overview-icon">

                        <i class="bi bi-person-fill"></i>

                    </div>


                    <h5>

                        Student Management

                    </h5>


                    <p>

                        Register students, manage profiles
                        and view academic enrollment information.

                    </p>

                </div>

            </div>



            <!-- COURSE -->

            <div class="col-md-6 col-lg-3">

                <div class="overview-card">

                    <div class="overview-icon">

                        <i class="bi bi-book-fill"></i>

                    </div>


                    <h5>

                        Course Enrollment

                    </h5>


                    <p>

                        Browse available courses, 
                        enroll in subjects and drop courses.

                    </p>

                </div>

            </div>



            <!-- FACULTY -->

            <div class="col-md-6 col-lg-3">

                <div class="overview-card">

                    <div class="overview-icon">

                        <i class="bi bi-person-workspace"></i>

                    </div>


                    <h5>

                        Faculty Management

                    </h5>


                    <p>

                        View assigned courses and access enrolled
                        student rosters for each class.

                    </p>

                </div>

            </div>


        </div>

    </div>

</section>



<!-- ================= FEATURES ================= -->

<section class="section feature-section"
         id="features">

    <div class="container">


        <div class="section-heading">

            <div class="section-label">

                Core Functionality

            </div>


            <h2>

                Designed For Complete College Academic Operations

            </h2>


            <p>

                Simplify college administration and provide
                students with easy access to essential academic services.

            </p>

        </div>



        <div class="row align-items-center">


            <!-- IMAGE -->

            <div class="col-lg-5">

                <img
                    class="feature-image"
                    src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=900&q=90"
                    alt="College students working together">

            </div>



            <!-- FEATURE LIST -->

            <div class="col-lg-7">

                <div class="feature-list">


                    <div class="feature-item">

                        <div class="feature-icon">

                            <i class="bi bi-check-circle-fill"></i>

                        </div>


                        <div>

                            <h6>

                                Academic Department Management

                            </h6>


                            <p>

                                Create, update and manage academic departments
                                and department information.

                            </p>

                        </div>

                    </div>



                    <div class="feature-item">

                        <div class="feature-icon">

                            <i class="bi bi-check-circle-fill"></i>

                        </div>


                        <div>

                            <h6>

                                Course Catalog Management

                            </h6>


                            <p>

                                Add courses, define credits, assign departments
                                and manage course fees.

                            </p>

                        </div>

                    </div>



                    <div class="feature-item">

                        <div class="feature-icon">

                            <i class="bi bi-check-circle-fill"></i>

                        </div>


                        <div>

                            <h6>

                                Student Enrollment

                            </h6>


                            <p>

                                Students can browse courses, enroll in subjects and manage schedules.

                            </p>

                        </div>

                    </div>



                    <div class="feature-item">

                        <div class="feature-icon">

                            <i class="bi bi-check-circle-fill"></i>

                        </div>


                        <div>

                            <h6>

                                Fee Payment & Receipt

                            </h6>


                            <p>

                                Track enrollment fees, payment status and
                                generate transaction references and receipts.

                            </p>

                        </div>

                    </div>


                </div>

            </div>

        </div>

    </div>

</section>



<!-- ================= LOGIN OPTIONS ================= -->

<section class="section login-section"
         id="login">

    <div class="container">


        <div class="section-heading">

            <div class="section-label">

                Secure Access

            </div>


            <h2>

                Choose Your Login

            </h2>


            <p>

                Select your role to access the appropriate
                college academic management portal.

            </p>

        </div>



        <div class="row g-4 justify-content-center">


            <!-- STUDENT -->

            <div class="col-md-4">

                <div class="login-card">

                    <div class="login-icon">

                        <i class="bi bi-person-fill"></i>

                    </div>


                    <h4>

                        Student

                    </h4>


                    <p>

                        Register as a student, manage your profile,
                        browse courses, enroll in subjects and view fees.

                    </p>


                    <a
                        href="${pageContext.request.contextPath}/student/login"
                        class="login-btn">

                        STUDENT LOGIN

                        <i class="bi bi-arrow-right"></i>

                    </a>

                </div>

            </div>



            <!-- FACULTY -->

            <div class="col-md-4">

                <div class="login-card">

                    <div class="login-icon">

                        <i class="bi bi-person-workspace"></i>

                    </div>


                    <h4>

                        Faculty

                    </h4>


                    <p>

                        Access assigned courses, view enrolled student
                        rosters and manage academic class information.

                    </p>


                    <a
                        href="${pageContext.request.contextPath}/faculty/login"
                        class="login-btn">

                        FACULTY LOGIN

                        <i class="bi bi-arrow-right"></i>

                    </a>

                </div>

            </div>



            <!-- ADMIN -->

            <div class="col-md-4">

                <div class="login-card">

                    <div class="login-icon">

                        <i class="bi bi-shield-lock-fill"></i>

                    </div>


                    <h4>

                        Admin / Administrator

                    </h4>


                    <p>

                        Manage students, departments, courses, faculty,
                        enrollments and fee payments.

                    </p>


                    <a
                        href="${pageContext.request.contextPath}/admin/login"
                        class="login-btn">

                        ADMIN LOGIN

                        <i class="bi bi-arrow-right"></i>

                    </a>

                </div>

            </div>


        </div>

    </div>

</section>



<!-- ================= CTA ================= -->

<section class="cta">

    <div class="container">

        <div class="row align-items-center">


            <div class="col-lg-8">

                <h2>

                    Ready to Access Your College Academic Portal?

                </h2>


                <p>

                    Choose your role and continue to manage your
                    academic activities through the college system.

                </p>

            </div>



            <div class="col-lg-4 text-lg-end">

                <a href="#login"
                   class="cta-btn">

                    VIEW LOGIN OPTIONS

                    <i class="bi bi-arrow-up"></i>

                </a>

            </div>


        </div>

    </div>

</section>



<!-- ================= FOOTER ================= -->

<footer>

    <div class="container">

        <div class="d-flex
                    justify-content-between
                    align-items-center
                    flex-wrap
                    gap-3">


            <a
                class="brand"
                href="${pageContext.request.contextPath}/">

                <span class="brand-icon">

                    <i class="bi bi-mortarboard-fill"></i>

                </span>

                College Academic Portal

            </a>


            <div>

                Student Management & Course Enrollment System


                <a href="#overview">

                    Overview

                </a>


                <a href="#features">

                    Features

                </a>


                <a href="#login">

                    Login

                </a>

            </div>


        </div>

    </div>

</footer>



<!-- ================= BOOTSTRAP JS ================= -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>

