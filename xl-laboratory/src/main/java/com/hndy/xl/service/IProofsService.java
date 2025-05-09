package com.hndy.xl.service;

import java.util.List;
import com.hndy.xl.domain.Proofs;

/**
 * 积分证明材料Service接口
 * 
 * @author lxy
 * @date 2024-11-04
 */
public interface IProofsService 
{
    /**
     * 查询积分证明材料
     * 
     * @param materialId 积分证明材料主键
     * @return 积分证明材料
     */
    public Proofs selectProofsByMaterialId(Long materialId);

    /**
     * 查询积分证明材料列表
     * 
     * @param proofs 积分证明材料
     * @return 积分证明材料集合
     */
    public List<Proofs> selectProofsList(Proofs proofs);

    /**
     * 新增积分证明材料
     * 
     * @param proofs 积分证明材料
     * @return 结果
     */
    public int insertProofs(Proofs proofs);

    /**
     * 修改积分证明材料
     * 
     * @param proofs 积分证明材料
     * @return 结果
     */
    public int updateProofs(Proofs proofs);

    /**
     * 认定积分材料
     *
     * @param proofs 认定积分
     * @return 结果
     */
    public int updateCognizanceProofs(Proofs proofs);
    /**
     * 批量删除积分证明材料
     * 
     * @param materialIds 需要删除的积分证明材料主键集合
     * @return 结果
     */
    public int deleteProofsByMaterialIds(Long[] materialIds);

    /**
     * 删除积分证明材料信息
     * 
     * @param materialId 积分证明材料主键
     * @return 结果
     */
    public int deleteProofsByMaterialId(Long materialId);
}
