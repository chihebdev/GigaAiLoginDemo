package com.gigaai.model;

public class User {
    private String fullName;
    private int storage;
    private int bandwidth;
    private int maxFileSize;

    // Getters and setters
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public int getStorage() { return storage; }
    public void setStorage(int storage) { this.storage = storage; }

    public int getBandwidth() { return bandwidth; }
    public void setBandwidth(int bandwidth) { this.bandwidth = bandwidth; }

    public int getMaxFileSize() { return maxFileSize; }
    public void setMaxFileSize(int maxFileSize) { this.maxFileSize = maxFileSize; }
}
