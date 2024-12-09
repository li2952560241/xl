# 构建阶段
FROM node:16 AS build

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json（如果有）
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制所有源代码
COPY . .

# 设置 ENTRYPOINT 以运行开发服务器
ENTRYPOINT ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

# 暴露端口（根据需要暴露 8080 或其他端口）
EXPOSE 80



