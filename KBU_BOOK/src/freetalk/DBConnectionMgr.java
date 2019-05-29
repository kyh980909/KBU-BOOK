package freetalk;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

public class DBConnectionMgr {
    private static DBConnectionMgr instance = new DBConnectionMgr();

    public DBConnectionMgr() {
    }

    public static DBConnectionMgr getInstance() {
        return instance;
    }

    //커넥션풀 이용하여 디비 연결
    protected Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp");
        return ds.getConnection();
    }
}