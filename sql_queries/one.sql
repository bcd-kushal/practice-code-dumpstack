/*
===> Question:
Flight(FlightNo, Destination, Eco_fare, Business_fare, No_of_crews)

max(eco_fare) = 5000
min(business_fare) = 3000
destinations = pune , delhi , bangalore, hyderabad.
single flight <= 7 crews.

queries:
display details of all flights to pune
display no of crews in flight to hyderabad and delhi
display fare chart of all flights
display no of flights to bangalore
display max and min eco class fares
*/

create table Flight(
	FlightNo number(6),
	Destination varchar2(9),
	Eco_fare number(4),
	Business_fare number(6),
	No_of_crews number(1),
	constraint isPrimaryFlight primary key(FlightNo),
	constraint checkEcoFare check(Eco_fare<=5000),
	constraint checkBusinessFare check(Business_fare>=3000),
	constraint checkDestination check(Destination in ('Pune','Delhi','Bangalore','Hyderabad')),
	constraint checkTotalCrew check(No_of_crews<=7)
);

select * from Flight 
where Destination='Pune';

select sum(No_of_crews) "Crews in flight Hyderabad and Delhi = " from Flight 
where Destination in ('Hyderabad','Delhi');

select FlightNo,Eco_fare,Business_fare,Destination from Flight;

select count(*) "Total flights to Bangalore = " from Flight 
where Destination="Bangalore";

select max(Eco_fare) "Max Economy class fare = " from Flight; 

select min(Eco_fare) "Min Economy class fare = " 
from Flight;