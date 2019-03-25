package entity;

import utils.Values;

public class user {
    private int id;
    private String account;
    private String pass;
    private String question;
    private String answer;
    private int type;//用户类型，招聘者/求职者
    private int status;//审核状态


    public static final String TABLE_NAME = "user";

    public String getStatusname() {
        return Values.user_status[status][1];
    }
    public String getTypename() {
        return Values.user_type[type][1];
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
