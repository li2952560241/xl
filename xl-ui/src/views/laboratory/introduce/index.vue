<template>
  <div>
    <h1>上传一个.docx文件的文件展示到实验室介绍里面</h1>
    <input type="file" @change="handleFileUpload" accept=".doc,.docx" />
    <button @click="downloadFile">下载现有文件</button>
  </div>
</template>

<script>
import { upload, download } from '@/api/laboratory/introduce'; // 确保引入上传和下载接口

export default {
  methods: {
    async handleFileUpload(event) {
      const file = event.target.files[0];
      if (file) {
        // 提示用户是否需要下载原来的文件
        const shouldDownload = confirm("是否需要下载原来的文件？");

        if (shouldDownload) {
          // 如果用户选择下载，调用下载函数
          await this.downloadFile();
        }

        const formData = new FormData();
        formData.append('file', file); // 确保这里的字段名与后端一致

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
      }
    },
    async downloadFile() {
      try {
        const response = await download();
        const blob = new Blob([response], {type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'});
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'xl_introduce.docx'; // 设置下载的文件名
        a.click();
        window.URL.revokeObjectURL(url);
      } catch (error) {
        console.error('下载失败', error);
      }
    }
  }
}
</script>
