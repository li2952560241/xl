<template>
  <div>
    <div v-html="wordContent"></div>
  </div>
</template>

<script>
import mammoth from "mammoth";

export default {
  data() {
    return {
      wordContent: '',
    };
  },

  created() {
    // 加载本地 Word 文件
    this.loadWordFile();
  },

  methods: {
    loadWordFile() {
      // 直接从 public 目录加载 Word 文件
      fetch('/assets/re_introduce.docx') // 确保路径正确
        .then(response => {
          if (!response.ok) {
            throw new Error('网络响应失败');
          }
          return response.arrayBuffer();
        })
        .then(arrayBuffer => {
          return mammoth.convertToHtml({ arrayBuffer: arrayBuffer });
        })
        .then(result => {
          this.wordContent = result.value; // Word 内容
        })
        .catch(err => {
          console.error('加载 Word 文件失败', err);
        });
    }
  }
}
</script>
