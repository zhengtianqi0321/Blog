package com.guofeng.personnelblog.dao;

import com.guofeng.personnelblog.entity.BlogTag;
import com.guofeng.personnelblog.entity.BlogTagCount;
import com.guofeng.personnelblog.utils.PageQueryUtil;

import java.util.List;

public interface BlogTagDao {
    int deleteByPrimaryKey(Integer tagId);
    int insert(BlogTag record);
    int insertSelective(BlogTag record);
    BlogTag selectByPrimaryKey(Integer tagId);
    BlogTag selectByTagName(String tagName);
    int updateByPrimaryKeySelective(BlogTag record);
    int updateByPrimaryKey(BlogTag record);
    List<BlogTag> findTagList(PageQueryUtil pageUtil);
    List<BlogTagCount> getTagCount();
    int getTotalTags(PageQueryUtil pageUtil);
    int deleteBatch(Integer[] ids);
    int batchInsertBlogTag(List<BlogTag> tagList);
}
