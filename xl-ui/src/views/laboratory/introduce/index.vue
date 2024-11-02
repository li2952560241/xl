<template>
  <div>
    <h1>上传一个.docx文件的文件展示到实验室介绍里面</h1>
    <el-button type="primary" @click="openFileInput">
      <input type="file" ref="fileInput" @change="handleFileUpload" accept=".doc,.docx" style="display: none;" />
      上传首页介绍文件
    </el-button>
    <el-button type="primary" @click="downloadFile">下载首页介绍文件</el-button>
  </div>
</template>

<script>
import { upload, download } from '@/api/laboratory/introduce'; // 确保引入上传和下载接口
import { MessageBox } from 'element-ui';

export default {
  methods: {
    openFileInput() {
      this.$refs.fileInput.click(); // 触发文件输入框的点击事件
    },
    async handleFileUpload(event) {
      const file = event.target.files[0];
      if (file) {
        // 使用 Element UI 的 MessageBox 显示确认对话框
        MessageBox.confirm('是否需要下载原来的文件？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(async () => {
          // 如果用户选择下载，调用下载函数
          await this.downloadFile();
        }).catch(() => {
          // 用户取消下载
        }).finally(async () => {
          // 无论用户选择下载还是取消下载，都继续执行文件上传
          const formData = new FormData();
          formData.append('file', file); // 确保这里的字段名与后端一致
          formData.append('filename', 'xl_introduce.docx');
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
    async downloadFile() {
      try {
        const filename = 'xl_introduce.docx';
        const response = await download({ filename }); // 传递 filename 参数
        const blob = new Blob([response], { type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' });
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = filename; // 设置下载的文件名
        a.click();
        window.URL.revokeObjectURL(url);
      } catch (error) {
        console.error('下载失败', error);
      }
    },
  }
}
</script>
