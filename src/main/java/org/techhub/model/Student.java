package org.techhub.model;

public class Student {

    private int id;
    private String rollNumber;
    private String name;
    private String email;
    private int deptId;
    private int currentSemester;
    private String password;
    private String departmentName;

    public Student() {
    }

    public Student(int id, String rollNumber, String name,
                   String email, int deptId,
                   int currentSemester, String password,
                   String departmentName) {

        this.id = id;
        this.rollNumber = rollNumber;
        this.name = name;
        this.email = email;
        this.deptId = deptId;
        this.currentSemester = currentSemester;
        this.password = password;
        this.departmentName = departmentName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRollNumber() {
        return rollNumber;
    }

    public void setRollNumber(String rollNumber) {
        this.rollNumber = rollNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public int getCurrentSemester() {
        return currentSemester;
    }

    public void setCurrentSemester(int currentSemester) {
        this.currentSemester = currentSemester;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
}