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
import com.hndy.xl.domain.UserPoints;
import com.hndy.xl.service.IUserPointsService;
import com.hndy.xl.common.utils.poi.ExcelUtil;
import com.hndy.xl.common.core.page.TableDataInfo;

/**
 * 用户积分Controller
 * 
 * @author ruoyi
 * @date 2024-10-29
 */
@RestController
@RequestMapping("/laboratory/points")
public class UserPointsController extends BaseController
{
    @Autowired
    private IUserPointsService userPointsService;

    /**
     * 查询用户积分列表
     */
    @PreAuthorize("@ss.hasPermi('laboratory:points:list')")
    @GetMapping("/list")
    public TableDataInfo list(UserPoints userPoints)
    {
        startPage();
        List<UserPoints> list = userPointsService.selectUserPointsList(userPoints);
        return getDataTable(list);
    }

    /**
     * 导出用户积分列表
     */
    @PreAuthorize("@ss.hasPermi('laboratory:points:export')")
    @Log(title = "用户积分", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, UserPoints userPoints)
    {
        List<UserPoints> list = userPointsService.selectUserPointsList(userPoints);
        ExcelUtil<UserPoints> util = new ExcelUtil<UserPoints>(UserPoints.class);
        util.exportExcel(response, list, "用户积分数据");
    }

    /**
     * 获取用户积分详细信息
     */
    @PreAuthorize("@ss.hasPermi('laboratory:points:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(userPointsService.selectUserPointsById(id));
    }

    /**
     * 新增用户积分
     */
    @PreAuthorize("@ss.hasPermi('laboratory:points:add')")
    @Log(title = "用户积分", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody UserPoints userPoints)
    {
        return toAjax(userPointsService.insertUserPoints(userPoints));
    }

    /**
     * 修改用户积分
     */
    @PreAuthorize("@ss.hasPermi('laboratory:points:edit')")
    @Log(title = "用户积分", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody UserPoints userPoints)
    {
        return toAjax(userPointsService.updateUserPoints(userPoints));
    }

    /**
     * 删除用户积分
     */
    @PreAuthorize("@ss.hasPermi('laboratory:points:remove')")
    @Log(title = "用户积分", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(userPointsService.deleteUserPointsByIds(ids));
    }
}
