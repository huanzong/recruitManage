package entity;

import utils.Values;

public class jobskill {

    private int id;
    private String title;
    private String content;

    private String createTime;
    private int isHot;
    private int status;
    private String statusname;
    private String hotname;

    public String getStatusname() {
        return Values.fabu_status[status][1];
    }

    public void setStatusname(String statusname) {
        this.statusname = statusname;
    }

    public String getHotname() {
        return Values.hot_status[isHot][1];
    }

    public void setHotname(String hotname) {
        this.hotname = hotname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getIsHot() {
        return isHot;
    }

    public void setIsHot(int isHot) {
        this.isHot = isHot;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
