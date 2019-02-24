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
import model.Advertisement;

public class AdvertisementDAO {

    // get danh sách thể loại
    public ArrayList<Advertisement> getListAdvertisement() throws SQLException {
        Connection connection = DBConnect.getConnection();
        String sql = "SELECT * FROM advertisement";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Advertisement> list = new ArrayList<>();
        while (rs.next()) {
            Advertisement advertisement = new Advertisement();
            advertisement.setAdvertisementID(rs.getLong("ad_id"));
            advertisement.setAdvertisementName(rs.getString("ad_name"));
            advertisement.setAdvertisementImage(rs.getString("ad_img"));
            advertisement.setAdvertisementUrl(rs.getString("ad_url"));
            advertisement.setAdvertisementCompany(rs.getString("ad_company"));
            list.add(advertisement);
        }
        return list;
    }

    // thêm mới dữ liệu
    public boolean insert(Advertisement c) {
        Connection connection = DBConnect.getConnection();
        String sql = "INSERT INTO advertisement (`ad_name`,`ad_img`,`ad_url`,`ad_company`) VALUES(?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);      
            ps.setString(1, c.getAdvertisementName());
            ps.setString(2, c.getAdvertisementImage());
            ps.setString(3, c.getAdvertisementUrl());
            ps.setString(4, c.getAdvertisementCompany());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // cập nhật dữ liệu
    public boolean update(Advertisement c) {
        Connection connection = DBConnect.getConnection();
        String sql = "UPDATE advertisement SET ad_name = ?,ad_img = ?,ad_url = ?,ad_company = ? WHERE ad_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getAdvertisementName());
            ps.setString(2, c.getAdvertisementImage());
            ps.setString(3, c.getAdvertisementUrl());
            ps.setString(4, c.getAdvertisementCompany());
            ps.setLong(5, c.getAdvertisementID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // xóa dữ liệu
    public boolean delete(long ad_id) {
        Connection connection = DBConnect.getConnection();
        String sql = "DELETE FROM advertisement WHERE ad_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, ad_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(AdvertisementDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
     public Advertisement getAd(int adID) {
        try {
            Connection connection = DBConnect.getConnection();
            String sql = "SELECT * FROM advertisement WHERE ad_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setInt(1, adID);
            ResultSet rs = ps.executeQuery();
            Advertisement u = new Advertisement();
            while (rs.next()) {
                u.setAdvertisementID(rs.getInt("ad_id"));
                u.setAdvertisementName(rs.getString("ad_name"));
                u.setAdvertisementImage(rs.getString("ad_img"));
                u.setAdvertisementUrl(rs.getString("ad_url"));
                u.setAdvertisementCompany(rs.getString("ad_company"));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) throws SQLException {
        AdvertisementDAO dao = new AdvertisementDAO();
//        for (int i = 1; i < 10; i++) {
//            dao.insertCategory(new Category(i, "Category " + i));
//        }
//        System.out.println(dao.updateCategory(new Category(8, "Tùng Dương")));
//        System.out.println(dao.delete(7));
    }
    
}
