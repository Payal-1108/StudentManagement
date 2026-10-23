package org.techhub.model;

import java.time.LocalDate;

public class CourseEnrollment {

    private int id;
    private int studentId;
    private int courseId;
    private String semester;
    private LocalDate enrollmentDate;
    private String status;

    private String courseCode;
    private String courseTitle;
    private int credits;
    private double feeAmount;

    // Used for Admin Enrollment Management
    private String rollNumber;
    private String studentName;

    public CourseEnrollment() {
    }

    public CourseEnrollment(
            int id,
            int studentId,
            int courseId,
            String semester,
            LocalDate enrollmentDate,
            String status,
            String courseCode,
            String courseTitle,
            int credits,
            double feeAmount) {

        this.id = id;
        this.studentId = studentId;
        this.courseId = courseId;
        this.semester = semester;
        this.enrollmentDate = enrollmentDate;
        this.status = status;
        this.courseCode = courseCode;
        this.courseTitle = courseTitle;
        this.credits = credits;
        this.feeAmount = feeAmount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public LocalDate getEnrollmentDate() {
        return enrollmentDate;
    }

    public void setEnrollmentDate(LocalDate enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public double getFeeAmount() {
        return feeAmount;
    }

    public void setFeeAmount(double feeAmount) {
        this.feeAmount = feeAmount;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
}