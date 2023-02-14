 create database airline_booking_system;
 
 use airline_booking_system;

 
 create table user(
 userid varchar(30) primary key,
 fname varchar(30) not null,
 lname varchar(30) not null,
 dob date not null,
 gender varchar(6) not null,
 pincode varchar(10) not null
 );
 
 insert into user values("20110010411","Ram","Potheneni",'2002-05-12',"male",522438);
 insert into user values("20110010318","Sahi","Pendyala",'2002-11-23',"female",524789);
 insert into user values("20110011741","Seetha","Simhadri",'2003-12-11',"female",522417);
 
 
 
 create table user_contact(
 userid varchar(30) not null,
 mobile_no varchar(10) not null,
 primary key(userid,mobile_no),
 foreign key(userid) references user(userid)
 );
 
 insert into user_contact values("20110010411","7418529630");
 insert into user_contact values("20110010411","9632587014");
 insert into user_contact values("20110010318","8521479633");
 insert into user_contact values("20110011741","8462157934");
 insert into user_contact values("20110011741","9876543210");
 

 
 create table user_pincode(
 pincode varchar(10) primary key,
 state varchar(50) not null
 );
 
 insert into user_pincode values("522438","AP");
 insert into user_pincode values("524789","UP");
 insert into user_pincode values("522417","MP");
 


create table ticket(
eticket varchar(30) primary key,
userid varchar(30) not null,
flight_no varchar(30) not null,
class varchar(30) not null,
gate int not null,
seat_no int not null,
foreign key(userid) references user(userid)
);

insert into ticket values("123456789","20110010411","F123","First Class",6,10);
insert into ticket values("147852366","20110010411","F234","Economy",5,21);
insert into ticket values("254789136","20110010318","F222","First Class",5,10);
insert into ticket values("314785299","20110011741","F123","First Class",6,12);



create table ticket_flight_no(
flight_no varchar(30) primary key,
source varchar(30) not null,
destination varchar(30) not null,
date_time datetime not null
);

insert into ticket_flight_no values("F123","Hyderbad","Delhi",'2022-12-05 10:00:00');
insert into ticket_flight_no values("F222","Hyderbad","Mumbai",'2022-12-05 11:30:00');
insert into ticket_flight_no values("F234","Mumbai","Delhi",'2022-12-06 10:00:00');



create table payment(
transaction_id varchar(30) primary key,
eticket varchar(30) not null,
account_id long not null,
amount long not null,
foreign key(eticket) references ticket(eticket)
);

insert into payment values("T147258","123456789",287456985,30000);
insert into payment values("T258147","147852366",287456985,45000);
insert into payment values("T857424","254789136",211400524,25000);
insert into payment values("T365666","314785299",285963777,30000);



create table airline(
airline_name varchar(30) primary key,
contact_no varchar(30) not null
);

insert into airline values("DENMARK","7894561230");
insert into airline values("BAJAJ","7778889990");
insert into airline values("AMAZON","8528528521");



create table flight(
flight_no varchar(30) primary key,
airline_name varchar(30) not null,
flight_name varchar(30) not null,
dep_time time not null,
arr_time time not null,
seat_available int not null,
source varchar(30) not null,
destination varchar(30) not null,
foreign key(airline_name) references airline(airline_name)
);

insert into flight values("F123","DENMARK","DENMARK_F1",'10:00:00','14:00:00',20,"Hyderbad","Delhi");
insert into flight values("F222","AMAZON","AMAZON_F1",'11:30:00','13:00:00',22,"Hyderbad","Mumbai");
insert into flight values("F234","BAJAJ","BAJAJ_F1",'10:00:00','14:00:00',41,"Mumbai","Delhi");



create table class(
flight_no varchar(30) not null,
class_type varchar(30) not null,
fare long not null,
foreign key(flight_no) references flight(flight_no),
primary key(flight_no,class_type)
);

insert into class values("F123","First Class",30000);
insert into class values("F123","Economy",24000);
insert into class values("F234","First Class",50000);
insert into class values("F234","Economy",45000);
insert into class values("F222","First Class",25000);