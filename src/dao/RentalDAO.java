// src/dao/RentalDAO.java
package dao;

import model.Rental;
import java.util.List;

/**
 * 租赁记录数据访问接口
 * 定义租赁信息的持久化操作方法
 */
public interface RentalDAO {
    
    /**
     * 添加新的租赁记录
     * @param rental 要添加的租赁对象
     */
    void addRental(Rental rental);
    
    /**
     * 获取所有租赁记录
     * @return 租赁记录列表
     */
    List<Rental> getAllRentals();
}