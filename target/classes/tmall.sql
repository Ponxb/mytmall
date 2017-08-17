
#创建user表
CREATE TABLE `user`(
id INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
)ENGINE = INNODB DEFAULT CHARSET=utf8;

#创建分类表
CREATE TABLE category(
id INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

#创建商品表
CREATE TABLE product(
id INT NOT NULL AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
subTitle VARCHAR(255) NOT NULL,
originalPrice FLOAT NOT NULL,
promotePricce FLOAT NOT NULL,
stock INT NOT NULL,
cid INT NOT NULL,
createDate DATETIME NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_product_category FOREIGN KEY(cid) REFERENCES category(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE productimage (
  id INT(11) NOT NULL AUTO_INCREMENT,
  pid INT(11) DEFAULT NULL,
  `type` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_productimage_product FOREIGN KEY (pid) REFERENCES product (id)
) ENGINE =INNODB DEFAULT CHARSET =utf8;

#创建属性表
CREATE TABLE property(
id INT NOT NULL AUTO_INCREMENT,
cid INT NOT NULL,
`name` VARCHAR(255) NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_property_category FOREIGN KEY(cid) REFERENCES category(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

#创建属性值表
CREATE TABLE propertyValue(
id INT NOT NULL AUTO_INCREMENT,
pid INT NOT NULL,
ptid INT NOT NULL,
`value` VARCHAR(255) NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_propertyvalue_product FOREIGN KEY(pid) REFERENCES product(id),
CONSTRAINT fk_propertyvalue_property FOREIGN KEY(ptid) REFERENCES property(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


#创建订单表
CREATE TABLE `order`(
id INT NOT NULL AUTO_INCREMENT,
uid INT NOT NULL,
orderCode VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL,
post VARCHAR(255) NOT NULL,
receiver VARCHAR(255) NOT NULL,
mobile VARCHAR(255) NOT NULL,
userMessage VARCHAR(255) NOT NULL,
createDate DATETIME DEFAULT NULL,
payDate DATETIME DEFAULT NULL,
deliveryDate DATETIME DEFAULT NULL,
confirmDate DATETIME DEFAULT NULL,
`status` VARCHAR(255) NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_order_user FOREIGN KEY(uid) REFERENCES `user`(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


#创建订单详情表
CREATE TABLE orderItem(
id INT NOT NULL AUTO_INCREMENT,
oid INT DEFAULT NULL,
pid INT NOT NULL,
uid INT NOT NULL,
number INT NOT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_orderitem_product FOREIGN KEY(pid) REFERENCES product(id),
CONSTRAINT fk_orderitem_user FOREIGN KEY(uid) REFERENCES `user`(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

#创建商品评价表
CREATE TABLE review(
id INT NOT NULL AUTO_INCREMENT,
uid INT NOT NULL,
pid INT NOT NULL,
createDate DATETIME NOT NULL,
content VARCHAR(255) DEFAULT NULL,
PRIMARY KEY(id),
CONSTRAINT fk_review_user FOREIGN KEY(uid) REFERENCES  `user`(id),
CONSTRAINT fk_review_product FOREIGN KEY(pid) REFERENCES product(id)
)ENGINE=INNODB DEFAULT CHARSET=utf8;





