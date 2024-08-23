package com.guofeng.personnelblog.service;

import com.guofeng.personnelblog.entity.AdminUser;

public interface AdminUserService {

    /**
     * 登录
     */
    AdminUser login(String userName, String password);

    /**
     * 获取用户信息
     */
    AdminUser getUserDetailById(Integer loginUserId);

    /**
     * 修改当前登录用户的密码
     */
    Boolean updatePassword(Integer loginUserId, String originalPassword, String newPassword);

    /**
     * 修改当前登录用户的名称信息
     */
    Boolean updateName(Integer loginUserId, String loginUserName, String nickName);

}
