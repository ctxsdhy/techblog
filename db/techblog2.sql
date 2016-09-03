/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50629
Source Host           : localhost:3306
Source Database       : techblog2

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2016-09-03 21:54:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for techblog_category
-- ----------------------------
DROP TABLE IF EXISTS `techblog_category`;
CREATE TABLE `techblog_category` (
  `id` varchar(32) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `category_content` text,
  `image_url` varchar(200) DEFAULT '0',
  `image_key` varchar(32) DEFAULT NULL,
  `parent_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `order_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of techblog_category
-- ----------------------------
INSERT INTO `techblog_category` VALUES ('4028978153fe68490153fe75a2f00001', '我是1', '<p>试一试类型介绍1</p>', null, null, '0', '123', '1');
INSERT INTO `techblog_category` VALUES ('4028978153fef5380153fef5a8d60001', '我是', '', null, null, '4028978153fe68490153fe75a2f00001', '123', '2');
INSERT INTO `techblog_category` VALUES ('4028978153fef5380153fef5dabc0002', '我是', null, null, null, '4028978153fe68490153fe75a2f00001', '123', '1');
INSERT INTO `techblog_category` VALUES ('40289f20540ab2e801540ab9741a0000', '我是', null, null, null, '4028978153fef5380153fef5dabc0002', '123', null);
INSERT INTO `techblog_category` VALUES ('J7CENiYmsY96PTavrnvi2z', '233', null, null, null, '0', '123', null);
INSERT INTO `techblog_category` VALUES ('XVXjp1XNupZcau5aJG2fLb', '234', '<p>234</p>', null, null, '0', '123', null);

-- ----------------------------
-- Table structure for techblog_daily
-- ----------------------------
DROP TABLE IF EXISTS `techblog_daily`;
CREATE TABLE `techblog_daily` (
  `id` varchar(32) NOT NULL,
  `daily_name` varchar(100) DEFAULT NULL,
  `daily_content` text,
  `page_views` int(11) DEFAULT NULL,
  `page_reviews` int(11) DEFAULT NULL,
  `category_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of techblog_daily
-- ----------------------------
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6a40380000', '来吧来吧', null, null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:04:26', '2016-04-10 17:04:27');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330001', '最后一波', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p><p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:07:03', '2016-04-10 17:07:03');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330002', '最后一波66', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, null, '123', '2016-04-10 17:07:03', '2016-05-26 23:02:02');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330003', '最后一波', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:07:03', '2016-04-10 17:07:03');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330004', '最后一波', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:07:03', '2016-04-10 17:07:03');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330005', '最后一波', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:07:03', '2016-04-10 17:07:03');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330006', '最后一波', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:07:03', '2016-04-10 17:07:03');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330012', '最后一波', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:07:03', '2016-04-10 17:07:03');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330013', '最后一波', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:07:03', '2016-04-10 17:07:03');
INSERT INTO `techblog_daily` VALUES ('4028978153ff69880153ff6ca4330014', '最后一波', '<p>昨晚收到了人生中最大的一笔软文费，心里实在欢喜，禁不住想要在朋友圈里mark一下。想想群里的各级大咖们早已功成名就，自己这点小成绩也算不得什么，于是悄悄设置了分组，可见的朋友只有父母和老公。﻿</p><p>在亲密的家人面前总可以放肆的为自己骄傲一下吧。好想让父母知道，熬夜赶稿，苦读深思，码字这条路上的辛苦不会白白辜负。﻿</p><p>没想到今天一大早就收到了老妈的严厉的短信：将来有你哭的时候，这么大了还不成熟。唉!那一声拖在句末的叹息像巨石一般重重的砸在了我的心头。发生了什么？怎么了？我做错了什么？﻿</p><p>我赶紧打过电话询问，是爸爸接的，他欲言又止，短暂的沉默后挤出了一句话：“还是让你妈和你说吧。”然后是沉沉的喘息声，黯然喑哑不是什么好兆头。 老妈接过电话，一字一顿的阐述着他俩的观点：“我和你爸今早看到你发的朋友圈了，我们俩很生气。讨论了许久，还是决定要提醒你。你这么大了，还把这么一点点的小成绩晒到网上。你朋友圈里比你强的人怎么想？暂时不如你的人怎么想？你什么时候才能不动声色的成长，非要敲锣打鼓的炫耀吗？”﻿</p><p><br/><br/></p><p>文／米粒（简书签约作者）<br/>原文链接：http://www.jianshu.com/p/48221c8038e3<br/>著作权归作者所有，转载请联系作者获得授权，并标注“简书签约作者”。</p><p><br/></p>', null, null, '4028978153fe68490153fe75a2f00001', '123', '2016-04-10 17:07:03', '2016-04-10 17:07:03');
INSERT INTO `techblog_daily` VALUES ('402897815409ab06015409ab54380000', '123', '<pre class=\"brush:java;toolbar:false\">/**\r\n	&nbsp;*&nbsp;列表\r\n	&nbsp;*/\r\n	@ResponseBody\r\n	@RequestMapping(value&nbsp;=&nbsp;&quot;getListj&quot;,&nbsp;produces&nbsp;=&nbsp;{&nbsp;&quot;text/plain;charset=utf-8&quot;&nbsp;})\r\n	public&nbsp;String&nbsp;listj()&nbsp;throws&nbsp;Exception&nbsp;{\r\n		return&nbsp;JSON.toJSONString(categoryService.getList(Order.asc(&quot;orderId&quot;)));\r\n	}</pre><p>123<br/></p>', null, null, '0', '123', '2016-05-23 10:19:46', '2016-05-27 11:05:59');
INSERT INTO `techblog_daily` VALUES ('40289f2053fb6dd90153fb6fd3d60000', '淡淡的', '<p>233</p>', null, null, null, '123', '2016-04-09 22:32:03', '2016-04-09 22:32:03');
INSERT INTO `techblog_daily` VALUES ('6sSKsHjxHGsdW4snEuecPs', '23', '<p>23</p>', null, null, '0', '123', '2016-05-29 17:42:05', '2016-05-29 17:44:07');
INSERT INTO `techblog_daily` VALUES ('7xyp1FmzCnuwxoxcyggVMh', '71', '<p>7</p>', null, null, '0', '123', '2016-05-29 22:45:01', '2016-06-07 15:00:10');
INSERT INTO `techblog_daily` VALUES ('AT1EzTV2ufoxSnbAYmm57s', '123', '<p>123</p>', null, null, '0', '123', '2016-05-26 23:02:24', '2016-05-26 23:02:24');
INSERT INTO `techblog_daily` VALUES ('DjLNLUJLcABwuce2Q7bwm', '666', null, null, null, '0', '123', '2016-05-26 23:01:50', '2016-06-02 15:00:02');
INSERT INTO `techblog_daily` VALUES ('E3qfgEDLXraexAQ8wzkBtU', '666', '<pre class=\"brush:html;toolbar:false\">&lt;body&gt;\r\n		&lt;div&nbsp;class=&quot;r-main&quot;&gt;\r\n			&lt;div&nbsp;class=&quot;r-m-head&quot;&gt;\r\n				&lt;div&nbsp;class=&quot;r-m-h-title&quot;&gt;\r\n					日志管理&lt;a&nbsp;href=&quot;${path}/d/m/e&quot;&nbsp;class=&quot;btn&nbsp;btn-default&nbsp;btn-xs&quot;&nbsp;style=&quot;float:right;&nbsp;margin-right:12px;&quot;&gt;新建&lt;/a&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n			&lt;div&nbsp;class=&quot;r-m-list&quot;&gt;\r\n				&lt;c:if&nbsp;test=&quot;${&nbsp;!empty&nbsp;pageDailyList&nbsp;}&quot;&gt;\r\n					&lt;c:forEach&nbsp;items=&quot;${pageDailyList.list}&quot;&nbsp;var=&quot;item&quot;&gt;\r\n						&lt;div&nbsp;class=&quot;r-m-l-item&quot;&gt;\r\n							&lt;div&nbsp;class=&quot;r-m-l-head&quot;&gt;\r\n								&lt;a&nbsp;href=&quot;${path}/#d/${item.id}&quot;&nbsp;target=&quot;_blank&quot;&gt;${item.dailyName}&lt;/a&gt;\r\n							&lt;/div&gt;\r\n							&lt;div&nbsp;class=&quot;r-m-l-comment&quot;&gt;\r\n								&lt;a&nbsp;href=&quot;/d/m/e/${item.id}&quot;&nbsp;class=&quot;btn&nbsp;btn-default&nbsp;btn-xs&quot;&gt;编辑&lt;/a&gt;&amp;nbsp;\r\n								&lt;a&nbsp;href=&quot;#&quot;&nbsp;onclick=&quot;javascript:if(confirm(&#39;你确定要删除?&#39;)){location.href=&#39;/d/d/${item.id}&#39;;return&nbsp;true;}return&nbsp;false;&quot;&nbsp;class=&quot;btn&nbsp;btn-default&nbsp;btn-xs&quot;&gt;删除&lt;/a&gt;\r\n							&lt;/div&gt;\r\n						&lt;/div&gt;\r\n					&lt;/c:forEach&gt;\r\n				&lt;/c:if&gt;\r\n			&lt;/div&gt;\r\n			&lt;div&nbsp;class=&quot;r-m-footer&quot;&gt;\r\n				&lt;div&nbsp;class=&quot;r-m-f-main&quot;&gt;\r\n					&lt;div&nbsp;class=&quot;xpage&quot;&gt;&lt;/div&gt;\r\n				&lt;/div&gt;\r\n			&lt;/div&gt;\r\n		&lt;/div&gt;\r\n	&lt;/body&gt;</pre><p>666<br/></p>', null, null, '4028978153fef5380153fef5dabc0002', '123', '2016-05-26 22:41:47', '2016-05-27 11:05:12');
INSERT INTO `techblog_daily` VALUES ('EAKisYm2oRafyguPGDfvmR', '1', '<p>1</p>', null, null, '0', '123', '2016-05-29 17:39:59', '2016-05-29 17:40:00');
INSERT INTO `techblog_daily` VALUES ('HRdrQJsAbPnuLxxSCougbY', '512', '<p>512</p>', null, null, '0', '123', '2016-05-29 22:31:58', '2016-06-03 00:03:29');
INSERT INTO `techblog_daily` VALUES ('PHc7WP3Ey73RpmdkBBKXNU', '63', '<p>63</p>', null, null, '0', '123', '2016-05-29 22:32:42', '2016-06-03 00:03:38');

-- ----------------------------
-- Table structure for techblog_daily_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `techblog_daily_tag_relation`;
CREATE TABLE `techblog_daily_tag_relation` (
  `id` varchar(32) NOT NULL,
  `daily_id` varchar(32) NOT NULL,
  `tag_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of techblog_daily_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for techblog_tag
-- ----------------------------
DROP TABLE IF EXISTS `techblog_tag`;
CREATE TABLE `techblog_tag` (
  `id` varchar(32) NOT NULL,
  `tag_name` varchar(100) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of techblog_tag
-- ----------------------------

-- ----------------------------
-- Table structure for techblog_user
-- ----------------------------
DROP TABLE IF EXISTS `techblog_user`;
CREATE TABLE `techblog_user` (
  `id` varchar(32) NOT NULL,
  `login_name` varchar(100) NOT NULL,
  `login_pwd` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_content` text,
  `image_url` varchar(200) DEFAULT NULL,
  `image_key` varchar(32) DEFAULT NULL,
  `blog_name` varchar(100) DEFAULT NULL,
  `blog_content` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of techblog_user
-- ----------------------------
INSERT INTO `techblog_user` VALUES ('83J6xhF1KtBb8z6746bgb3', '233', '666', null, null, null, null, null, null, null, '2016-06-02 15:37:16');
INSERT INTO `techblog_user` VALUES ('AT1EzTV2ufoxSnbAYmm58s', 'xs', '123', null, null, null, null, null, null, null, '2016-03-31 00:00:00');
