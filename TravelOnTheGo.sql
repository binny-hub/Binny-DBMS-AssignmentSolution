/* I have introduced Foreign and Primary Key after raising the ticket on this
Defined the schema accordingly
*/

create database TravelOnTheGo;
use TravelOnTheGo;
create table Price(Id int auto_increment Primary Key, Bus_Type varchar(10) not null, Distance int not null, price int not null);
insert into price(Bus_Type, Distance, Price) values ("Sleeper", 350, 770);
insert into price(Bus_Type, Distance, Price) values ("Sleeper", 500, 1100);
insert into price(Bus_Type, Distance, Price) values ("Sleeper", 600, 1320);
insert into price(Bus_Type, Distance, Price) values ("Sleeper", 700, 1540);
insert into price(Bus_Type, Distance, Price) values ("Sleeper", 1000, 2200);
insert into price(Bus_Type, Distance, Price) values ("Sleeper", 1200, 2640);
insert into price(Bus_Type, Distance, Price) values ("Sleeper", 350, 434);
insert into price(Bus_Type, Distance, Price) values ("Sitting", 500, 620);
insert into price(Bus_Type, Distance, Price) values ("Sitting", 600, 744);
insert into price(Bus_Type, Distance, Price) values ("Sitting", 700, 868);
insert into price(Bus_Type, Distance, Price) values ("Sitting", 1000, 1240);
insert into price(Bus_Type, Distance, Price) values ("Sitting", 1200, 1488);
insert into price(Bus_Type, Distance, Price) values ("Sitting", 1500, 1860);
select * from price;

create table Passenger( Passenger_id int auto_increment Primary key,  
Passenger_Name varchar(20), Category varchar(10) not null, Gender varchar(1), 
Boarding_City varchar(15) not null, Destination_city varchar(15), 
id int, Foreign Key(id) references Price(id));
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Sejal", "AC", "F", "Bengaluru", "Chennai", 1);
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Anmol", "Non-AC", "M", "Mumbai", "Hyderabad", 10);
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Pallavi", "AC", "F", "Panaji", "Bengaluru",  3);
insert into price(Bus_Type, Distance, Price) values( "Sleeper", 2000, 3000);
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Khusboo", "AC", "F", "Chennai", "Mumbai", 14);
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Udit", "Non-AC", "M", "Trivandrum", "Panaji", 5);
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Ankur", "AC", "M", "Nagpur", "Hyderabad", 8);
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Hemant", "Non-AC", "M", "Panaji", "Mumbai", 4);
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Manish", "Non-AC", "M", "Hyderabad","Bengaluru",  8);
insert into Passenger(Passenger_name, Category, Gender, Boarding_City, Destination_City, id) 
values("Piyush", "AC", "M", "Pune", "Nagpur", 10);
select * from passenger;

-- Q 3
select Gender, count(Gender) as " No of PAssengers travelling minimum 600 km" 
from Passenger P, Price Pr
where P.Id = Pr.Id and Pr.distance >=600
group by Gender;

-- Q 4

Select min(price) from Price where Bus_Type = "Sleeper";

-- Q5
Select Passenger_name from Passenger where Passenger_name like "S%";

-- Q6
Select P.PAssenger_name, P.Boarding_City, P.Destination_City, Pr.Bus_Type, Pr.Price
from Passenger P, Price pr
where P.Id = Pr.Id;

-- Q 7
Select P.Passenger_name, Pr.price 
from Passenger P, Price pr
where P.id= Pr.Id
and Pr.Bus_Type = "Sitting" and Pr.Distance = 1000;
 
 -- Q8
Select Price , Bus_Type from Price
where distance = (Select B.distance from PAssenger A , Price B
where Passenger_name = "Pallavi" and Boarding_City = "Panaji" 
and Destination_City = "Bengaluru" and A.id = B.id);

-- Q 9
select distinct distance
from Price A, Passenger B
where A.id = B.id
order by distance desc;

-- Q10
Select P.passenger_name , ((B.distance)/(Select sum(distance) 
from passenger P, Price B where P.id= B.id)) *100 as " Percentage Travelled"
from Passenger P, Price B where P.id = B.id; 

-- Q11
Select Distance, price,
case
  when price >1000 then "Expensive"
  when price >500 then " Average Cost"
  else "Cheap"
end as Categories
from Price;
  