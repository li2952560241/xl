package com.hndy.xl.service.impl;

import java.util.List;
import com.hndy.xl.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hndy.xl.mapper.ProofsMapper;
import com.hndy.xl.domain.Proofs;
import com.hndy.xl.service.IProofsService;

/**
 * 积分证明材料Service业务层处理
 * 
 * @author lxy
 * @date 2024-11-04
 */
@Service
public class ProofsServiceImpl implements IProofsService 
{
    @Autowired
    private ProofsMapper proofsMapper;

    /**
     * 查询积分证明材料
     * 
     * @param materialId 积分证明材料主键
     * @return 积分证明材料
     */
    @Override
    public Proofs selectProofsByMaterialId(Long materialId)
    {
        return proofsMapper.selectProofsByMaterialId(materialId);
    }

    /**
     * 查询积分证明材料列表
     * 
     * @param proofs 积分证明材料
     * @return 积分证明材料
     */
    @Override
    public List<Proofs> selectProofsList(Proofs proofs)
    {
        return proofsMapper.selectProofsList(proofs);
    }

    /**
     * 新增积分证明材料
     * 
     * @param proofs 积分证明材料
     * @return 结果
     */
    @Override
    public int insertProofs(Proofs proofs)
    {
        proofs.setCreateTime(DateUtils.getNowDate());
        return proofsMapper.insertProofs(proofs);
    }

    /**
     * 修改积分证明材料
     * 
     * @param proofs 积分证明材料
     * @return 结果
     */
    @Override
    public int updateProofs(Proofs proofs)
    {
        proofs.setUpdateTime(DateUtils.getNowDate());
        return proofsMapper.updateProofs(proofs);
    }

    /**
     * 批量删除积分证明材料
     * 
     * @param materialIds 需要删除的积分证明材料主键
     * @return 结果
     */
    @Override
    public int deleteProofsByMaterialIds(Long[] materialIds)
    {
        return proofsMapper.deleteProofsByMaterialIds(materialIds);
    }

    /**
     * 删除积分证明材料信息
     * 
     * @param materialId 积分证明材料主键
     * @return 结果
     */
    @Override
    public int deleteProofsByMaterialId(Long materialId)
    {
        return proofsMapper.deleteProofsByMaterialId(materialId);
    }
}
