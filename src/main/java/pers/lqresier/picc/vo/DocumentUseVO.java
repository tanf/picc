package pers.lqresier.picc.vo;

import java.sql.Timestamp;

/**
 * 使用状态展示
 * @author Administrator
 *
 */

public class DocumentUseVO {
    String name;//用户
    Integer used;//已使用
    Integer unuse;//未使用
    Integer disuse;//停用
    Integer invalid;//作废
    Integer lost;//丢失
    String date;
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getUsed() {
        return used;
    }
    public void setUsed(Integer used) {
        this.used = used;
    }
    public Integer getUnuse() {
        return unuse;
    }
    public void setUnuse(Integer unuse) {
        this.unuse = unuse;
    }
    public Integer getDisuse() {
        return disuse;
    }
    public void setDisuse(Integer disuse) {
        this.disuse = disuse;
    }
    public Integer getInvalid() {
        return invalid;
    }
    public void setInvalid(Integer invalid) {
        this.invalid = invalid;
    }
    public Integer getLost() {
        return lost;
    }
    public void setLost(Integer lost) {
        this.lost = lost;
    }


}
