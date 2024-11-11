<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户名称" prop="userId">
        <el-select
          v-model="queryParams.userId"
          placeholder="请选择用户名称"
          clearable
          @change="handleQuery"
        >
          <el-option
            v-for="user in userList"
            :key="user.userId"
            :label="user.userName"
            :value="user.userId"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="更新人" prop="updateBy">
        <el-select
          v-model="queryParams.updateBy"
          placeholder="请选择更新人"
          clearable
          @change="handleQuery"
        >
          <el-option
            v-for="user in updateName"
            :key="user.updateBy"
            :label="user.updaterName"
            :value="user.updateBy"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="积分值" prop="points">
        <el-input
          v-model="queryParams.points"
          placeholder="请输入积分值"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['laboratory:proofs:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5"></el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['laboratory:proofs:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="proofsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" prop="materialId" />
      <el-table-column label="用户名称" align="center" prop="userName" />
      <el-table-column label="材料" align="center" prop="materialContent">
        <template slot-scope="scope">
          <div v-html="formatMaterialContent(scope.row.materialContent)"></div>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status">
        <template slot-scope="scope">
          <span>{{ scope.row.status === '0' ? '已提交' : '已加分' }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新人" align="center" prop="updaterName" />
      <el-table-column label="积分值" align="center" prop="points" />
      <el-table-column label="认定时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['laboratory:proofs:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['laboratory:proofs:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改积分证明材料对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1200px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="材料">
          <editor v-model="form.materialContent" :min-height="192" :readonly="isEdit" />
        </el-form-item>
        <el-form-item label="积分值" prop="points">
          <el-input v-model="form.points" placeholder="请输入积分值" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listProofs, getProofs, delProofs, addProofs, updateProofs } from "@/api/laboratory/proofs";
import store from "@/store";

export default {
  name: "Proofs",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      proofsList: [],
      userList: [],// 用户列表的下拉框
      updateName: [],// 更新人的下拉框
      title: "",
      open: false,
      isEdit: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        status: null,
        updateBy: null,
        points: null,
      },
      form: {},
      rules: {
        materialContent: [
          { required: true, message: "材料不能为空", trigger: "blur" }
        ],
      },
      userId: store.state.user.id,
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询积分证明材料列表 */
    getList() {
      this.loading = true;
      listProofs(this.queryParams).then(response => {
        this.proofsList = response.rows;
        this.total = response.total;

        // 处理用户列表
        const userMap = new Map();
        const updaterMap = new Map();

        this.proofsList.forEach(item => {
          if (!userMap.has(item.userId)) {
            userMap.set(item.userId, {
              userName: item.userName,
              userId: item.userId // 保留 userId
            });
          }
          if (!updaterMap.has(item.updateBy)) {
            updaterMap.set(item.updateBy, {
              updaterName: item.updaterName,
              updateBy: item.updateBy // 保留 updateBy
            });
          }
        });
        this.userList = Array.from(userMap.values());
        this.updateName = Array.from(updaterMap.values());
        // console.log('proofsList:', this.proofsList);
        // console.log('userList:', this.userList);
        // console.log('updateName:', this.updateName);
        this.loading = false;
      });
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        materialId: null,
        userId: this.userId, // 添加用户 ID
        materialContent: null,
        createTime: null,
        status: null,
        updateBy: null,
        points: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.materialId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.isEdit = true; // 设置为修改操作
      const materialId = row.materialId || this.ids;
      getProofs(materialId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改积分证明材料";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 添加用户 ID 和更新人
          this.form.updateBy = this.userId; // 将 userId 传入更新人
          this.form.status = 1; // 设置状态为1

          if (this.form.materialId != null) {
            updateProofs(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addProofs(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const materialIds = row.materialId || this.ids;
      this.$modal.confirm('是否确认删除积分证明材料编号为"' + materialIds + '"的数据项？').then(() => {
        return delProofs(materialIds);
      }).then(response => {
        this.$modal.msgSuccess("删除成功");
        this.getList();
      });
    },
    /** 图片等比例压缩 */
    formatMaterialContent(content) {
      const imgRegex = /<img.*?src=["'](.*?)["'].*?>/;
      if (imgRegex.test(content)) {
        return content.replace(imgRegex, (match, src) => {
          return `<img src="${src}" style="max-width: 100px; max-height: 100px; object-fit: contain;" />`;
        });
      }
      return content; // 如果不是图片，直接返回原内容
    }
  }
};
</script>

<style scoped>
.table img {
  max-width: 100px; /* 根据需要设置最大宽度 */
  max-height: 100px; /* 根据需要设置最大高度 */
  object-fit: contain; /* 保持纵横比 */
}
</style>
