package com.hndy.xl.quartz.task;

import com.hndy.xl.quartz.mapper.SysJobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MyTask")
public class MyTask {
    @Autowired
    private SysJobMapper sysJobMapper;
    public void decrease(){
//        System.out.println("任务执行了"+"\n\n\n\n\n\n");
        sysJobMapper.updatepoints();
//        System.out.println("任务执行完毕"+"\n\n\n\n\n\n");
    }
}
