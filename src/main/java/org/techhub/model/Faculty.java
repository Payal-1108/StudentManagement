package org.techhub.model;

public class Faculty {

    private int id;

    private String name;

    private String email;

    private String password;

    private int deptId;

    private String departmentName;


    // Default constructor
    public Faculty() {

    }


    // Constructor
    public Faculty(int id, String name, String email,
                   String password, int deptId,
                   String departmentName) {

        this.id = id;

        this.name = name;

        this.email = email;

        this.password = password;

        this.deptId = deptId;

        this.departmentName = departmentName;
    }


    // Get ID
    public int getId() {

        return id;
    }


    // Set ID
    public void setId(int id) {

        this.id = id;
    }


    // Get Name
    public String getName() {

        return name;
    }


    // Set Name
    public void setName(String name) {

        this.name = name;
    }


    // Get Email
    public String getEmail() {

        return email;
    }


    // Set Email
    public void setEmail(String email) {

        this.email = email;
    }


    // Get Password
    public String getPassword() {

        return password;
    }


    // Set Password
    public void setPassword(String password) {

        this.password = password;
    }


    // Get Department ID
    public int getDeptId() {

        return deptId;
    }


    // Set Department ID
    public void setDeptId(int deptId) {

        this.deptId = deptId;
    }


    // Get Department Name
    public String getDepartmentName() {

        return departmentName;
    }


    // Set Department Name
    public void setDepartmentName(String departmentName) {

        this.departmentName = departmentName;
    }

}