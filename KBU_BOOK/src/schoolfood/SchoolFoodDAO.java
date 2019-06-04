package schoolfood;

import freetalk.FreeTalk;
import kbu.DBConnectionMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class SchoolFoodDAO {
    private DBConnectionMgr pool;

    public SchoolFoodDAO() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Vector<Lunch> getLunch() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;

        Vector<Lunch> list = new Vector<Lunch>();

        try {
            con = pool.getConnection();

            sql = "select * from lunch";

            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String[] food = new String[6];
                Lunch lunch = new Lunch();
                lunch.setId(rs.getInt("id"));
                lunch.setDate(rs.getString("date"));
                lunch.setDay(rs.getString("day"));
                for (int i = 0; i < 6; i++) {
                     food[i] = rs.getString("food"+(i+1));
                }
                lunch.setFood(food);

                list.add(lunch);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {}
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {}

            }

            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {}
            }
        }

        return list;
    }
}
