import request from '@/utils/request';
import { getToken } from "@/utils/auth";

/**
 * 上传.docx文件
 * @param data
 * @returns {*}
 */
export function upload(data) {
  return request({
    url: '/introduce/upload',
    method: 'post',
    data: data, // 确保这里是 FormData
    headers: {
      Authorization: "Bearer " + getToken(),
      'Content-Type': 'multipart/form-data'
    }
  });
}

/**
 * 下载.docx文件
 * @returns {*}
 */
export function download() {
  return request({
    url: '/introduce/download',
    method: 'get',
    responseType: 'blob',
    headers: {
      Authorization: "Bearer " + getToken(),
      'Content-Type': 'application/x-www-form-urlencoded'
    }
  });
}
