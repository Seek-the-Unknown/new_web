package dao;

import model.House; // 需要导入House和User模型
import model.User;
import model.Rental;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class RentalDAOImpl implements RentalDAO {

    private final QueryRunner queryRunner = new QueryRunner(DBUtil.getDataSource());

    /**
     * 实现接口中的 addRental 方法。
     * 注意：返回类型已从 boolean 修改为 void 以匹配接口定义。
     * @param rental 要添加的租赁记录
     */
    @Override
    public void addRental(Rental rental) {
        String sql = "INSERT INTO rentals (house_id, username, rental_date) VALUES (?, ?, ?)";
        try {
            queryRunner.update(sql,
                    rental.getHouseId(),
                    rental.getUsername(),
                    rental.getRentalDate());
        } catch (SQLException e) {
            // 在 void 方法中，通常记录异常或向上抛出自定义异常
            e.printStackTrace();
        }
    }

    /**
     * 实现接口中的 getAllRentals 方法。
     * 此方法使用 LEFT JOIN 来获取租赁信息以及关联的房屋(House)和用户(User)的完整信息。
     * DBUtils 的 BeanListHandler 可以通过别名自动映射嵌套对象。
     * @return 包含完整租赁信息（包括房屋和用户信息）的列表
     */
//    @Override
//    public List<Rental> getAllRentals() {
//        // 假设:
//        // 1. 有一个名为 'houses' 的表，主键为 'id'。
//        // 2. 有一个名为 'users' 的表，主键为 'username'。
//        // 3. House类有 setAddress, setDescription, setPrice 等方法。
//        // 4. User类有 setEmail, setGender 等方法。
//        // 列别名 "house.address" 会让 DBUtils 寻找 rental.getHouse().setAddress(...) 来赋值。
//        String sql = "SELECT " +
//                "r.id, r.house_id AS houseId, r.username, r.rental_date AS rentalDate, " +
//                "h.address AS \"house.address\", h.price AS \"house.price\", h.description AS \"house.description\", " +
//                "u.email AS \"user.email\", u.gender AS \"user.gender\" " +
//                "FROM rentals r " +
//                "LEFT JOIN houses h ON r.house_id = h.id " +
//                "LEFT JOIN users u ON r.username = u.username " +
//                "ORDER BY r.rental_date DESC";
//        try {
//            // BeanListHandler 会自动创建 Rental, House, User 对象并填充数据
//            return queryRunner.query(sql, new BeanListHandler<>(Rental.class));
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return Collections.emptyList();
//        }
//    }
    @Override
    public List<Rental> getAllRentals() {
        // 修正SQL，确保查询了所有需要的字段，为手动映射做准备
        String sql = "SELECT " +
                "r.id, r.house_id, r.username, r.rental_date, " +
                "h.title, h.price, " +
                "u.email " +
                "FROM rentals r " +
                "LEFT JOIN houses h ON r.house_id = h.id " +
                "LEFT JOIN users u ON r.username = u.username " +
                "ORDER BY r.rental_date DESC";

        try {
            // 使用 AbstractListHandler 手动处理每一行结果
            return queryRunner.query(sql, new org.apache.commons.dbutils.handlers.AbstractListHandler<Rental>() {
                @Override
                protected Rental handleRow(ResultSet rs) throws SQLException {
                    // 1. 创建所有需要的对象
                    Rental rental = new Rental();
                    House house = new House();
                    User user = new User();

                    // 2. 从ResultSet中取出数据，并填充到House和User对象中
                    house.setTitle(rs.getString("title"));
                    house.setPrice(rs.getDouble("price"));

                    user.setUsername(rs.getString("username")); // u.username和r.username是一样的
                    user.setEmail(rs.getString("email"));

                    // 3. 填充Rental对象本身的属性
                    rental.setId(rs.getInt("id"));
                    rental.setHouseId(rs.getInt("house_id"));
                    rental.setUsername(rs.getString("username"));
                    rental.setRentalDate(rs.getTimestamp("rental_date"));

                    // 4. 将填充好的House和User对象设置到Rental对象中
                    rental.setHouse(house);
                    rental.setUser(user);

                    // 5. 返回完全组装好的Rental对象
                    return rental;
                }
            });
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
    // =================================================================================
    // 以下方法不属于 RentalDAO 接口，但已在您的原始代码中实现，故予以保留。
    // 如果您的应用别处不需要它们，可以安全地移除。
    // =================================================================================

    public boolean deleteRental(int rentalId) {
        String sql = "DELETE FROM rentals WHERE id = ?";
        try {
            return queryRunner.update(sql, rentalId) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Rental> findRentalsByUsername(String username) {
        // 如果需要，这个方法也可以用 JOIN 来获取完整的房屋信息
        String sql = "SELECT * FROM rentals WHERE username = ? ORDER BY rental_date DESC";
        try {
            return queryRunner.query(sql, new BeanListHandler<>(Rental.class), username);
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    public List<Rental> findRentalsByHouseId(int houseId) {
        String sql = "SELECT * FROM rentals WHERE house_id = ? ORDER BY rental_date DESC";
        try {
            return queryRunner.query(sql, new BeanListHandler<>(Rental.class), houseId);
        } catch (SQLException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
}