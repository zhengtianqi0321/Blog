package com.guofeng.personnelblog.service;

import com.guofeng.personnelblog.entity.BlogLink;
import com.guofeng.personnelblog.utils.PageQueryUtil;
import com.guofeng.personnelblog.utils.PageResult;

import java.util.List;
import java.util.Map;

public interface LinkService {
    /**
     * 查询友链的分页数据
     */
    PageResult getBlogLinkPage(PageQueryUtil pageUtil);

    int getTotalLinks();

    Boolean saveLink(BlogLink link);

    BlogLink selectById(Integer id);

    Boolean updateLink(BlogLink tempLink);

    Boolean deleteBatch(Integer[] ids);

    /**
     * 返回友链页面所需的所有数据
     */
    Map<Byte, List<BlogLink>> getLinksForLinkPage();
}
