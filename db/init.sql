CREATE DATABASE community_manage_sys DEFAULT CHARACTER SET UTF8;

insert into SYS_USER(name_, login_name_, password_,email_,phone_) VALUES ('管理员','admin','$2a$10$OZkHd5LbJmQcBs5NUwetL.xafO5ThfwIW3dYCwU514oVopgRmOghu','888@qq.com','13888888888');

insert into SYS_USER_ROLE(sys_user_id_, role_) values (1,'ROLE_ADMIN');