package com.hndy.xl.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.hndy.xl.common.annotation.Log;
import com.hndy.xl.common.core.controller.BaseController;
import com.hndy.xl.common.core.domain.AjaxResult;
import com.hndy.xl.common.enums.BusinessType;
import com.hndy.xl.domain.Proofs;
import com.hndy.xl.service.IProofsService;
import com.hndy.xl.common.utils.poi.ExcelUtil;
import com.hndy.xl.common.core.page.TableDataInfo;

/**
 * 积分证明材料Controller
 * 
 * @author lxy
 * @date 2024-11-04
 */
@RestController
@RequestMapping("/laboratory/proofs")
public class ProofsController extends BaseController
{
    @Autowired
    private IProofsService proofsService;

    /**
     * 查询积分证明材料列表
     */
    @PreAuthorize("@ss.hasPermi('laboratory:proofs:list')")
    @GetMapping("/list")
    public TableDataInfo list(Proofs proofs)
    {
        startPage();
        List<Proofs> list = proofsService.selectProofsList(proofs);
        return getDataTable(list);
    }

    /**
     * 导出积分证明材料列表
     */
    @PreAuthorize("@ss.hasPermi('laboratory:proofs:export')")
    @Log(title = "积分证明材料", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Proofs proofs)
    {
        List<Proofs> list = proofsService.selectProofsList(proofs);
        ExcelUtil<Proofs> util = new ExcelUtil<Proofs>(Proofs.class);
        util.exportExcel(response, list, "积分证明材料数据");
    }

    /**
     * 获取积分证明材料详细信息
     */
    @PreAuthorize("@ss.hasPermi('laboratory:proofs:query')")
    @GetMapping(value = "/{materialId}")
    public AjaxResult getInfo(@PathVariable("materialId") Long materialId)
    {
        return success(proofsService.selectProofsByMaterialId(materialId));
    }

    /**
     * 新增积分证明材料
     */
    @PreAuthorize("@ss.hasPermi('laboratory:proofs:add')")
    @Log(title = "积分证明材料", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Proofs proofs)
    {
        return toAjax(proofsService.insertProofs(proofs));
    }

    /**
     * 修改积分证明材料
     */
    @PreAuthorize("@ss.hasPermi('laboratory:proofs:edit')")
    @Log(title = "积分证明材料", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Proofs proofs)
    {
        return toAjax(proofsService.updateProofs(proofs));
    }

    /**
     * 删除积分证明材料
     */
    @PreAuthorize("@ss.hasPermi('laboratory:proofs:remove')")
    @Log(title = "积分证明材料", businessType = BusinessType.DELETE)
	@DeleteMapping("/{materialIds}")
    public AjaxResult remove(@PathVariable Long[] materialIds)
    {
        return toAjax(proofsService.deleteProofsByMaterialIds(materialIds));
    }
}
