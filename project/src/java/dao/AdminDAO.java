/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

/**
 *
 * @author Kid
 */
public class AdminDAO {

    public ArrayList<Admin> getListAdmin() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM admin";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Admin> list = new ArrayList<>();
        while (rs.next()) {
            Admin admin = new Admin();
            admin.setAdmin_id(rs.getInt("admin_id"));
            admin.setAdmin_fullname(rs.getString("admin_fullname"));
            admin.setAdmin_email(rs.getString("admin_email"));
            admin.setRole(rs.getInt("role"));
            list.add(admin);
        }
        return list;
    }
    public static List<Admin> getAdminByID(int admin_id) throws SQLException { 
        Connection connection = DBConnect.getConnection();    
        List<Admin> ls= new LinkedList<>();
        String sql = "SELECT * FROM admin  WHERE admin_id = '" + admin_id + "'";    
        try{
        PreparedStatement ps = connection.prepareCall(sql);      
        ResultSet rs = ps.executeQuery();     
            while (rs.next()) {
                Admin a = new Admin(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6));
                ls.add(a);
            }
        }catch(SQLException ex){
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    } 

    public boolean checkEmail(String email) {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM admin WHERE admin_email = '" + email + "'";
        PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // phương thức thêm tài khoản
    public boolean insert(Admin u) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO admin( `admin_fullname`, `admin_email`, `admin_pass`,`admin_emailPass`,`role`) VALUES (?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, u.getAdmin_fullname());
            ps.setString(2, u.getAdmin_email());
            ps.setString(3, u.getAdmin_pass());
            ps.setString(4, u.getAdmin_emailPass());
            ps.setInt(5, u.getRole());
            return ps.executeUpdate() == 1;

        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean update(Admin c) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE admin SET admin_fullname = ? ,admin_email =? , admin_pass=? , admin_emailPass=?,role=? WHERE admin_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getAdmin_fullname());
            ps.setString(2, c.getAdmin_email());
            ps.setString(3, c.getAdmin_pass());
            ps.setString(4, c.getAdmin_emailPass());
            ps.setLong(5, c.getRole());
            ps.setLong(6, c.getAdmin_id());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean delete(long admin_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM admin WHERE admin_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, admin_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // kiểm tra đăng nhập
    public Admin login(String email, String password) {
        Connection con = DBConnect.getConnection();
        String sql = "select * from admin where admin_email='" + email + "' and admin_pass='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin u = new Admin();
                u.setAdmin_fullname(rs.getString("admin_fullname"));
                u.setAdmin_email(rs.getString("admin_email"));
                u.setAdmin_pass(rs.getString("admin_pass"));
      
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Admin getAdmin(int adminID) {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM admin WHERE admin_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, adminID);
            ResultSet rs = ps.executeQuery();
            Admin u = new Admin();
            while (rs.next()) {
                u.setAdmin_id(rs.getInt("admin_id"));
                u.setAdmin_fullname(rs.getString("admin_fullname"));
                u.setAdmin_email(rs.getString("admin_email"));
                u.setRole(rs.getInt("role"));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
