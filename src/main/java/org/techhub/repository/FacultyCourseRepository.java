package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.FacultyCourse;

@Repository
public class FacultyCourseRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<FacultyCourse> getAssignedCourses(int facultyId) {

        String sql =
                "SELECT fc.id, " +
                "fc.faculty_id, " +
                "fc.course_id, " +
                "c.course_code, " +
                "c.title, " +
                "fc.semester " +
                "FROM faculty_courses fc " +
                "JOIN courses c " +
                "ON fc.course_id = c.id " +
                "WHERE fc.faculty_id = ? " +
                "ORDER BY c.course_code";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    FacultyCourse course =
                            new FacultyCourse();

                    course.setId(
                            rs.getInt("id")
                    );

                    course.setFacultyId(
                            rs.getInt("faculty_id")
                    );

                    course.setCourseId(
                            rs.getInt("course_id")
                    );

                    course.setCourseCode(
                            rs.getString("course_code")
                    );

                    course.setCourseTitle(
                            rs.getString("title")
                    );

                    course.setSemester(
                            rs.getString("semester")
                    );

                    return course;
                },
                facultyId
        );
    }
}