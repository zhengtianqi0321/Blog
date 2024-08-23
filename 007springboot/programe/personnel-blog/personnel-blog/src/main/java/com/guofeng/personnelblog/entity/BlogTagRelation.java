package com.guofeng.personnelblog.entity;

import lombok.Data;
import java.util.Date;

/**
 * @author guofeng
 */
@Data
public class BlogTagRelation {
    private Long relationId;
    private Long blogId;
    private Integer tagId;
    private Date createTime;

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", relationId=").append(relationId);
        sb.append(", blogId=").append(blogId);
        sb.append(", tagId=").append(tagId);
        sb.append(", createTime=").append(createTime);
        sb.append("]");
        return sb.toString();
    }
}
