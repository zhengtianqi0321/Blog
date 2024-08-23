package com.guofeng.personnelblog.dao;

import com.guofeng.personnelblog.entity.BlogLink;
import com.guofeng.personnelblog.utils.PageQueryUtil;

import java.util.List;

public interface BlogLinkDao {
    int deleteByPrimaryKey(Integer linkId);
    int insert(BlogLink record);
    int insertSelective(BlogLink record);
    BlogLink selectByPrimaryKey(Integer linkId);
    int updateByPrimaryKeySelective(BlogLink record);
    int updateByPrimaryKey(BlogLink record);
    List<BlogLink> findLinkList(PageQueryUtil pageUtil);
    int getTotalLinks(PageQueryUtil pageUtil);
    int deleteBatch(Integer[] ids);
}
