package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.CourseEnrollment;

@Repository
public class CourseEnrollmentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================
    // ENROLL STUDENT IN COURSE
    // =========================================

    public int enrollStudent(CourseEnrollment enrollment) {

        String sql =
                "INSERT INTO course_enrollments " +
                "(student_id, course_id, semester, enrollment_date, status) " +
                "SELECT ?, ?, ?, CURDATE(), 'Enrolled' " +
                "FROM courses c " +
                "WHERE c.id = ? " +
                "AND ( " +
                "    SELECT COUNT(*) " +
                "    FROM course_enrollments ce " +
                "    WHERE ce.course_id = c.id " +
                "    AND ce.status = 'Enrolled' " +
                ") < c.capacity";

        return jdbcTemplate.update(
                sql,
                enrollment.getStudentId(),
                enrollment.getCourseId(),
                enrollment.getSemester(),
                enrollment.getCourseId()
        );
    }


    // =========================================
    // CHECK WHETHER STUDENT ALREADY ENROLLED
    // =========================================

    public boolean isAlreadyEnrolled(
            int studentId,
            int courseId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM course_enrollments " +
                "WHERE student_id = ? " +
                "AND course_id = ? " +
                "AND status = 'Enrolled'";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        studentId,
                        courseId
                );

        return count != null && count > 0;
    }


    // =========================================
    // GET STUDENT ENROLLMENTS
    // =========================================

    public List<CourseEnrollment> getStudentEnrollments(
            int studentId) {

        String sql =
                "SELECT ce.id, " +
                "ce.student_id, " +
                "ce.course_id, " +
                "ce.semester, " +
                "ce.enrollment_date, " +
                "ce.status, " +
                "c.course_code, " +
                "c.title, " +
                "c.credits, " +
                "c.fee_amount " +
                "FROM course_enrollments ce " +
                "JOIN courses c " +
                "ON ce.course_id = c.id " +
                "WHERE ce.student_id = ? " +
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

                    enrollment.setEnrollmentDate(
                            rs.getDate("enrollment_date")
                                    .toLocalDate()
                    );

                    enrollment.setStatus(
                            rs.getString("status")
                    );

                    enrollment.setCourseCode(
                            rs.getString("course_code")
                    );

                    enrollment.setCourseTitle(
                            rs.getString("title")
                    );

                    enrollment.setCredits(
                            rs.getInt("credits")
                    );

                    enrollment.setFeeAmount(
                            rs.getDouble("fee_amount")
                    );

                    return enrollment;
                },
                studentId
        );
    }


    // =========================================
    // DROP COURSE
    // =========================================

    public int dropCourse(int enrollmentId) {

        String sql =
                "UPDATE course_enrollments " +
                "SET status = 'Dropped' " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                enrollmentId
        );
    }
    public boolean hasCompletedPrerequisite(int studentId, int courseId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM courses c " +
                "WHERE c.id = ? " +
                "AND (c.prerequisite_course_id IS NULL " +
                "OR EXISTS (" +
                "    SELECT 1 " +
                "    FROM course_enrollments ce " +
                "    WHERE ce.student_id = ? " +
                "    AND ce.course_id = c.prerequisite_course_id " +
                "    AND ce.status = 'Enrolled'" +
                "))";

        Integer count = jdbcTemplate.queryForObject(
                sql,
                Integer.class,
                courseId,
                studentId
        );

        return count != null && count > 0;
    }

}