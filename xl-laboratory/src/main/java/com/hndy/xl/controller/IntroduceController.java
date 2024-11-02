package com.hndy.xl.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import com.hndy.xl.common.core.controller.BaseController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

@RestController
@RequestMapping("/introduce")
public class IntroduceController extends BaseController {

    private static final String FILE_PATH = "xl-ui/public/assets/";

    /**
     * 上传.docx文件
     * @param file
     * @return
     */
    @PreAuthorize("@ss.hasPermi('laboratory:introduce:upload')")
    @PostMapping("/upload")
    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file,@RequestParam("filename") String filename) {
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("这是一个空文件");
        }

//        System.out.println("\n\n\n\n"+filename+"\n\n\n\n");
        try {
            // 保存新文件
            String filePath = saveFile(file, filename);
            return ResponseEntity.ok("File uploaded successfully to " + filePath);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Failed to upload file: " + e.getMessage());
        }
    }

    private String saveFile(MultipartFile file, String filename) throws IOException {

//        System.out.println("\n\n\n\n"+filename+"\n\n\n\n");
        // 获取项目根目录
        String projectRoot = System.getProperty("user.dir");

        // 构建目标文件的绝对路径
        String targetPath = Paths.get(projectRoot, FILE_PATH+filename).toString();

//        System.out.println("\n\n\n\n"+targetPath+"\n\n\n\n");
        // 创建目标文件对象
        File targetFile = new File(targetPath);

        // 确保目标文件的父目录存在
        File parentDir = targetFile.getParentFile();
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        }

        // 将上传的文件保存到目标路径
        file.transferTo(targetFile);

        // 返回保存的文件路径
        return targetPath;
    }

    /**
     * 下载当前文件
     * @return
     */
    @GetMapping("/download")
    public ResponseEntity<Resource> downloadFile(@RequestParam("filename") String filename) {
//        System.out.println("\n\n\n\n\n\n");
//        System.out.println(filename);
//        System.out.println("\n\n\n\n\n\n");
        File file = new File(System.getProperty("user.dir"), FILE_PATH+filename);
        if (!file.exists()) {
            return ResponseEntity.notFound().build();
        }

        Resource resource = new FileSystemResource(file);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getName() + "\"")
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }
}
