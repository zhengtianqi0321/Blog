/*
 Navicat Premium Data Transfer

 Source Server         : MySQL-localhost-3306
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 24/06/2023 10:41:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin_user`;
CREATE TABLE `tb_admin_user`  (
  `admin_user_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(0) NULL DEFAULT 0 COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin_user
-- ----------------------------
INSERT INTO `tb_admin_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '系统管理员', 0);

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog`  (
  `blog_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
  `blog_title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客标题',
  `blog_sub_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客自定义路径url',
  `blog_cover_image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客封面图',
  `blog_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客内容',
  `blog_category_id` int(0) NOT NULL COMMENT '博客分类id',
  `blog_category_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客分类(冗余字段)',
  `blog_tags` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客标签',
  `blog_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '0-草稿 1-发布',
  `blog_views` bigint(0) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `enable_comment` tinyint(0) NOT NULL DEFAULT 0 COMMENT '0-允许评论 1-不允许评论',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------
INSERT INTO `tb_blog` VALUES (5, '测试', '', 'http://localhost:8080/admin/dist/img/rand/21.jpg', '测试', 25, '测试', '测试', 1, 5, 0, 0, '2023-06-23 18:20:59', '2023-06-23 18:20:59');
INSERT INTO `tb_blog` VALUES (6, '分销架构总结', '', 'http://localhost:8080/admin/dist/img/rand/38.jpg', '概述\n对于过往分销系统的经验总结。视角上会不区分实物及虚拟服务的分销。\n\n分销定义：将产品从生产者转移到消费者。\n\n分销职责：获客，服务(售前，售中，售后)。核心是通过不同分销渠道将产品能卖出去。\n\n在整体分销网络中可能涉及多级分销角色，如实物的批发商，零售商。\n\n商业模式\n商业模式上分：经销，代销。经销是分销商持有库存然后卖给消费者。代销是分销商不持有库存，卖出去时进行代销分账。经销对于分销商会有库存资金风险，但同时利润会高。代销则无库存资金风险但利润较低。\n\n而代销模式在自营链路中可以细分为底价加价及卖价返佣2种商业模式。本质上区别是自营怎么获利的模式。底价加价自营有定价权最终收益也取决于比供应商原价加价了多少。卖价返佣则自营没有定价权完全按比例抽佣。\n\n平台模式目前一般采用抽佣来获利。\n\n涉众\n抽象来看无论是实物电商，还是旅游或服务业分销，整体角色都包含了分销渠道，供应商，平台，消费者。分销渠道即包含了抖音，小程序等这些系统性的渠道，这种模式对于供应商来讲他可以将产品推到不同渠道售卖。分销渠道另外一个角色偏线下销售（人），这种模式下通常是分销商有自已的私域流量，能够触达到消费者替消费者/消费者自行下单完成交易。\n\n\n\n发展趋势\n发展趋势一定是和组织架构&具体业务行业相关的。\n\n去除组织架构因素，分销平台一定是分销渠道多元化，产品多样化（多行业，多行业组合），产品流转效率（分销商，供应商减少成本），服务精细化。\n\n分销渠道多元化底层的根本原因是解决供应商产品卖出去及卖得快的问题。\n\n产品多样化本质也是扩规模，只不过扩分销商渠道是从分销渠道视角扩，而产品多样化则是从产品维度扩展。\n\n产品流转效率：本质上是减少各参与角色的成本，提升经营收益。\n\n服务精细化：无论是实物还是旅游，整体服务都比较关键，只不过对于旅游会更注重服务（本质上旅游就是享受服务(酒店，景点)，而实物是有产品本身核心价值的）。\n\n业务大图\n业务大图是需要根据组织定位，愿景得出业务顶层设计。再拆解到规划执行。\n\n这部分涉及业务信息只做方法论层面的描述。\n\n虚化抽象来看，分销平台无论哪个行业整体大的目标都是：帮供应商卖出更多产品，让分销商买到好的产品。只不过不同的组织在不同阶段会侧重某一方。\n\n而在拆解目标时一般会将GMV做为大的目标方向，但底层客户核心价值：比如产品本身的质量服务也是一个核心指标。围绕GMV及产品质量服务整体可以完成业务的顶层设计。\n\n整体业务大图\n\n\n策略拆解\nGMV目标拆解\n拆解结论：分销渠道能力建设，分销模式沉淀，营销能力(引分销商)，商户关系能力建设(引供应商)。\n\n平台交易GMV公式=商品数*交易流量*转化率*单价。\n\n商品数\n可以从供应商维度拆解，入驻更多的供应商，让供应商发更多品就能实现这个目标。因此会有CRM供应商客户关系管理。而入驻供应商通常是业务销售去做招商。\n\n招商吸引点第一性原理是平台能帮你卖出更多的货，这个底层支撑是有足够的分销渠道，所以在初期分销渠道会做扩展，同时招商会相应并行。\n\n分销渠道扩展关键吸引点是价格及货品。价格在前期可以做营销活动。\n\n交易流量\n会受分销渠道数影响，在业务上会在不同阶段扩展不同的渠道。更细粒度不同渠道会有不同的分享爆光机制，因此在具体分销渠道还需要建立分享能力。\n\n转化率\n这块受价格及系统稳定性影响，价格这块更多是运营策略，不同阶段需要考虑竞品做价格管理。这中间可以利用平台营销做为调控。因此在板块上会有平台营销。系统稳定性更偏技术因素这里不做详述。\n\n单价\n取决于供应商本身的商品价格。这个价格会和行业类目挂勾。这个因素在业务阶段性聚集哪个行业打法会直接决定这个单价。\n\n服务拆解\n服务=响应及时率*满意度。\n\n响应及时率通常需要做服务能力监控及预测，后期做得比较好可以用专业机器人做简单服务问题承接。对于行业特性复杂度高的问题需要用人来回答，同时可借助服务陪训系统能力来帮助服务人员快带提升服务水平。同时辅助服务助手来提供服务人员专业素养。\n\n长中短期规划\n上述的业务大图是终局业务架构。在实际业务运行过程不同阶段会有不同的业务能力建设侧重点。\n\n业务前期\n主要是验证整体商业模式能run。通常围绕一个行业打深打透。因此此时建设重点在于能让模式运行起来，遵循最小可用原则。商业上会先布局分销渠道，同时引供应商入平台。\n\n业务中期\n扩规模，保服务质量，建壁垒。\n\n扩规模：营销策略，也有产品侧商品推荐（运营人工或智能）提升整体转化率。\n\n保服务质量：产品服务质量也会在这个阶段投入，如对于供应商不同的惩罚机制，如供应商清退，结算抽佣费率增加。\n\n建壁垒：分销网络规模，供应链金融，服务质量。分销网络规模本质上解决的是供应商核心关心货能出去的问题，供应链金融则是解决对分/供2方资金诉求，这背后需要强大的金融风控能力。服务质量围绕智能，专业，可靠3个方向进行建设。\n\n业务成熟期\n会考虑降本提效，如发品效率，资金运转效率。同时中期做的业务壁垒建设也会长期进行。\n\n在此时会考虑做其他行业类目扩展。\n\n技术架构\n围绕业务大图，技术初期核心建基础分销渠道能力，完成产品上货，交易，结算完整闭环能力。\n\n中期精细化建设营销，服务，CRM，深化导购选品能力，扩分销渠道。\n\n长期建设供应链金融，业务降本提效。\n\n考虑到后面多行业扩展的业务诉求，架构上对于交易，支付结算，产品架构及模型需要考虑此扩展。\n\n交易域需要抽象好交易流程，预留好业务扩展，交易本身是和行业强耦合，但同时可抽取一部分横向能力。行业强耦合的如有些行业有议价，交易履约规则不同。横向能力则是指库存扣减能力（支付前扣，支付后扣），交易支付超时能力，同时对于实物电商还有预售等交易模式。\n\n支付结算本身与行业耦合性低，需要做好支付方式的沉淀，对于不同行业线路的结算抽佣费率则是产品配置化。\n\n产品域则是从模型与领域架构上要做好行业扩展。模型上产品要以核心要素收敛到核心模型，不同行业则需要能够进行垂直扩展。同时后续还能够支持套餐等售卖能力。\n\n\n————————————————\n版权声明：本文为CSDN博主「剑八-」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。\n原文链接：https://blog.csdn.net/zhaozhenzuo/article/details/131350463', 25, '测试', '架构', 1, 1, 0, 0, '2023-06-24 09:43:25', '2023-06-24 09:43:25');

-- ----------------------------
-- Table structure for tb_blog_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_category`;
CREATE TABLE `tb_blog_category`  (
  `category_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
  `category_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分类的名称',
  `category_icon` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '分类的图标',
  `category_rank` int(0) NOT NULL DEFAULT 1 COMMENT '分类的排序值 被使用的越多数值越大',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_category
-- ----------------------------
INSERT INTO `tb_blog_category` VALUES (25, '测试', '/admin/dist/img/category/02.png', 3, 0, '2023-06-23 17:57:14');
INSERT INTO `tb_blog_category` VALUES (26, '个人博客', '/admin/dist/img/category/10.png', 1, 0, '2023-06-24 09:36:38');

-- ----------------------------
-- Table structure for tb_blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_comment`;
CREATE TABLE `tb_blog_comment`  (
  `comment_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `blog_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '关联的blog主键',
  `commentator` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '评论者名称',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
  `website_url` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '网址',
  `comment_body` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `comment_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论提交时间',
  `commentator_ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
  `reply_body` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `reply_create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  `comment_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否审核通过 0-未审核 1-审核通过',
  `is_deleted` tinyint(0) NULL DEFAULT 0 COMMENT '是否删除 0-未删除 1-已删除',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_comment
-- ----------------------------
INSERT INTO `tb_blog_comment` VALUES (26, 5, '游客', 'youke@qq.com', '', '游客测试', '2023-06-23 18:46:14', '', '', '2023-06-23 18:46:14', 1, 0);

-- ----------------------------
-- Table structure for tb_blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_tag`;
CREATE TABLE `tb_blog_tag`  (
  `tag_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
  `tag_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标签名称',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 0=否 1=是',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_tag
-- ----------------------------
INSERT INTO `tb_blog_tag` VALUES (134, '测试', 0, '2023-06-23 18:20:15');
INSERT INTO `tb_blog_tag` VALUES (135, 'java', 0, '2023-06-24 09:36:13');
INSERT INTO `tb_blog_tag` VALUES (136, '科技', 0, '2023-06-24 09:36:22');
INSERT INTO `tb_blog_tag` VALUES (137, '架构', 0, '2023-06-24 09:43:25');

-- ----------------------------
-- Table structure for tb_blog_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_tag_relation`;
CREATE TABLE `tb_blog_tag_relation`  (
  `relation_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '关系表id',
  `blog_id` bigint(0) NOT NULL COMMENT '博客id',
  `tag_id` int(0) NOT NULL COMMENT '标签id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 279 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_blog_tag_relation
-- ----------------------------
INSERT INTO `tb_blog_tag_relation` VALUES (279, 5, 134, '2023-06-23 18:20:59');
INSERT INTO `tb_blog_tag_relation` VALUES (280, 6, 137, '2023-06-24 09:43:25');

-- ----------------------------
-- Table structure for tb_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_config`;
CREATE TABLE `tb_config`  (
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '配置项的名称',
  `config_value` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '配置项的值',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`config_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_config
-- ----------------------------
INSERT INTO `tb_config` VALUES ('footerAbout', 'java', '2023-02-07 20:33:23', '2023-02-10 11:58:06');
INSERT INTO `tb_config` VALUES ('footerCopyRight', 'java', '2023-02-07 20:33:23', '2023-02-10 11:58:06');
INSERT INTO `tb_config` VALUES ('footerICP', 'java', '2023-02-07 20:33:23', '2023-02-10 11:58:06');
INSERT INTO `tb_config` VALUES ('footerPoweredBy', 'java', '2023-02-07 20:33:23', '2023-02-10 11:58:06');
INSERT INTO `tb_config` VALUES ('footerPoweredByURL', 'java', '2023-02-07 20:33:23', '2023-02-10 11:58:06');
INSERT INTO `tb_config` VALUES ('websiteDescription', 'java', '2023-02-07 20:33:23', '2023-06-24 09:30:46');
INSERT INTO `tb_config` VALUES ('websiteIcon', 'java', '2023-02-07 20:33:23', '2023-06-24 09:30:46');
INSERT INTO `tb_config` VALUES ('websiteLogo', 'java', '2023-02-07 20:33:23', '2023-06-24 09:30:46');
INSERT INTO `tb_config` VALUES ('websiteName', '个人博客系统', '2023-02-07 20:33:23', '2023-06-24 09:30:46');
INSERT INTO `tb_config` VALUES ('yourAvatar', '/admin/dist/img/emo.jpg', '2023-02-07 20:33:23', '2023-06-24 09:37:40');
INSERT INTO `tb_config` VALUES ('yourEmail', 'java', '2023-02-07 20:33:23', '2023-06-24 09:37:40');
INSERT INTO `tb_config` VALUES ('yourName', '系统管理员', '2023-02-07 20:33:23', '2023-06-24 09:37:40');

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link`  (
  `link_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
  `link_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '友链类别 0-友链 1-推荐 2-个人网站',
  `link_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '网站名称',
  `link_url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '网站链接',
  `link_description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '网站描述',
  `link_rank` int(0) NOT NULL DEFAULT 0 COMMENT '用于列表排序',
  `is_deleted` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除 0-未删除 1-已删除',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_link
-- ----------------------------
INSERT INTO `tb_link` VALUES (20, 1, 'csdn', 'https://www.csdn.net/', '搬砖必备', 0, 0, '2023-06-23 18:50:14');

SET FOREIGN_KEY_CHECKS = 1;
