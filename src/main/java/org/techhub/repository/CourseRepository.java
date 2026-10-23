package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.Course;

@Repository
public class CourseRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;


    // =========================================
    // GET ALL COURSES
    // =========================================

    public List<Course> getAllCourses() {

        String sql =
                "SELECT c.id, c.course_code, c.title, " +
                "c.credits, c.dept_id, c.capacity, " +
                "c.fee_amount, c.prerequisite_course_id, " +
                "d.dept_name, " +
                "COUNT(ce.id) AS enrolled_seats " +
                "FROM courses c " +
                "JOIN departments d " +
                "ON c.dept_id = d.id " +
                "LEFT JOIN course_enrollments ce " +
                "ON c.id = ce.course_id " +
                "AND ce.status = 'Enrolled' " +
                "GROUP BY c.id, c.course_code, c.title, " +
                "c.credits, c.dept_id, c.capacity, " +
                "c.fee_amount, c.prerequisite_course_id, " +
                "d.dept_name " +
                "ORDER BY c.course_code";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            Course course = new Course();

            course.setId(rs.getInt("id"));
            course.setCourseCode(rs.getString("course_code"));
            course.setTitle(rs.getString("title"));
            course.setCredits(rs.getInt("credits"));
            course.setDeptId(rs.getInt("dept_id"));
            course.setCapacity(rs.getInt("capacity"));
            course.setFeeAmount(rs.getDouble("fee_amount"));

            int prerequisiteId = rs.getInt("prerequisite_course_id");

            if (rs.wasNull()) {
                course.setPrerequisiteCourseId(null);
            } else {
                course.setPrerequisiteCourseId(prerequisiteId);
            }

            course.setDepartmentName(rs.getString("dept_name"));

            int enrolledSeats = rs.getInt("enrolled_seats");

            course.setEnrolledSeats(enrolledSeats);
            course.setAvailableSeats(
                    course.getCapacity() - enrolledSeats
            );

            return course;
        });
    }


    // =========================================
    // GET COURSE BY ID
    // =========================================

    public Course getCourseById(int id) {

        String sql =
                "SELECT c.id, c.course_code, c.title, " +
                "c.credits, c.dept_id, c.capacity, " +
                "c.fee_amount, c.prerequisite_course_id, " +
                "d.dept_name, " +
                "COUNT(ce.id) AS enrolled_seats " +
                "FROM courses c " +
                "JOIN departments d " +
                "ON c.dept_id = d.id " +
                "LEFT JOIN course_enrollments ce " +
                "ON c.id = ce.course_id " +
                "AND ce.status = 'Enrolled' " +
                "WHERE c.id = ? " +
                "GROUP BY c.id, c.course_code, c.title, " +
                "c.credits, c.dept_id, c.capacity, " +
                "c.fee_amount, c.prerequisite_course_id, " +
                "d.dept_name";

        return jdbcTemplate.queryForObject(
                sql,
                (rs, rowNum) -> {

                    Course course = new Course();

                    course.setId(rs.getInt("id"));
                    course.setCourseCode(
                            rs.getString("course_code")
                    );
                    course.setTitle(
                            rs.getString("title")
                    );
                    course.setCredits(
                            rs.getInt("credits")
                    );
                    course.setDeptId(
                            rs.getInt("dept_id")
                    );
                    course.setCapacity(
                            rs.getInt("capacity")
                    );
                    course.setFeeAmount(
                            rs.getDouble("fee_amount")
                    );

                    int prerequisiteId =
                            rs.getInt("prerequisite_course_id");

                    if (rs.wasNull()) {
                        course.setPrerequisiteCourseId(null);
                    } else {
                        course.setPrerequisiteCourseId(
                                prerequisiteId
                        );
                    }

                    course.setDepartmentName(
                            rs.getString("dept_name")
                    );

                    int enrolledSeats =
                            rs.getInt("enrolled_seats");

                    course.setEnrolledSeats(
                            enrolledSeats
                    );

                    course.setAvailableSeats(
                            course.getCapacity()
                                    - enrolledSeats
                    );

                    return course;
                },
                id
        );
    }


    // =========================================
    // ADD COURSE
    // =========================================

    public int addCourse(Course course) {

        String sql =
                "INSERT INTO courses " +
                "(course_code, title, credits, dept_id, " +
                "capacity, fee_amount, prerequisite_course_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                course.getCourseCode(),
                course.getTitle(),
                course.getCredits(),
                course.getDeptId(),
                course.getCapacity(),
                course.getFeeAmount(),
                course.getPrerequisiteCourseId()
        );
    }


    // =========================================
    // UPDATE COURSE
    // =========================================

    public int updateCourse(Course course) {

        String sql =
                "UPDATE courses " +
                "SET course_code = ?, " +
                "title = ?, " +
                "credits = ?, " +
                "dept_id = ?, " +
                "capacity = ?, " +
                "fee_amount = ?, " +
                "prerequisite_course_id = ? " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                course.getCourseCode(),
                course.getTitle(),
                course.getCredits(),
                course.getDeptId(),
                course.getCapacity(),
                course.getFeeAmount(),
                course.getPrerequisiteCourseId(),
                course.getId()
        );
    }


    // =========================================
    // DELETE COURSE
    // =========================================

    public int deleteCourse(int id) {

        String sql =
                "DELETE FROM courses WHERE id = ?";

        return jdbcTemplate.update(sql, id);
    }


    // =========================================
    // GET AVAILABLE COURSES
    // =========================================

    public List<Course> getAvailableCourses() {

        String sql =
                "SELECT c.id, c.course_code, c.title, " +
                "c.credits, c.dept_id, c.capacity, " +
                "c.fee_amount, c.prerequisite_course_id, " +
                "d.dept_name, " +
                "COUNT(ce.id) AS enrolled_seats " +
                "FROM courses c " +
                "JOIN departments d " +
                "ON c.dept_id = d.id " +
                "LEFT JOIN course_enrollments ce " +
                "ON c.id = ce.course_id " +
                "AND ce.status = 'Enrolled' " +
                "GROUP BY c.id, c.course_code, c.title, " +
                "c.credits, c.dept_id, c.capacity, " +
                "c.fee_amount, c.prerequisite_course_id, " +
                "d.dept_name " +
                "HAVING COUNT(ce.id) < c.capacity " +
                "ORDER BY c.course_code";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            Course course = new Course();

            course.setId(rs.getInt("id"));
            course.setCourseCode(
                    rs.getString("course_code")
            );
            course.setTitle(
                    rs.getString("title")
            );
            course.setCredits(
                    rs.getInt("credits")
            );
            course.setDeptId(
                    rs.getInt("dept_id")
            );
            course.setCapacity(
                    rs.getInt("capacity")
            );
            course.setFeeAmount(
                    rs.getDouble("fee_amount")
            );

            int prerequisiteId =
                    rs.getInt("prerequisite_course_id");

            if (rs.wasNull()) {
                course.setPrerequisiteCourseId(null);
            } else {
                course.setPrerequisiteCourseId(
                        prerequisiteId
                );
            }

            course.setDepartmentName(
                    rs.getString("dept_name")
            );

            int enrolledSeats =
                    rs.getInt("enrolled_seats");

            course.setEnrolledSeats(
                    enrolledSeats
            );

            course.setAvailableSeats(
                    course.getCapacity()
                            - enrolledSeats
            );

            return course;
        });
    }
}