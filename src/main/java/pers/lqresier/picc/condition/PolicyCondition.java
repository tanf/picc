package pers.lqresier.picc.condition;

import java.sql.Timestamp;

/**
 * 保单条件类
 *
 * @author Administrator
 */
public class PolicyCondition implements Condition {
    private String documentNum = null;//单证流水号
    private String policyCode = null;//保单编号
    private Integer status = null;//状态
    private Timestamp beginTime = null;//起始时间
    private Timestamp endTime = null;//结束时间

    public String getDocumentNum() {
        return documentNum;
    }

    public void setDocumentNum(String documentNum) {
        this.documentNum = documentNum;
    }

    public String getPolicyCode() {
        return policyCode;
    }

    public void setPolicyCode(String policyCode) {
        this.policyCode = policyCode;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Timestamp getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Timestamp beginTime) {
        this.beginTime = beginTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

}
