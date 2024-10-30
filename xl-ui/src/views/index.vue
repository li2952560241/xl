<template>
  <div>
    <h1>湘岚实验室简</h1>
    <div v-html="rendererdMarkdown"></div>
  </div>
</template>

<script>
import axios from "axios";
import MarkdownIt from 'markdown-it';
import attrs from 'markdown-it-attrs';

export default {
  data() {
    return {
      markdownContent: '',
    };
  },
  computed: {
    rendererdMarkdown() {
      const md = new MarkdownIt().use(attrs);
      return md.render(this.markdownContent);
    }
  },
  created() {
    // 使用相对路径来加载 Markdown 文件
    axios.get('/lab-introduction.md')// 请根据项目结构修改路径
      .then(response => {
        this.markdownContent = response.data;
      })
      .catch(error => {
        console.error("加载失败", error);
      });
  }
}
</script>
