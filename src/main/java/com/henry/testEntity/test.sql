select * from 정류장;

select * from bus;

alter table 버스
add BUSID var;

select * from passenger;

insert into 승객 values ('test001', 'test001', '123-456-7890');

commit;

select * from b_driver;

alter table 기사
add d_pw varchar2(50);

alter table 기사
drop column column1;

insert into 기사 values('testd001', 'testd001');

rename driver to 기사;

sqlplus;

select * from b_stop where nodenm='운천역';

update bus set b_id=Bus001 where b_id=1;

select * from passenger;

select * from s_info;
select * from r_info;
alter table r_info
rename column ri_id to routeid;
alter table r_info
drop column b_id;
alter table r_info
drop column ri_date;

update r_info set routeid='KJB43' where routeid='1';

create table r_info(
routeid varchar2(20) not null primary key,
routeno varchar2(20) not null,
endnodenm varchar2(50) not null,
startnodenm varchar2(50) not null
);

select count(nodeid)
from b_stop
group by nodenm;

alter table r_info
modify startnodenm null;
alter table r_info
modify routeno null;
alter table r_info
modify startnodenm varchar(300);

select * from b_stop;