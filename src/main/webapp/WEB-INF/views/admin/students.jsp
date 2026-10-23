<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">

<title>Student Management</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">

<style>

    .student-search {
        margin: 20px 0 25px 0;
        padding: 15px;
        background: #F8F6FA;
        border: 1px solid #DDD2E5;
        border-radius: 8px;
    }

    .student-search form {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .student-search input {
        width: 350px;
        height: 42px;
        padding: 0 13px;
        border: 1px solid #DDD2E5;
        border-radius: 6px;
        font-size: 13px;
        box-sizing: border-box;
        background: #FFFFFF;
        color: #24172E;
    }

    .student-search input:focus {
        outline: none;
        border-color: #6D3FA0;
    }

    .student-search button {
        height: 42px;
        padding: 0 20px;
        background: #6D3FA0;
        color: #FFFFFF;
        border: none;
        border-radius: 6px;
        font-size: 13px;
        cursor: pointer;
    }

    .student-search button:hover {
        background: #4B286B;
    }

    .student-search a {
        height: 42px;
        display: flex;
        align-items: center;
        padding: 0 18px;
        background: #FFFFFF;
        color: #4B286B;
        border: 1px solid #DDD2E5;
        border-radius: 6px;
        text-decoration: none;
        font-size: 13px;
    }

    .student-search a:hover {
        background: #EEE5F5;
    }

    .table-container table th {
        background: #FAF8FC;
        color: #4B286B;
    }

    .table-container table td {
        color: #24172E;
    }

    .table-container table tbody tr:hover {
        background: #FAF8FC;
    }

    .edit-button {
        display: inline-block;
        padding: 7px 13px;
        margin-right: 5px;
        background: #EEE5F5;
        color: #6D3FA0;
        border-radius: 6px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 600;
    }

    .edit-button:hover {
        background: #CDB1E8;
        color: #4B286B;
    }

    .delete-button {
        display: inline-block;
        padding: 7px 13px;
        background: #F8EDEF;
        color: #9B3D52;
        border-radius: 6px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 600;
    }

    .delete-button:hover {
        background: #E8C8D0;
        color: #7E3042;
    }

    @media (max-width: 768px) {

        .student-search form {
            flex-direction: column;
            align-items: stretch;
        }

        .student-search input {
            width: 100%;
        }

        .student-search button,
        .student-search a {
            width: 100%;
            justify-content: center;
        }

    }

</style>


</head>

<body>

<div class="dashboard-container">


<!-- SIDEBAR -->

<aside class="sidebar">

    <div class="sidebar-brand">

        <div class="brand-icon">
            S
        </div>

        <div>

            <h2>Student Management</h2>

            <span>Administration</span>

        </div>

    </div>


    <nav class="sidebar-menu">

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="menu-item">

            <span>DB</span>
            Dashboard

        </a>


        <a href="${pageContext.request.contextPath}/admin/students"
           class="menu-item">

            <span>ST</span>
            Students

        </a>


        <a href="${pageContext.request.contextPath}/admin/departments"
           class="menu-item">

            <span>DP</span>
            Departments

        </a>


        <a href="${pageContext.request.contextPath}/admin/courses"
           class="menu-item">

            <span>CR</span>
            Courses

        </a>


        <a href="${pageContext.request.contextPath}/admin/faculty-assignment"
           class="menu-item">

            <span>FC</span>
            Faculty

        </a>


        <div class="menu-item">

            <span>EN</span>
            Enrollment

        </div>


        <div class="menu-item">

            <span>PY</span>
            Payments

        </div>

    </nav>


    <div class="sidebar-footer">

        <a href="${pageContext.request.contextPath}/admin/logout"
           class="logout-link">

            Logout

        </a>

    </div>

</aside>



<!-- MAIN CONTENT -->

<main class="main-content">


    <!-- PAGE HEADER -->

    <header class="dashboard-header">

        <div>

            <h1>
                Students
            </h1>

            <p>
                Manage student records
            </p>

        </div>


        <div class="admin-profile">

            <div class="profile-circle">
                A
            </div>

            <div>

                <strong>
                    ${sessionScope.admin.name}
                </strong>

                <span>
                    Registrar Admin
                </span>

            </div>

        </div>

    </header>



    <!-- ACTION BUTTONS -->

    <div class="page-actions">

        <a href="${pageContext.request.contextPath}/admin/students/add"
           class="primary-button">

            Add Student

        </a>


        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="secondary-button">

            Back to Dashboard

        </a>

    </div>



    <!-- STUDENT LIST -->

    <section class="content-card">


        <div class="section-header">

            <div>

                <h2>
                    Student List
                </h2>

                <p>
                    All registered students available in the system
                </p>

            </div>

        </div>



        <!-- SEARCH -->

        <div class="student-search">

            <form action="${pageContext.request.contextPath}/admin/students/search"
                  method="get">

                <input type="text"
                       name="keyword"
                       value="${keyword}"
                       placeholder="Search by roll number or student name"
                       required>

                <button type="submit">
                    Search
                </button>

                <a href="${pageContext.request.contextPath}/admin/students">
                    Clear
                </a>

            </form>

        </div>



        <!-- STUDENT TABLE -->

        <div class="table-container">

            <table>

                <thead>

                <tr>

                    <th>
                        ID
                    </th>

                    <th>
                        Roll Number
                    </th>

                    <th>
                        Student Name
                    </th>

                    <th>
                        Email
                    </th>

                    <th>
                        Department
                    </th>

                    <th>
                        Semester
                    </th>

                    <th>
                        Action
                    </th>

                </tr>

                </thead>


                <tbody>


                <c:choose>


                    <!-- STUDENTS FOUND -->

                    <c:when test="${not empty students}">

                        <c:forEach var="student"
                                   items="${students}">

                            <tr>

                                <td>
                                    ${student.id}
                                </td>

                                <td>
                                    ${student.rollNumber}
                                </td>

                                <td>
                                    ${student.name}
                                </td>

                                <td>
                                    ${student.email}
                                </td>

                                <td>
                                    ${student.departmentName}
                                </td>

                                <td>
                                    Semester ${student.currentSemester}
                                </td>

                                <td>

                                    <a href="${pageContext.request.contextPath}/admin/students/edit?id=${student.id}"
                                       class="edit-button">

                                        Edit

                                    </a>


                                    <a href="${pageContext.request.contextPath}/admin/students/delete?id=${student.id}"
                                       class="delete-button"
                                       onclick="return confirm('Are you sure you want to delete this student?');">

                                        Delete

                                    </a>

                                </td>

                            </tr>

                        </c:forEach>

                    </c:when>


                    <!-- NO STUDENTS -->

                    <c:otherwise>

                        <tr>

                            <td colspan="7"
                                style="text-align:center; padding:30px; color:#786B82;">

                                No students found.

                            </td>

                        </tr>

                    </c:otherwise>

                </c:choose>


                </tbody>

            </table>

        </div>


    </section>


</main>


</div>

</body>

</html>
