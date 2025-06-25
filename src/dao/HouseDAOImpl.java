package dao;

import util.DBUtil;
import model.House;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class HouseDAOImpl implements HouseDAO {

    private final QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());

    /**
     * 实现接口方法：向数据库中添加一条新的房源信息。
     * 返回类型已修改为 void。
     * SQL语句已更新，包含 area 和 is_rented 字段。
     * @param house 包含房源信息的House对象
     */
    @Override
    public void addHouse(House house) {
        // 确保数据库表houses有与模型匹配的 area 和 is_rented 列
        String sql = "INSERT INTO houses (title, house_type, price, bedrooms, bathrooms, area, city, address, description, imagePaths, username, post_date, is_rented) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            queryRunner.update(sql,
                    house.getTitle(), house.getHouseType(), house.getPrice(),
                    house.getBedrooms(), house.getBathrooms(), house.getArea(), house.getCity(),
                    house.getAddress(), house.getDescription(), house.getImagePaths(),
                    house.getUsername(), house.getPostDate(), house.isRented());
        } catch (SQLException e) {
            e.printStackTrace(); // 在生产环境中建议使用日志框架
        }
    }

    /**
     * 实现接口方法：根据房源ID从数据库中删除一条记录。
     * 返回类型已修改为 void。
     * @param houseId 要删除的房源ID
     */
    @Override
    public void deleteHouse(int houseId) {
        String sql = "DELETE FROM houses WHERE id = ?";
        try {
            queryRunner.update(sql, houseId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 实现接口方法：获取数据库中所有的房源信息。
     * 方法已从 findAllHouses 重命名为 getAllHouses。
     * @return 包含所有房源的List集合
     */
//    @Override
//    public List<House> getAllHouses() {
//        String sql = "SELECT * FROM houses ORDER BY post_date DESC";
//        try {
//            // BeanListHandler 会自动将列名（如 post_date）映射到驼峰命名的属性（postDate）
//            return queryRunner.query(sql, new BeanListHandler<>(House.class));
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return Collections.emptyList();
//        }
//    }
    @Override
    public List<House> getAllHouses() {
        // SQL语句现在直接使用数据库的原始列名
        String sql = "SELECT id, title, houseType, price, bedrooms, bathrooms, area, city, address, description, imagePaths, username, post_date, is_rented FROM houses ORDER BY post_date DESC";

        try {
            // 使用一个匿名的 AbstractListHandler 来手动处理每一行结果
            return queryRunner.query(sql, new org.apache.commons.dbutils.handlers.AbstractListHandler<House>() {
                @Override
                protected House handleRow(ResultSet rs) throws SQLException {
                    // 为每一行数据创建一个新的 House 对象
                    House house = new House();

                    // 手动将每一列的值赋给 house 对象的属性
                    house.setId(rs.getInt("id"));
                    house.setTitle(rs.getString("title"));
                    house.setHouseType(rs.getString("houseType"));
                    house.setPrice(rs.getDouble("price"));
                    house.setBedrooms(rs.getInt("bedrooms"));
                    house.setBathrooms(rs.getInt("bathrooms"));
                    house.setArea(rs.getDouble("area"));
                    house.setCity(rs.getString("city"));
                    house.setAddress(rs.getString("address"));
                    house.setDescription(rs.getString("description"));
                    house.setImagePaths(rs.getString("imagePaths"));
                    house.setUsername(rs.getString("username"));

                    // 【关键】手动处理 Timestamp 到 LocalDateTime 的转换
                    java.sql.Timestamp ts = rs.getTimestamp("post_date");
                    if (ts != null) {
                        house.setPostDate(ts.toLocalDateTime());
                    }

                    // 【关键】手动处理布尔值的映射
                    house.setRented(rs.getBoolean("is_rented"));

                    return house;
                }
            });
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    /**
     * 实现接口方法：根据地区（城市或地址）模糊搜索房源。
     * @param location 搜索的地区关键词
     * @return 匹配的房源List集合
     */
    @Override
    public List<House> searchHousesByLocation(String location) {
        String sql = "SELECT * FROM houses WHERE city LIKE ? OR address LIKE ? ORDER BY post_date DESC";
        try {
            String searchPattern = "%" + location + "%";
            return queryRunner.query(sql, new BeanListHandler<>(House.class), searchPattern, searchPattern);
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    /**
     * 实现接口方法：更新房源的出租状态。
     * @param houseId 房源ID
     * @param isRented 新的出租状态 (true 或 false)
     */
    @Override
    public void updateHouseRentalStatus(int houseId, boolean isRented) {
        String sql = "UPDATE houses SET is_rented = ? WHERE id = ?";
        try {
            queryRunner.update(sql, isRented, houseId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 实现接口方法：获取所有可用的（未出租的）房源。
     * @return 未出租房源的List集合
     */
    @Override
    public List<House> getAvailableHouses() {
        String sql = "SELECT * FROM houses WHERE is_rented = false ORDER BY post_date DESC";
        try {
            return queryRunner.query(sql, new BeanListHandler<>(House.class));
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }


    // =================================================================================
    // 以下方法不属于 HouseDAO 接口，但已在您的原始代码中实现，故予以保留。
    // 如果您的应用别处不需要它们，可以安全地移除。
    // =================================================================================

    public boolean updateHouse(House house) {
        // SQL语句已更新，包含 area 和 is_rented 字段
        String sql = "UPDATE houses SET title=?, house_type=?, price=?, bedrooms=?, bathrooms=?, area=?, city=?, address=?, description=?, imagePaths=?, is_rented=? WHERE id=?";
        try {
            int affectedRows = queryRunner.update(sql, house.getTitle(), house.getHouseType(), house.getPrice(), house.getBedrooms(),
                    house.getBathrooms(), house.getArea(), house.getCity(), house.getAddress(), house.getDescription(), house.getImagePaths(),
                    house.isRented(), house.getId());
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

//    public House findHouseById(int houseId) {
//        String sql = "SELECT * FROM houses WHERE id = ?";
//        try {
//            return queryRunner.query(sql, new BeanHandler<>(House.class), houseId);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
public House findHouseById(int houseId) {
    // SQL现在显式地命名列以避免歧义
    String sql = "SELECT id, title, houseType, price, bedrooms, bathrooms, area, city, address, description, imagePaths, username, post_date, is_rented FROM houses WHERE id = ?";
    try {
        // BeanHandler 可能对 LocalDateTime 有问题，手动映射更安全。
        return queryRunner.query(sql, rs -> {
            if (!rs.next()) {
                return null;
            }
            House house = new House();
            house.setId(rs.getInt("id"));
            house.setTitle(rs.getString("title"));
            house.setHouseType(rs.getString("houseType"));
            house.setPrice(rs.getDouble("price"));
            house.setBedrooms(rs.getInt("bedrooms"));
            house.setBathrooms(rs.getInt("bathrooms"));
            house.setArea(rs.getDouble("area"));
            house.setCity(rs.getString("city"));
            house.setAddress(rs.getString("address"));
            house.setDescription(rs.getString("description"));
            house.setImagePaths(rs.getString("imagePaths"));
            house.setUsername(rs.getString("username"));
            java.sql.Timestamp ts = rs.getTimestamp("post_date");
            if (ts != null) {
                house.setPostDate(ts.toLocalDateTime());
            }
            house.setRented(rs.getBoolean("is_rented"));
            return house;
        }, houseId);
    } catch (SQLException e) {
        e.printStackTrace();
        return null;
    }
}
    public List<House> findHousesByUsername(String username) {
        String sql = "SELECT * FROM houses WHERE username = ? ORDER BY post_date DESC";
        try {
            return queryRunner.query(sql, new BeanListHandler<>(House.class), username);
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
}