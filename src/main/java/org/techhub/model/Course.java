package org.techhub.model;

public class Course {

    private int id;
    private String courseCode;
    private String title;
    private int credits;
    private int deptId;
    private int capacity;
    private double feeAmount;

    // Prerequisite course
    private Integer prerequisiteCourseId;

    // Department name for displaying in course list
    private String departmentName;

    // Seat availability
    private int enrolledSeats;
    private int availableSeats;


    public Course() {
    }


    public Course(
            int id,
            String courseCode,
            String title,
            int credits,
            int deptId,
            int capacity,
            double feeAmount) {

        this.id = id;
        this.courseCode = courseCode;
        this.title = title;
        this.credits = credits;
        this.deptId = deptId;
        this.capacity = capacity;
        this.feeAmount = feeAmount;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }


    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }


    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }


    public double getFeeAmount() {
        return feeAmount;
    }

    public void setFeeAmount(double feeAmount) {
        this.feeAmount = feeAmount;
    }


    // =========================================
    // PREREQUISITE COURSE
    // =========================================

    public Integer getPrerequisiteCourseId() {
        return prerequisiteCourseId;
    }

    public void setPrerequisiteCourseId(Integer prerequisiteCourseId) {
        this.prerequisiteCourseId = prerequisiteCourseId;
    }


    // =========================================
    // DEPARTMENT
    // =========================================

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }


    // =========================================
    // SEAT AVAILABILITY
    // =========================================

    public int getEnrolledSeats() {
        return enrolledSeats;
    }

    public void setEnrolledSeats(int enrolledSeats) {
        this.enrolledSeats = enrolledSeats;
    }


    public int getAvailableSeats() {
        return availableSeats;
    }

    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }
}