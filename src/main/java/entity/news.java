package entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.text.SimpleDateFormat;
import java.util.Date;

public class news {

    private int id;
    private String title;
    private String content;

    private String createTime;
    private String picUrl;
    private String newsArea;
    private int newsStar;

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

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public String getNewsArea() {
        return newsArea;
    }

    public void setNewsArea(String newsArea) {
        this.newsArea = newsArea;
    }

    public int getNewsStar() {
        return newsStar;
    }

    public void setNewsStar(int newsStar) {
        this.newsStar = newsStar;
    }
}
