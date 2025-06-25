package dao;

import model.House;
import java.util.List;

public interface HouseDAO {
    /**
     * 向数据库中添加一条新的房源信息
     * @param house 包含房源信息的House对象
     */
    void addHouse(House house);

    /**
     * 根据房源ID从数据库中删除一条记录
     * @param houseId 要删除的房源ID
     */
    void deleteHouse(int houseId);

    /**
     * 获取数据库中所有的房源信息
     * @return 包含所有房源的List集合
     */
    List<House> getAllHouses();

    /**
     * 根据地区（城市或地址）模糊搜索房源
     * @param location 搜索的地区关键词
     * @return 匹配的房源List集合
     */
    List<House> searchHousesByLocation(String location);
    void updateHouseRentalStatus(int houseId, boolean isRented);
    List<House> getAvailableHouses();
    House findHouseById(int houseId);
}