<template>
  <div>
    <h1>湘岚实验室简</h1>
    <div v-html="rendererdMarkdown"></div>

    <h1>展示 Word 文件内容</h1>
    <div v-html="wordContent"></div>
  </div>
</template>

<script>
import axios from "axios";
import MarkdownIt from 'markdown-it';
import attrs from 'markdown-it-attrs';
import mammoth from "mammoth";

export default {
  data() {
    return {
      markdownContent: '',
      wordContent: '',
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
    axios.get('/lab-introduction.md') // 请根据项目结构修改路径
      .then(response => {
        this.markdownContent = response.data;
      })
      .catch(error => {
        console.error("加载失败", error);
      });

    // 加载本地 Word 文件
    this.loadWordFile();
  },

  methods: {
    loadWordFile() {
      // 直接从 public 目录加载 Word 文件
      fetch('/assets/11.docx') // 确保路径正确
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
