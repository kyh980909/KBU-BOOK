package freetalk;

import info.DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FreeTalkDAO {
    private Connection conn;
    private ResultSet rs;

    DB dbi = new DB(); // DB 정보를 가지고 있는 클래스 객체 생성

    public FreeTalkDAO() {
        try {
            String dbURL = dbi.getDbUrl();
            String dbId = dbi.getDbId();
            String dbPw = dbi.getDbPw();
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(dbURL, dbId, dbPw);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getDate() { // 현재 시간을 반환하는 메서드
        String SQL = "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public int getNext() { // 게시글의 번호를 매기는 메서드
        String SQL = "SELECT id FROM freetalk ORDER BY id DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }

    public int write(String title, String userID, String content) {
        String SQL = "INSERT INTO freetalk VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, title);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, content);
            pstmt.setInt(6, 1);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<FreeTalk> getList() {
        String SQL = "SELECT * FROM freetalk";
        ArrayList<FreeTalk> list = new ArrayList<FreeTalk>();
        try{
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                FreeTalk freeTalk = new FreeTalk();
                freeTalk.setId(rs.getInt(1));
                freeTalk.setTitle(rs.getString(2));
                freeTalk.setWriter(rs.getString(3));
                freeTalk.setDate(rs.getDate(4));
                freeTalk.setContent(rs.getString(5));
                freeTalk.setIp(rs.getString(6));
                freeTalk.setCount(rs.getInt(7));
                list.add(freeTalk);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public FreeTalk getContent(int id) {
        String SQL = "SELECT * FROM freetalk where id = ?";

        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                FreeTalk freeTalk = new FreeTalk();
                freeTalk.setId(rs.getInt(1));
                freeTalk.setTitle(rs.getString(2));
                freeTalk.setWriter(rs.getString(3));
                freeTalk.setDate(rs.getDate(4));
                freeTalk.setContent(rs.getString(5));
                freeTalk.setIp(rs.getString(6));
                freeTalk.setCount(rs.getInt(7));
                return freeTalk;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
