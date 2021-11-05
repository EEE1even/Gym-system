package entity;

public class Admin {
    private Integer id;
    private String account;
    private String pwd;
    private String type;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public Admin() {
    }

    public Admin(String account, String pwd, String type) {
        this.account = account;
        this.pwd = pwd;
        this.type = type;
    }



    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


}
