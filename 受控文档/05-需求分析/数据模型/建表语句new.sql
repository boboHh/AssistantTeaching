/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/1/13 15:56:35                           */
/*==============================================================*/


drop table if exists Class_external_link;

drop table if exists "Table_ Article";

drop table if exists Table_Article_Linked;

drop table if exists Table_AskRoom;

drop table if exists Table_Ask_Message;

drop table if exists Table_Attribute;

drop table if exists Table_Attribute_Linked;

drop table if exists Table_Collection_Article;

drop table if exists Table_Collection_Column;

drop table if exists Table_Column_Linked;

drop table if exists Table_Comment_Attribute_Linked;

drop table if exists Table_Comment_Linked;

drop table if exists Table_Comment_List;

drop table if exists Table_Comment_To_Comment;

drop table if exists Table_Identification;

drop table if exists Table_Interest;

drop table if exists Table_Message;

drop table if exists Table_Own_Article_Linked;

drop table if exists Table_Own_Column_Linked;

drop table if exists Table_Special_Column;

drop table if exists Table_User;

drop table if exists contact_us;

drop table if exists friend_site;

drop table if exists info_recent;

drop table if exists user_know;

/*==============================================================*/
/* Table: Class_external_link                                   */
/*==============================================================*/
create table Class_external_link
(
   id                   char(10) not null,
   column_id            bigint,
   link_name            varchar(1000),
   link_content         varchar(4000),
   primary key (id)
);

/*==============================================================*/
/* Table: "Table_ Article"                                      */
/*==============================================================*/
create table "Table_ Article"
(
   article_title        varchar(80),
   article_content      varchar(100000),
   article_time         timestamp,
   article_id           bigint not null,
   article_type         varchar(20),
   primary key (article_id)
);

/*==============================================================*/
/* Table: Table_Article_Linked                                  */
/*==============================================================*/
create table Table_Article_Linked
(
   article_id           bigint not null,
   column_id            bigint not null,
   primary key (article_id, column_id)
);

/*==============================================================*/
/* Table: Table_AskRoom                                         */
/*==============================================================*/
create table Table_AskRoom
(
   id                   int not null,
   column_id            bigint,
   start_time           timestamp,
   end_time             timestamp,
   file_category        varchar(200),
   primary key (id)
);

/*==============================================================*/
/* Table: Table_Ask_Message                                     */
/*==============================================================*/
create table Table_Ask_Message
(
   user_id              varchar(20) not null,
   id                   int not null,
   message_type         int,
   message_time         timestamp,
   message_file         varchar(400),
   message_file_name    varchar(400),
   primary key (user_id, id)
);

/*==============================================================*/
/* Table: Table_Attribute                                       */
/*==============================================================*/
create table Table_Attribute
(
   time                 timestamp,
   id                   bigint not null,
   comment_num          int,
   pointed_num          bigint,
   good_num             int,
   primary key (id)
);

/*==============================================================*/
/* Table: Table_Attribute_Linked                                */
/*==============================================================*/
create table Table_Attribute_Linked
(
   article_id           bigint not null,
   id                   bigint not null,
   primary key (article_id, id)
);

/*==============================================================*/
/* Table: Table_Collection_Article                              */
/*==============================================================*/
create table Table_Collection_Article
(
   user_id              varchar(20) not null,
   article_id           bigint not null,
   primary key (user_id, article_id)
);

/*==============================================================*/
/* Table: Table_Collection_Column                               */
/*==============================================================*/
create table Table_Collection_Column
(
   user_id              varchar(20) not null,
   column_id            bigint not null,
   primary key (user_id, column_id)
);

/*==============================================================*/
/* Table: Table_Column_Linked                                   */
/*==============================================================*/
create table Table_Column_Linked
(
   column_id            bigint not null,
   id                   bigint not null,
   primary key (column_id, id)
);

/*==============================================================*/
/* Table: Table_Comment_Attribute_Linked                        */
/*==============================================================*/
create table Table_Comment_Attribute_Linked
(
   comment_id           bigint not null,
   id                   bigint not null,
   primary key (comment_id, id)
);

/*==============================================================*/
/* Table: Table_Comment_Linked                                  */
/*==============================================================*/
create table Table_Comment_Linked
(
   article_id           bigint not null,
   comment_id           bigint not null,
   primary key (article_id, comment_id)
);

/*==============================================================*/
/* Table: Table_Comment_List                                    */
/*==============================================================*/
create table Table_Comment_List
(
   comment_id           bigint not null,
   user_id              varchar(20),
   comment_content      longtext,
   comment_time         timestamp,
   primary key (comment_id)
);

/*==============================================================*/
/* Table: Table_Comment_To_Comment                              */
/*==============================================================*/
create table Table_Comment_To_Comment
(
   Tab_comment_id       bigint not null,
   comment_id           bigint not null,
   primary key (Tab_comment_id, comment_id)
);

/*==============================================================*/
/* Table: Table_Identification                                  */
/*==============================================================*/
create table Table_Identification
(
   id                   int not null,
   user_id              varchar(20),
   iden_introduce       varchar(2000),
   iden_zhengmingimage  longblob,
   iden_ispass          int,
   iden_time            timestamp,
   primary key (id)
);

/*==============================================================*/
/* Table: Table_Interest                                        */
/*==============================================================*/
create table Table_Interest
(
   Tab_user_id          varchar(20) not null,
   user_id              varchar(20) not null,
   primary key (Tab_user_id, user_id)
);

/*==============================================================*/
/* Table: Table_Message                                         */
/*==============================================================*/
create table Table_Message
(
   Tab_user_id          varchar(20) not null,
   user_id              varchar(20) not null,
   message_text         varchar(2000),
   message_time         timestamp,
   primary key (Tab_user_id, user_id)
);

/*==============================================================*/
/* Table: Table_Own_Article_Linked                              */
/*==============================================================*/
create table Table_Own_Article_Linked
(
   user_id              varchar(20) not null,
   article_id           bigint not null,
   primary key (user_id, article_id)
);

/*==============================================================*/
/* Table: Table_Own_Column_Linked                               */
/*==============================================================*/
create table Table_Own_Column_Linked
(
   user_id              varchar(20) not null,
   column_id            bigint not null,
   primary key (user_id, column_id)
);

/*==============================================================*/
/* Table: Table_Special_Column                                  */
/*==============================================================*/
create table Table_Special_Column
(
   column_id            bigint not null,
   column_name          varchar(200),
   column_introduce     varchar(6000),
   teacher_introduce    varchar(7000),
   primary key (column_id)
);

/*==============================================================*/
/* Table: Table_User                                            */
/*==============================================================*/
create table Table_User
(
   user_id              varchar(20) not null,
   user_pwd             varchar(20),
   user_mail            varchar(40),
   user_img             varchar(100),
   user_sign            int,
   user_shenfenid       varchar(20),
   user_realname        varchar(20),
   primary key (user_id)
);

/*==============================================================*/
/* Table: contact_us                                            */
/*==============================================================*/
create table contact_us
(
   id                   char(10) not null,
   contact_name         varchar(200),
   contact_content      varchar(400),
   primary key (id)
);

/*==============================================================*/
/* Table: friend_site                                           */
/*==============================================================*/
create table friend_site
(
   id                   char(10) not null,
   site_name            varchar(100),
   site_link            varchar(3000),
   primary key (id)
);

/*==============================================================*/
/* Table: info_recent                                           */
/*==============================================================*/
create table info_recent
(
   id                   char(10) not null,
   time                 timestamp,
   content              varchar(2000),
   primary key (id)
);

/*==============================================================*/
/* Table: user_know                                             */
/*==============================================================*/
create table user_know
(
   content              varchar(100000)
);

alter table Class_external_link add constraint FK_Relationship_4 foreign key (column_id)
      references Table_Special_Column (column_id) on delete restrict on update restrict;

alter table Table_Article_Linked add constraint FK_Table_Article_Linked foreign key (article_id)
      references "Table_ Article" (article_id) on delete restrict on update restrict;

alter table Table_Article_Linked add constraint FK_Table_Article_Linked2 foreign key (column_id)
      references Table_Special_Column (column_id) on delete restrict on update restrict;

alter table Table_AskRoom add constraint FK_include foreign key (column_id)
      references Table_Special_Column (column_id) on delete restrict on update restrict;

alter table Table_Ask_Message add constraint FK_Table_Ask_Message foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Ask_Message add constraint FK_Table_Ask_Message2 foreign key (id)
      references Table_AskRoom (id) on delete restrict on update restrict;

alter table Table_Attribute_Linked add constraint FK_Table_Attribute_Linked foreign key (article_id)
      references "Table_ Article" (article_id) on delete restrict on update restrict;

alter table Table_Attribute_Linked add constraint FK_Table_Attribute_Linked2 foreign key (id)
      references Table_Attribute (id) on delete restrict on update restrict;

alter table Table_Collection_Article add constraint FK_Table_Collection_Article foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Collection_Article add constraint FK_Table_Collection_Article2 foreign key (article_id)
      references "Table_ Article" (article_id) on delete restrict on update restrict;

alter table Table_Collection_Column add constraint FK_Table_Collection_Column foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Collection_Column add constraint FK_Table_Collection_Column2 foreign key (column_id)
      references Table_Special_Column (column_id) on delete restrict on update restrict;

alter table Table_Column_Linked add constraint FK_Table_Column_Linked foreign key (column_id)
      references Table_Special_Column (column_id) on delete restrict on update restrict;

alter table Table_Column_Linked add constraint FK_Table_Column_Linked2 foreign key (id)
      references Table_Attribute (id) on delete restrict on update restrict;

alter table Table_Comment_Attribute_Linked add constraint FK_Table_Comment_Attribute_Linked foreign key (comment_id)
      references Table_Comment_List (comment_id) on delete restrict on update restrict;

alter table Table_Comment_Attribute_Linked add constraint FK_Table_Comment_Attribute_Linked2 foreign key (id)
      references Table_Attribute (id) on delete restrict on update restrict;

alter table Table_Comment_Linked add constraint FK_Table_Comment_Linked foreign key (article_id)
      references "Table_ Article" (article_id) on delete restrict on update restrict;

alter table Table_Comment_Linked add constraint FK_Table_Comment_Linked2 foreign key (comment_id)
      references Table_Comment_List (comment_id) on delete restrict on update restrict;

alter table Table_Comment_List add constraint FK_Comment foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Comment_To_Comment add constraint FK_Table_Comment_To_Comment foreign key (Tab_comment_id)
      references Table_Comment_List (comment_id) on delete restrict on update restrict;

alter table Table_Comment_To_Comment add constraint FK_Table_Comment_To_Comment2 foreign key (comment_id)
      references Table_Comment_List (comment_id) on delete restrict on update restrict;

alter table Table_Identification add constraint FK_Relationship_2 foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Interest add constraint FK_Table_Interest foreign key (Tab_user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Interest add constraint FK_Table_Interest2 foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Message add constraint FK_Table_Message foreign key (Tab_user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Message add constraint FK_Table_Message2 foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Own_Article_Linked add constraint FK_Table_Own_Article_Linked foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Own_Article_Linked add constraint FK_Table_Own_Article_Linked2 foreign key (article_id)
      references "Table_ Article" (article_id) on delete restrict on update restrict;

alter table Table_Own_Column_Linked add constraint FK_Table_Own_Column_Linked foreign key (user_id)
      references Table_User (user_id) on delete restrict on update restrict;

alter table Table_Own_Column_Linked add constraint FK_Table_Own_Column_Linked2 foreign key (column_id)
      references Table_Special_Column (column_id) on delete restrict on update restrict;

