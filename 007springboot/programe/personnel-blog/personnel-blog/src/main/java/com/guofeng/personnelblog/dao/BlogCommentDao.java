package com.guofeng.personnelblog.dao;

import com.guofeng.personnelblog.entity.BlogComment;

import java.util.List;
import java.util.Map;

public interface BlogCommentDao {
    int deleteByPrimaryKey(Long commentId);
    int insert(BlogComment record);
    int insertSelective(BlogComment record);
    BlogComment selectByPrimaryKey(Long commentId);
    int updateByPrimaryKeySelective(BlogComment record);
    int updateByPrimaryKey(BlogComment record);
    List<BlogComment> findBlogCommentList(Map map);
    int getTotalBlogComments(Map map);
    int checkDone(Integer[] ids);
    int deleteBatch(Integer[] ids);
}
