// src/util/DBUtil.java

package util;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import javax.sql.DataSource;
import java.sql.Connection; // 导入 Connection
import java.sql.SQLException; // 导入 SQLException

public class DBUtil {

    private static DataSource dataSource;

    static {
        try {
            dataSource = new ComboPooledDataSource("MySqlDs");
        } catch (Exception e) {
            System.err.println("初始化数据库连接池失败！请检查 c3p0-config.xml 文件是否在项目的 src 目录下。");
            e.printStackTrace();
        }
    }

    /**
     * 获取配置好的数据源
     * @return DataSource 对象
     */
    public static DataSource getDataSource() {
        return dataSource;
    }

    /**
     * --- 新增的推荐方法 ---
     * 从连接池获取一个数据库连接
     * @return Connection 对象
     * @throws SQLException 如果连接池未初始化或获取连接失败
     */
    public static Connection getConnection() throws SQLException {
        if (dataSource == null) {
            throw new SQLException("数据库连接池未被正确初始化！");
        }
        return dataSource.getConnection();
    }
}