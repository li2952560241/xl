<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="更新人" prop="updateBy">-->
<!--        <el-select v-model="queryParams.updateBy" placeholder="请选择更新人" clearable @change="handleQuery">-->
<!--          <el-option-->
<!--            v-for="user in userList"-->
<!--            :key="user.userId"-->
<!--            :label="user.nickName"-->
<!--            :value="user.id"-->
<!--          />-->
<!--        </el-select>-->
<!--      </el-form-item>-->
      <el-form-item label="积分值" prop="points">
        <el-input v-model="queryParams.points" placeholder="请输入积分值" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['laboratory:proofs:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          v-if="!single && currentRow.status === 0"
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          @click="handleUpdate"
          v-hasPermi="['laboratory:proofs:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['laboratory:proofs:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="proofsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" prop="materialId" />
      <el-table-column label="用户名称" align="center" prop="userName" />
      <el-table-column label="材料" align="center" prop="materialContent">
        <template slot-scope="scope">
          <div v-html="scope.row.materialContent" class="table" />
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
            v-if="scope.row.status === '0'"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['laboratory:proofs:edit']"
          >修改</el-button>
          <span v-else>无法修改</span>
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

    <el-dialog :title="title" :visible.sync="open" width="1200px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="材料">
          <editor v-model="form.materialContent" :min-height="192"/>
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
import { listProofs, getProofs, addProofs, updateProofs, listUsers } from "@/api/laboratory/proofs";
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
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        status: null,
        updateBy: null, // 使用用户 ID
        points: null,
      },
      form: {},
      rules: {
        materialContent: [
          { required: true, message: "材料不能为空", trigger: "blur" }
        ],
      },
      userId: store.state.user.id,
      currentRow: {},
      userList: [], // 用于存储用户列表
    };
  },
  created() {
    this.getList();
    this.getUserList(); // 获取用户列表
  },
  methods: {
    getUserList() {
      listUsers().then(response => {
        this.userList = response.data;
      });
    },
    getList() {
      this.queryParams.userId = this.userId;
      this.loading = true;
      listProofs(this.queryParams).then(response => {
        this.proofsList = response.rows.map(item => ({
          ...item,
          materialContent: this.isImageUrl(item.materialContent) ?
            `<img src="${item.materialContent}" alt="材料图片" style="max-width: 100px; max-height: 100px; object-fit: contain;" />` :
            item.materialContent || '无内容',
        }));
        this.total = response.total;
        this.loading = false;
      });
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.form = {
        materialId: null,
        userId: this.userId,
        materialContent: null,
        createTime: null,
        status: null,
        updateBy: null,
        points: null,
        updateTime: null
      };
      this.resetForm("form");
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.materialId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
      this.currentRow = selection.length ? selection[0] : {};
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加积分证明材料";
    },
    handleUpdate(row) {
      this.reset();
      const materialId = row.materialId || this.ids;
      getProofs(materialId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改积分证明材料";
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.userId = this.userId;
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
    isImageUrl(url) {
      return url.startsWith('http') && (url.endsWith('.jpg') || url.endsWith('.png'));
    }
  }
};
</script>

<style>
.table img {
  max-width: 100px; /* 根据需要设置最大宽度 */
  max-height: 100px; /* 根据需要设置最大高度 */
  object-fit: contain; /* 保持纵横比 */
}
.dialog-footer {
  text-align: right; /* 对齐按钮 */
}
.mb8 {
  margin-bottom: 1px; /* 调整底部间距 */
}
</style>
