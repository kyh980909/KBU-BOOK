package kbu;

import java.sql.*;
import java.util.*;
/*
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;*/

public class memberDAO { //DB연결
    private DBConnectionMgr pool = null;
    private static memberDAO instance;
   // private memberDAO(){}
    public static memberDAO getInstance(){
        if(instance ==  null)
            instance = new memberDAO();
        return instance;
    }
    public memberDAO() {
        try {
            pool = DBConnectionMgr.getInstance();
            System.out.println("DB연결 성공");
        } catch (Exception e) {
            System.out.println("오류: " + e);
        }
    }


    public boolean checkId(String id) throws Exception { //ID 중복확인 메서드

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        boolean flag = false;
        try {
            con = pool.getConnection();  //커넥션연결
            pstmt = con.prepareStatement("select id from member where id = ?"); //DB에서 id찾기를 실행하는 sql문 실행
            pstmt.setString(1, id);
            flag = pstmt.executeQuery().next();

        } catch (Exception e) {
            System.out.println("ID확인오류: " + e);
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (SQLException ex) {
            }
            if (pstmt != null) try {
                pstmt.close();
            } catch (SQLException ex) {
            }
            if (con != null) try {
                con.close();
            } catch (SQLException ex) {
            }
        }
        return flag;

    }

    public int checklogin(String id, String pwd){ //로그인 메서드

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int flage = -1;
        String dbpwd=""; //DB에 저장된 비밀번호 저장
        try{
            // 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
            StringBuffer query = new StringBuffer();
            //pstmt=con.prepareStatement("select pwd from member where id = ?");
            query.append(" SELECT pwd FROM member WHERE id=?");

            con = pool.getConnection();
            pstmt = con.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) // 입력된 아이디에 해당하는 비번 있을경우
            {
                dbpwd = rs.getString("pwd"); // 비번을 변수에 넣는다.

                if (dbpwd.equals(pwd))
                    flage= 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
                else
                    flage = 2; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패

            } else {
                flage = 3; // 아디가 없을 경우
            }

            return flage;

        } catch (Exception e1) {
            throw new RuntimeException(e1.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( con != null ){ con.close(); con=null;    }
            }catch(Exception e){
                System.out.println("에러(lognin2): "+e);
                throw new RuntimeException(e.getMessage());
            }
        }
    }

}
