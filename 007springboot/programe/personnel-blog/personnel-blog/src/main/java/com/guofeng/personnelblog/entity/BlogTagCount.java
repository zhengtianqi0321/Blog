package com.guofeng.personnelblog.entity;

import lombok.Data;

/**
 * @Description 自定义实体
 * @author guofeng
 */
@Data
public class BlogTagCount {
    private Integer tagId;
    private String tagName;
    private Integer tagCount;
}
