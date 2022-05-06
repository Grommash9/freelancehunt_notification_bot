# 'create table if not exists project_data
# (
#     project_id          int auto_increment
#         primary key,
#     project_website_id  int  not null,
#     project_name        text not null,
#     project_description text not null,
#     url                 text not null,
#     time_added          int  not null,
#     constraint project_data_project_id_uindex
#         unique (project_id),
#     constraint project_data_project_website_id_uindex
#         unique (project_website_id)
# )
#     auto_increment = 12;
#
# create table if not exists skill_list
# (
#     skill_id   int  not null
#         primary key,
#     skill_name text not null,
#     constraint skill_list_skill_id_uindex
#         unique (skill_id)
# );
#
# create table if not exists project_skills
# (
#     project_id int not null,
#     skill_id   int not null,
#     record_id  int auto_increment
#         primary key,
#     constraint project_skills_project_id_skill_id_uindex
#         unique (project_id, skill_id),
#     constraint project_skills_record_id_uindex
#         unique (record_id),
#     constraint project_skills_project_data_project_id_fk
#         foreign key (project_id) references project_data (project_id)
#             on update cascade on delete cascade,
#     constraint project_skills_skill_list_skill_id_fk
#         foreign key (skill_id) references skill_list (skill_id)
#             on update cascade on delete cascade
# )
#     auto_increment = 11;
#
# create table if not exists user
# (
#     user_id      int  not null
#         primary key,
#     user_api_key text null,
#     constraint user_user_id_uindex
#         unique (user_id)
# );
#
# create table if not exists users_skills
# (
#     record_id     int auto_increment
#         primary key,
#     user_id       int not null,
#     skill_id      int not null,
#     is_interested int not null,
#     constraint users_skills_record_id_uindex
#         unique (record_id),
#     constraint users_skills_user_id_skill_id_uindex
#         unique (user_id, skill_id),
#     constraint users_skills_skill_list_skill_id_fk
#         foreign key (skill_id) references skill_list (skill_id)
#             on update cascade on delete cascade,
#     constraint users_skills_user_user_id_fk
#         foreign key (user_id) references user (user_id)
#             on delete cascade
# );
#
# '