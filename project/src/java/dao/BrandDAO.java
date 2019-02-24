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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Brand;

public class BrandDAO {

    // get danh sách thể loại
    public ArrayList<Brand> getListBrand() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM brands";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Brand> list = new ArrayList<>();
        while (rs.next()) {
            Brand brand = new Brand();
            brand.setBrandID(rs.getLong("brand_id"));
            brand.setBrandName(rs.getString("brand_name"));
            brand.setBrandImage(rs.getString("brand_img"));
            list.add(brand);
        }
        return list;
    }

    // thêm mới dữ liệu
    public boolean insert(Brand c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO brands (`brand_name`,`brand_img`) VALUES(?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);      
            ps.setString(1, c.getBrandName());
            ps.setString(2, c.getBrandImage());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean update(Brand c) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE brands SET brand_name = ?,brand_img = ? WHERE brand_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getBrandName());
            ps.setString(2, c.getBrandImage());
            ps.setLong(3, c.getBrandID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean delete(long brand_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM brands WHERE brand_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, brand_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(BrandDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public Brand getBrand(int brandID) {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM brands WHERE brand_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, brandID);
            ResultSet rs = ps.executeQuery();
            Brand u = new Brand();
            while (rs.next()) {
                u.setBrandID(rs.getInt("brand_id"));
                u.setBrandName(rs.getString("brand_name"));
                u.setBrandImage(rs.getString("brand_img"));
         
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void main(String[] args) throws SQLException {
        BrandDAO dao = new BrandDAO();
//        for (int i = 1; i < 10; i++) {
//            dao.insertCategory(new Category(i, "Category " + i));
//        }
//        System.out.println(dao.updateCategory(new Category(8, "Tùng Dương")));
//        System.out.println(dao.delete(7));
    }
    
}
