package com.hndy.xl.system.domain;

import com.hndy.xl.common.annotation.Excel;
import com.hndy.xl.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 用户积分对象 t_user_points
 * 
 * @author lxy
 * @date 2024-10-29
 */
public class UserPoint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 序号 */
    private Long id;

    /** 昵称 */
    @Excel(name = "昵称")
    private String userId;

    /** 方向 */
    @Excel(name = "方向")
    private String deptId;

    /** 积分 */
    @Excel(name = "积分")
    private Long points;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setDeptId(String deptId) 
    {
        this.deptId = deptId;
    }

    public String getDeptId() 
    {
        return deptId;
    }
    public void setPoints(Long points) 
    {
        this.points = points;
    }

    public Long getPoints() 
    {
        return points;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("deptId", getDeptId())
            .append("points", getPoints())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
