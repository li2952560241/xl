package com.hndy.xl.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.hndy.xl.common.annotation.Excel;
import com.hndy.xl.common.core.domain.BaseEntity;

/**
 * 积分证明材料对象 t_proofs
 * 
 * @author lxy
 * @date 2024-11-04
 */
public class Proofs extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 序号 */
    private Long materialId;

    /** 用户名称 */
    @Excel(name = "用户名称")
    private Long userId;
    private String userName;
    private String updaterName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUpdaterName() {
        return updaterName;
    }

    public void setUpdaterName(String updaterName) {
        this.updaterName = updaterName;
    }

    /** 材料 */
    @Excel(name = "材料")
    private String materialContent;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 积分值 */
    @Excel(name = "积分值")
    private String points;

    public void setMaterialId(Long materialId) 
    {
        this.materialId = materialId;
    }

    public Long getMaterialId() 
    {
        return materialId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setMaterialContent(String materialContent) 
    {
        this.materialContent = materialContent;
    }

    public String getMaterialContent() 
    {
        return materialContent;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setPoints(String points) 
    {
        this.points = points;
    }

    public String getPoints() 
    {
        return points;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("materialId", getMaterialId())
            .append("userId", getUserId())
            .append("materialContent", getMaterialContent())
            .append("createTime", getCreateTime())
            .append("status", getStatus())
            .append("updateBy", getUpdateBy())
            .append("points", getPoints())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
