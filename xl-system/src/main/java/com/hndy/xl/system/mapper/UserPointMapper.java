package com.hndy.xl.system.mapper;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

public interface UserPointMapper
{
    @Insert("INSERT INTO t_user_points(dept_id, user_id, update_time) VALUES(#{deptId}, #{userId}, sysdate())")
    void addPoints(@Param("deptId") Long deptId, @Param("userId") Long userId);
    @Insert("INSERT INTO t_user_points(user_id, update_time) VALUES( #{userId}, sysdate())")
    void addUserPoints(@Param("userId") Long userId);
    @Update("UPDATE t_user_points SET dept_id = #{deptId} where user_id = #{userId}")
    void updatePoints(@Param("deptId")Long deptId,@Param("userId")  Long userId);

    @Delete("DELETE FROM t_user_points where user_id = #{userId}")
    void deletePoints(@Param("userId") Long userId);
}
