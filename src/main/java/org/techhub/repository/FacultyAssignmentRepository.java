package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.Faculty;
import org.techhub.model.FacultyCourse;

@Repository
public class FacultyAssignmentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Get all faculty members

    public List<Faculty> getAllFaculty() {

        String sql =
                "SELECT f.id, f.name, f.email, " +
                "f.dept_id, d.dept_name " +
                "FROM faculty f " +
                "JOIN departments d " +
                "ON f.dept_id = d.id " +
                "ORDER BY f.name";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Faculty faculty =
                            new Faculty();

                    faculty.setId(
                            rs.getInt("id")
                    );

                    faculty.setName(
                            rs.getString("name")
                    );

                    faculty.setEmail(
                            rs.getString("email")
                    );

                    faculty.setDeptId(
                            rs.getInt("dept_id")
                    );

                    faculty.setDepartmentName(
                            rs.getString("dept_name")
                    );

                    return faculty;
                }
        );
    }


    // Get all courses

    public List<FacultyCourse> getAllCourses() {

        String sql =
                "SELECT id, course_code, title " +
                "FROM courses " +
                "ORDER BY course_code";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    FacultyCourse course =
                            new FacultyCourse();

                    course.setCourseId(
                            rs.getInt("id")
                    );

                    course.setCourseCode(
                            rs.getString("course_code")
                    );

                    course.setCourseTitle(
                            rs.getString("title")
                    );

                    return course;
                }
        );
    }


    // Assign course to faculty

    public int assignCourse(
            int facultyId,
            int courseId,
            String semester) {

        String sql =
                "INSERT INTO faculty_courses " +
                "(faculty_id, course_id, semester) " +
                "VALUES (?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                facultyId,
                courseId,
                semester
        );
    }
}