package entity;

import utils.Values;

public class operator {
    private int id;
    private String name;
    private int status;
    private String comment;
    private String account;
    private String pass;
    private String phone;
    private String card;
    private int type;//后期考虑加禁用功能使用
    private String statusname;

    public operator() {
    }

    public String getStatusname() {
        return Values.currency_status[status][1];
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname;
    }

    public operator(int id, String pass) {
        this.id = id;
        this.pass = pass;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
