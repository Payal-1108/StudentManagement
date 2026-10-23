package org.techhub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.techhub.model.Student;
import org.techhub.repository.StudentRepository;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    // Get all students
    public List<Student> getAllStudents() {
        return studentRepository.getAllStudents();
    }

    // Get student by ID
    public Student getStudentById(int id) {
        return studentRepository.getStudentById(id);
    }

    // Add student
    public void addStudent(Student student) {
        studentRepository.addStudent(student);
    }

    // Update student
    public void updateStudent(Student student) {
        studentRepository.updateStudent(student);
    }

    // Delete student
    public void deleteStudent(int id) {
        studentRepository.deleteStudent(id);
    }

    // Student login
    public Student login(String email, String password) {
        return studentRepository.login(email, password);
    }
    public List<Student> searchStudents(String keyword) {

        return studentRepository.searchStudents(keyword);
    }
}