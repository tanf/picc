package pers.lqresier.picc.vo;

import java.sql.Timestamp;

/**
 * 使用状态展示(中间类)
 *
 * @author Administrator
 */

public class DocumentUseVOTemp {
    String name;//用户
    /**
     * 单证状态
     * 0：未使用
     * 1：已使用
     * 2：停用
     * 3：作废
     * 4：丢失
     */
    Integer status;//单证状态
    Integer num;//单证数量
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
