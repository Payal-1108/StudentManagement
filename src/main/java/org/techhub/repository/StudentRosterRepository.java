package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.StudentRoster;

@Repository
public class StudentRosterRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================
    // GET STUDENTS OF A COURSE
    // =========================

    public List<StudentRoster> getRosterByCourse(int courseId) {

        String sql =
                "SELECT s.id AS student_id, " +
                "s.roll_number, " +
                "s.name AS student_name, " +
                "s.email, " +
                "c.course_code, " +
                "c.title AS course_title, " +
                "ce.semester, " +
                "ce.status AS enrollment_status " +
                "FROM course_enrollments ce " +
                "JOIN students s " +
                "ON ce.student_id = s.id " +
                "JOIN courses c " +
                "ON ce.course_id = c.id " +
                "WHERE ce.course_id = ? " +
                "ORDER BY s.roll_number";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    StudentRoster roster =
                            new StudentRoster();

                    roster.setStudentId(
                            rs.getInt("student_id")
                    );

                    roster.setRollNumber(
                            rs.getString("roll_number")
                    );

                    roster.setStudentName(
                            rs.getString("student_name")
                    );

                    roster.setEmail(
                            rs.getString("email")
                    );

                    roster.setCourseCode(
                            rs.getString("course_code")
                    );

                    roster.setCourseTitle(
                            rs.getString("course_title")
                    );

                    roster.setSemester(
                            rs.getString("semester")
                    );

                    roster.setEnrollmentStatus(
                            rs.getString("enrollment_status")
                    );

                    return roster;
                },
                courseId
        );
    }
}