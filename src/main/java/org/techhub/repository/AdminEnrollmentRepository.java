package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.CourseEnrollment;

@Repository
public class AdminEnrollmentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // Get all enrollments
    public List<CourseEnrollment> getAllEnrollments() {

        String sql =
                "SELECT ce.id, " +
                "ce.student_id, " +
                "ce.course_id, " +
                "ce.semester, " +
                "ce.enrollment_date, " +
                "ce.status, " +
                "s.roll_number, " +
                "s.name AS student_name, " +
                "c.course_code, " +
                "c.title AS course_title, " +
                "c.credits, " +
                "c.fee_amount " +
                "FROM course_enrollments ce " +
                "JOIN students s " +
                "ON ce.student_id = s.id " +
                "JOIN courses c " +
                "ON ce.course_id = c.id " +
                "ORDER BY ce.id DESC";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    CourseEnrollment enrollment =
                            new CourseEnrollment();

                    enrollment.setId(
                            rs.getInt("id")
                    );

                    enrollment.setStudentId(
                            rs.getInt("student_id")
                    );

                    enrollment.setCourseId(
                            rs.getInt("course_id")
                    );

                    enrollment.setSemester(
                            rs.getString("semester")
                    );

                    if (rs.getDate("enrollment_date") != null) {

                        enrollment.setEnrollmentDate(
                                rs.getDate("enrollment_date")
                                        .toLocalDate()
                        );
                    }

                    enrollment.setStatus(
                            rs.getString("status")
                    );

                    enrollment.setRollNumber(
                            rs.getString("roll_number")
                    );

                    enrollment.setStudentName(
                            rs.getString("student_name")
                    );

                    enrollment.setCourseCode(
                            rs.getString("course_code")
                    );

                    enrollment.setCourseTitle(
                            rs.getString("course_title")
                    );

                    enrollment.setCredits(
                            rs.getInt("credits")
                    );

                    enrollment.setFeeAmount(
                            rs.getDouble("fee_amount")
                    );

                    return enrollment;
                }
        );
    }


    // Approve pending enrollment
    public int approveEnrollment(int enrollmentId) {

        String sql =
                "UPDATE course_enrollments " +
                "SET status = 'Enrolled' " +
                "WHERE id = ? " +
                "AND status = 'Pending'";

        return jdbcTemplate.update(
                sql,
                enrollmentId
        );
    }


    // Drop enrolled course
    public int dropEnrollment(int enrollmentId) {

        String sql =
                "UPDATE course_enrollments " +
                "SET status = 'Dropped' " +
                "WHERE id = ? " +
                "AND status = 'Enrolled'";

        return jdbcTemplate.update(
                sql,
                enrollmentId
        );
    }
}