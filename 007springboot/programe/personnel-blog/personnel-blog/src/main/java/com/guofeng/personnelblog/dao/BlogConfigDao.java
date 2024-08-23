package com.guofeng.personnelblog.dao;

import com.guofeng.personnelblog.entity.BlogConfig;

import java.util.List;

public interface BlogConfigDao {
    List<BlogConfig> selectAll();
    BlogConfig selectByPrimaryKey(String configName);
    int updateByPrimaryKeySelective(BlogConfig record);
}
