package com.hndy.xl.service.impl;

import java.util.List;
import com.hndy.xl.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hndy.xl.mapper.UserPointsMapper;
import com.hndy.xl.domain.UserPoints;
import com.hndy.xl.service.IUserPointsService;

/**
 * 用户积分Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-10-29
 */
@Service
public class UserPointsServiceImpl implements IUserPointsService 
{
    @Autowired
    private UserPointsMapper userPointsMapper;

    /**
     * 查询用户积分
     * 
     * @param id 用户积分主键
     * @return 用户积分
     */
    @Override
    public UserPoints selectUserPointsById(Long id)
    {
        return userPointsMapper.selectUserPointsById(id);
    }

    /**
     * 查询用户积分列表
     * 
     * @param userPoints 用户积分
     * @return 用户积分
     */
    @Override
    public List<UserPoints> selectUserPointsList(UserPoints userPoints)
    {
        return userPointsMapper.selectUserPointsList(userPoints);
    }

    /**
     * 新增用户积分
     * 
     * @param userPoints 用户积分
     * @return 结果
     */
    @Override
    public int insertUserPoints(UserPoints userPoints)
    {
        return userPointsMapper.insertUserPoints(userPoints);
    }

    /**
     * 修改用户积分
     * 
     * @param userPoints 用户积分
     * @return 结果
     */
    @Override
    public int updateUserPoints(UserPoints userPoints)
    {
        userPoints.setUpdateTime(DateUtils.getNowDate());
        return userPointsMapper.updateUserPoints(userPoints);
    }

    /**
     * 批量删除用户积分
     * 
     * @param ids 需要删除的用户积分主键
     * @return 结果
     */
    @Override
    public int deleteUserPointsByIds(Long[] ids)
    {
        return userPointsMapper.deleteUserPointsByIds(ids);
    }

    /**
     * 删除用户积分信息
     * 
     * @param id 用户积分主键
     * @return 结果
     */
    @Override
    public int deleteUserPointsById(Long id)
    {
        return userPointsMapper.deleteUserPointsById(id);
    }
}
