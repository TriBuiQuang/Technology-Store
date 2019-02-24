/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author user
 */
public class Advertisement {
    private long adID;
    private String adName;
    private String adImage;
    private String adUrl;
    private String adCompany;

    public Advertisement() {
    }

    public Advertisement(long adID, String adName, String adImage, String adUrl, String adCompany) {
        this.adID = adID;
        this.adName = adName;
        this.adImage = adImage;
        this.adUrl = adUrl;
        this.adCompany = adCompany;
    }

    public long getAdvertisementID() {
        return adID;
    }

    public void setAdvertisementID(long adID) {
        this.adID = adID;
    }

    public String getAdvertisementName() {
        return adName;
    }

    public void setAdvertisementName(String adName) {
        this.adName = adName;
    }

    public String getAdvertisementImage() {
        return adImage;
    }

    public void setAdvertisementImage(String adImage) {
        this.adImage = adImage;
    }

    public String getAdvertisementUrl() {
        return adUrl;
    }

    public void setAdvertisementUrl(String adUrl) {
        this.adUrl = adUrl;
    }

    public String getAdvertisementCompany() {
        return adCompany;
    }

    public void setAdvertisementCompany(String adCompany) {
        this.adCompany = adCompany;
    }
}
