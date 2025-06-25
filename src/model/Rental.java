// src/model/Rental.java
package model;

import java.util.Date;

/**
 * 租赁记录实体类
 * 表示房屋租赁的交易信息，包含关联的房屋和用户对象
 */
public class Rental {
    /** 租赁记录唯一标识 */
    private int id;
    
    /** 关联的房屋ID */
    private int houseId;
    
    /** 承租人用户名 */
    private String username;
    
    /** 租赁日期 */
    private Date rentalDate;

    /**
     * 关联的房屋对象（通过houseId关联）
     * 通过HouseDAO.findById(int)方法获取完整房屋信息
     */
    private House house;
    
    /**
     * 关联的用户对象（通过username关联）
     * 通过UserDao.findByUsername(String)方法获取用户详细信息
     */
    private User user;


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