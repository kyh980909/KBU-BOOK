package info;

public class DB {
    private String dbUrl = "jdbc:mysql://210.119.129.186:33306/kbu_book";
    private String dbId = "kbu_book";
    private String dbPw = "kbu_book";

    public String getDbUrl() {
        return dbUrl;
    }

    public String getDbId() {
        return dbId;
    }

    public String getDbPw() {
        return dbPw;
    }
}
