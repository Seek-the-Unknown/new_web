//package model;
//
//import java.time.LocalDateTime;
//
//public class House {
//
//    private int id;
//    private String title;
//    private String houseType;
//    private double price;
//    private int bedrooms;
//    private String city;
//    private String address;
//    private String description;
//    private String imagePaths;
//    private String username;
//    private LocalDateTime postDate;
//    private int bathrooms;
//
//    // 必须提供一个无参构造函数
//    public House() {
//    }
//
//    // --- 为所有属性生成 Getter 和 Setter ---
//
//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getTitle() {
//        return title;
//    }
//
//    public void setTitle(String title) {
//        this.title = title;
//    }
//
//    public String getHouseType() {
//        return houseType;
//    }
//
//    public void setHouseType(String houseType) {
//        this.houseType = houseType;
//    }
//
//    public double getPrice() {
//        return price;
//    }
//
//    public void setPrice(double price) {
//        this.price = price;
//    }
//
//    public int getBedrooms() {
//        return bedrooms;
//    }
//
//    public void setBedrooms(int bedrooms) {
//        this.bedrooms = bedrooms;
//    }
//
//    public String getCity() {
//        return city;
//    }
//
//    public void setCity(String city) {
//        this.city = city;
//    }
//
//    public String getAddress() {
//        return address;
//    }
//
//    public void setAddress(String address) {
//        this.address = address;
//    }
//
//    public String getDescription() {
//        return description;
//    }
//
//    public void setDescription(String description) {
//        this.description = description;
//    }
//
//    public String getImagePaths() {
//        return imagePaths;
//    }
//
//    public void setImagePaths(String imagePaths) {
//        this.imagePaths = imagePaths;
//    }
//
//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username;
//    }
//
//    public LocalDateTime getPostDate() {
//        return postDate;
//    }
//
//    public void setPostDate(LocalDateTime postDate) {
//        this.postDate = postDate;
//    }
//    public int getBathrooms() {
//        return bathrooms;
//    }
//
//    public void setBathrooms(int bathrooms) {
//        this.bathrooms = bathrooms;
//    }
//}
package model;

import java.time.LocalDateTime;

public class House {

    private int id;
    private String title;
    private String houseType;
    private double price;
    private int bedrooms;
    private int bathrooms; // 已有
    private double area; // <-- 新增：房屋面积
    private String city;
    private String address;
    private String description;
    private String imagePaths;
    private String username;
    private LocalDateTime postDate;
    private boolean isRented; // <-- 新增：是否已租状态

    // 必须提供一个无参构造函数
    public House() {
    }

    // --- 所有属性的 Getter 和 Setter ---

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getBedrooms() {
        return bedrooms;
    }

    public void setBedrooms(int bedrooms) {
        this.bedrooms = bedrooms;
    }

    public int getBathrooms() {
        return bathrooms;
    }

    public void setBathrooms(int bathrooms) {
        this.bathrooms = bathrooms;
    }

    // area 的 getter 和 setter
    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePaths() {
        return imagePaths;
    }

    public void setImagePaths(String imagePaths) {
        this.imagePaths = imagePaths;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public LocalDateTime getPostDate() {
        return postDate;
    }

    public void setPostDate(LocalDateTime postDate) {
        this.postDate = postDate;
    }

    // isRented 的 getter 和 setter
    // 对于 boolean 类型，getter通常命名为 is...
    public boolean isRented() {
        return isRented;
    }

    public void setRented(boolean rented) {
        isRented = rented;
    }

    public void setPostDate(java.sql.Timestamp timestamp) {
        if (timestamp != null) {
            this.postDate = timestamp.toLocalDateTime();
        }
    }
}