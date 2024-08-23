package com.guofeng.personnelblog.service;


import com.guofeng.personnelblog.entity.BlogTagCount;
import com.guofeng.personnelblog.utils.PageQueryUtil;
import com.guofeng.personnelblog.utils.PageResult;

import java.util.List;

public interface TagService {

    /**
     * 查询标签的分页数据
     */
    PageResult getBlogTagPage(PageQueryUtil pageUtil);

    int getTotalTags();

    Boolean saveTag(String tagName);

    Boolean deleteBatch(Integer[] ids);

    List<BlogTagCount> getBlogTagCountForIndex();
}
