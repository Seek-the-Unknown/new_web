// src/model/Rental.java
package model;

import java.util.Date;

public class Rental {
    private int id;
    private int houseId;
    private String username;
    private Date rentalDate;

    // 可以额外加入House和User对象，以便在页面上显示更丰富的信息
    private House house;
    private User user;

    // 构造函数、Getter和Setter...
    public Rental() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getHouseId() { return houseId; }
    public void setHouseId(int houseId) { this.houseId = houseId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public Date getRentalDate() { return rentalDate; }
    public void setRentalDate(Date rentalDate) { this.rentalDate = rentalDate; }
    public House getHouse() { return house; }
    public void setHouse(House house) { this.house = house; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}