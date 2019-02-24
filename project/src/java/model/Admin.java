/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Kid
 */
public class Admin {
    private int admin_id;
    private String admin_fullname;
    private String admin_email;
    private String admin_pass;
    private String admin_emailPass;
    private int role;

    public Admin(int admin_id, String admin_fullname, String admin_email, String admin_pass, String admin_emailPass, int role) {
        this.admin_id = admin_id;
        this.admin_fullname = admin_fullname;
        this.admin_email = admin_email;
        this.admin_pass = admin_pass;
        this.admin_emailPass = admin_emailPass;
        this.role = role;
    }
    public Admin(){}
    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_fullname() {
        return admin_fullname;
    }

    public void setAdmin_fullname(String admin_fullname) {
        this.admin_fullname = admin_fullname;
    }

    public String getAdmin_email() {
        return admin_email;
    }

    public void setAdmin_email(String admin_email) {
        this.admin_email = admin_email;
    }

    public String getAdmin_pass() {
        return admin_pass;
    }

    public void setAdmin_pass(String admin_pass) {
        this.admin_pass = admin_pass;
    }

    public String getAdmin_emailPass() {
        return admin_emailPass;
    }

    public void setAdmin_emailPass(String admin_emailPass) {
        this.admin_emailPass = admin_emailPass;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    
}
