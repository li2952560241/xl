<template>
  <div>
    <h1>编辑各个方向的介绍</h1>
    <table>
      <thead>
      <tr>
        <th>方向</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="(section, index) in sections" :key="index">
        <td>{{ section.title }}</td>
        <td>
          <el-button type="primary" @click="openFileInput(section)">
            <input type="file" :ref="`fileInput${index}`" @change="handleFileUpload(section)" accept=".doc,.docx" style="display: none;" />
            上传{{ section.title }}介绍文件
          </el-button>
          <el-button type="primary" @click="downloadFile(section)">下载{{ section.title }}介绍文件</el-button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { upload, download } from '@/api/laboratory/introduce'; // 确保引入上传和下载接口
import { MessageBox } from 'element-ui';

export default {
  data() {
    return {
      sections: [
        { title: 'Crypto', filename: 'crypto_introduce.docx' },
        { title: 'Web', filename: 'web_introduce.docx' },
        { title: 'misc', filename: 'misc_introduce.docx' },
        { title: 'pwn', filename: 'pwn_introduce.docx' },
        { title: 're', filename: 're_introduce.docx' }
      ]
    };
  },
  methods: {
    openFileInput(section) {
      this.$refs[`fileInput${this.sections.indexOf(section)}`][0].click(); // 触发文件输入框的点击事件
    },
    async handleFileUpload(section) {
      const file = this.$refs[`fileInput${this.sections.indexOf(section)}`][0].files[0];
      if (file) {
        // 使用 Element UI 的 MessageBox 显示确认对话框
        MessageBox.confirm('是否需要下载原来的文件？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(async () => {
          // 如果用户选择下载，调用下载函数
          await this.downloadFile(section);
        }).catch(() => {
          // 用户取消下载
        }).finally(async () => {
          // 无论用户选择下载还是取消下载，都继续执行文件上传
          const formData = new FormData();
          formData.append('file', file); // 确保这里的字段名与后端一致
          formData.append('filename', section.filename);
          try {
            const response = await upload(formData);
            if (response) {
              console.log('上传成功:', response.data);
              // 上传成功后刷新网页
              window.location.reload();
            } else {
              console.error('未收到有效的响应', response);
            }
          } catch (error) {
            console.error('上传失败', error);
          }
        });
      }
    },
    async downloadFile(section) {
      try {
        const response = await download({filename: section.filename}); // 传递 filename 参数
        const blob = new Blob([response], {type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'});
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = section.filename; // 设置下载的文件名
        a.click();
        window.URL.revokeObjectURL(url);
      } catch (error) {
        console.error('下载失败', error);
      }
    },
  }
}
</script>

<style scoped>
table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
}

th {
  background-color: #f2f2f2;
  text-align: left;
}
</style>
