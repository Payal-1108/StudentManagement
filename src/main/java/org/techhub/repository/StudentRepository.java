package org.techhub.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import org.techhub.model.Student;

@Repository
public class StudentRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Get all students
    public List<Student> getAllStudents() {

        String sql =
                "SELECT s.id, s.roll_number, s.name, s.email, " +
                "s.dept_id, s.current_semester, s.password, " +
                "d.dept_name " +
                "FROM students s " +
                "JOIN departments d ON s.dept_id = d.id";

        return jdbcTemplate.query(sql, (rs, rowNum) -> {

            Student student = new Student();

            student.setId(rs.getInt("id"));
            student.setRollNumber(rs.getString("roll_number"));
            student.setName(rs.getString("name"));
            student.setEmail(rs.getString("email"));
            student.setDeptId(rs.getInt("dept_id"));
            student.setCurrentSemester(
                    rs.getInt("current_semester")
            );
            student.setPassword(
                    rs.getString("password")
            );
            student.setDepartmentName(
                    rs.getString("dept_name")
            );

            return student;
        });
    }

    // Get student by ID
    public Student getStudentById(int id) {

        String sql =
                "SELECT s.id, s.roll_number, s.name, s.email, " +
                "s.dept_id, s.current_semester, s.password, " +
                "d.dept_name " +
                "FROM students s " +
                "JOIN departments d ON s.dept_id = d.id " +
                "WHERE s.id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                (rs, rowNum) -> {

                    Student student = new Student();

                    student.setId(rs.getInt("id"));
                    student.setRollNumber(
                            rs.getString("roll_number")
                    );
                    student.setName(
                            rs.getString("name")
                    );
                    student.setEmail(
                            rs.getString("email")
                    );
                    student.setDeptId(
                            rs.getInt("dept_id")
                    );
                    student.setCurrentSemester(
                            rs.getInt("current_semester")
                    );
                    student.setPassword(
                            rs.getString("password")
                    );
                    student.setDepartmentName(
                            rs.getString("dept_name")
                    );

                    return student;
                },
                id
        );
    }

    // Add student
    public void addStudent(Student student) {

        String sql =
                "INSERT INTO students " +
                "(roll_number, name, email, dept_id, " +
                "current_semester, password) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(
                sql,
                student.getRollNumber(),
                student.getName(),
                student.getEmail(),
                student.getDeptId(),
                student.getCurrentSemester(),
                student.getPassword()
        );
    }

    // Update student
    public void updateStudent(Student student) {

        String sql =
                "UPDATE students SET " +
                "roll_number = ?, " +
                "name = ?, " +
                "email = ?, " +
                "dept_id = ?, " +
                "current_semester = ?, " +
                "password = ? " +
                "WHERE id = ?";

        jdbcTemplate.update(
                sql,
                student.getRollNumber(),
                student.getName(),
                student.getEmail(),
                student.getDeptId(),
                student.getCurrentSemester(),
                student.getPassword(),
                student.getId()
        );
    }

    // Delete student
    public void deleteStudent(int id) {

        String sql =
                "DELETE FROM students WHERE id = ?";

        jdbcTemplate.update(sql, id);
    }

    // Student login
    public Student login(String email, String password) {

        String sql =
                "SELECT s.id, s.roll_number, s.name, s.email, " +
                "s.dept_id, s.current_semester, s.password, " +
                "d.dept_name " +
                "FROM students s " +
                "JOIN departments d ON s.dept_id = d.id " +
                "WHERE s.email = ? AND s.password = ?";

        List<Student> students =
                jdbcTemplate.query(
                        sql,
                        (rs, rowNum) -> {

                            Student student =
                                    new Student();

                            student.setId(
                                    rs.getInt("id")
                            );

                            student.setRollNumber(
                                    rs.getString("roll_number")
                            );

                            student.setName(
                                    rs.getString("name")
                            );

                            student.setEmail(
                                    rs.getString("email")
                            );

                            student.setDeptId(
                                    rs.getInt("dept_id")
                            );

                            student.setCurrentSemester(
                                    rs.getInt("current_semester")
                            );

                            student.setPassword(
                                    rs.getString("password")
                            );

                            student.setDepartmentName(
                                    rs.getString("dept_name")
                            );

                            return student;
                        },
                        email,
                        password
                );

        if (students.isEmpty()) {
            return null;
        }

        return students.get(0);
    }
    public List<Student> searchStudents(String keyword) {

        String sql =
                "SELECT s.id, s.roll_number, s.name, s.email, " +
                "s.dept_id, s.current_semester, s.password, " +
                "d.dept_name " +
                "FROM students s " +
                "JOIN departments d " +
                "ON s.dept_id = d.id " +
                "WHERE s.roll_number LIKE ? " +
                "OR s.name LIKE ? " +
                "ORDER BY s.name";

        String searchKeyword = "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Student student = new Student();

                    student.setId(
                            rs.getInt("id")
                    );

                    student.setRollNumber(
                            rs.getString("roll_number")
                    );

                    student.setName(
                            rs.getString("name")
                    );

                    student.setEmail(
                            rs.getString("email")
                    );

                    student.setDeptId(
                            rs.getInt("dept_id")
                    );

                    student.setCurrentSemester(
                            rs.getInt("current_semester")
                    );

                    student.setPassword(
                            rs.getString("password")
                    );

                    student.setDepartmentName(
                            rs.getString("dept_name")
                    );

                    return student;
                },
                searchKeyword,
                searchKeyword
        );
    }
}