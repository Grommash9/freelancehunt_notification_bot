from freelancehunt_bot.db.base import sync_create_con


def create_data_base():
    con, cur = sync_create_con()
    cur.execute('CREATE DATABASE IF NOT EXISTS dev_freelancehunt_bot ')

    cur.execute(f'select (index_name) from INFORMATION_SCHEMA.STATISTICS where TABLE_SCHEMA = "dev_freelancehunt_bot" ')
    index_list = [item[0] for item in cur.fetchall()]

    cur.execute('create table if not exists dev_freelancehunt_bot.skill_list ( '
                'skill_id   integer not null, '
                'skill_name text    not null, '
                'constraint skill_list_pk '
                'primary key (skill_id) ) ')

    if 'skill_list_skill_id_uindex' not in index_list:
        cur.execute('create unique index skill_list_skill_id_uindex '
                    'on dev_freelancehunt_bot.skill_list (skill_id) ')


    cur.execute('create table if not exists dev_freelancehunt_bot.user ( '
                'user_id      integer not null, '
                'user_api_key text    null, '
                'constraint user_pk '
                'primary key (user_id) ) ')

    if 'user_user_id_uindex' not in index_list:
        cur.execute('create unique index user_user_id_uindex '
                    'on dev_freelancehunt_bot.user (user_id) ')



    cur.execute('create table if not exists dev_freelancehunt_bot.users_skills ( '
                'record_id     integer auto_increment, '
                'user_id       integer not null, '
                'skill_id      integer not null, '
                'is_interested integer not null, '
                'constraint users_skills_pk '
                'primary key (record_id), '
                'constraint users_skills_skill_list_skill_id_fk '
                'foreign key (skill_id) references skill_list (skill_id) '
                'on update cascade on delete cascade, '
                'constraint users_skills_user_user_id_fk '
                'foreign key (user_id) references user (user_id) '
                'on delete cascade ) ')

    if 'users_skills_record_id_uindex' not in index_list:
        cur.execute('create unique index users_skills_record_id_uindex '
                    'on dev_freelancehunt_bot.users_skills (record_id) ')
    if 'users_skills_user_id_skill_id_uindex' not in index_list:
        cur.execute('create unique index users_skills_user_id_skill_id_uindex '
                    'on dev_freelancehunt_bot.users_skills (user_id, skill_id) ')



    cur.execute('create table if not exists dev_freelancehunt_bot.project_skills ( '
                'project_id integer not null, '
                'skill_id   integer not null, '
                'record_id integer auto_increment, '
                'constraint project_skills_skill_list_skill_id_fk '
                'foreign key (skill_id) references dev_freelancehunt_bot.skill_list (skill_id) '
                'on update cascade on delete cascade, '
                'constraint project_skills_pk '
                'primary key (record_id)) ')

    if 'project_skills_project_id_skill_id_uindex' not in index_list:
        cur.execute('create unique index project_skills_project_id_skill_id_uindex '
                    'on dev_freelancehunt_bot.project_skills (project_id, skill_id) ')
    if 'project_skills_record_id_uindex' not in index_list:
        cur.execute('create unique index project_skills_record_id_uindex '
                    'on dev_freelancehunt_bot.project_skills (record_id) ')

    cur.execute('create table if not exists dev_freelancehunt_bot.project_data ( '
                'project_id          integer auto_increment, '
                'project_website_id  integer not null, '
                'project_name        text    not null, '
                'project_description text    not null, '
                'url                 text    not null, '
                'constraint project_data_pk '
                'primary key (project_id), '
                'constraint project_data_project_skills_project_id_fk '
                'foreign key (project_id) references dev_freelancehunt_bot.project_skills (project_id) ) ')

    if 'project_data_project_id_uindex' not in index_list:
        cur.execute('create unique index project_data_project_id_uindex '
                     'on dev_freelancehunt_bot.project_data (project_id) ')




    con.commit()
    con.close()
