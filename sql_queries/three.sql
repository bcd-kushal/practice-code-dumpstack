/*
===> Question:
Book(bookid,bookname,genre,author_name,price,date_of_publication,edition_number)

constraints:
each book id should begin with 'BK'
books written in following genres: detective, horror, thriller, fiction
minimum edition value = 1

queries:
find names of authors who wrote detective books
delete books published in 1988
find names and genres of all books in 2018 by M.N.Singhal
give a discount of 20% to all books
increase edition number of all books published in Dec,2021
*/

create table Book(
	bookid varchar2(5),
	bookname varchar2(25),
	genre varchar2(9),
	author_name varchar2(25),
	price number(4),
	date_of_publication date,
	edition_number number(3),
	constraint bookidPrimary primary key(bookid),
	constraint priceCheck check(price>0),
	constraint bookBeginsWith check(bookid like 'BK%'),
	constraint checkGenre check(genre in('detective','horror','fiction','thriller')),
	constraint checkEdition check(edition_number>0)
);

select author_name from Book
where lower(genre)='detective';

select * from Book
where to_char(date_of_publication,'yyyy')=1988;

delete from Book
where to_char(date_of_publication,'yyyy')=1988;

select bookname,genre from Book
where to_char(date_of_publication,'yyyy')=2018 and lower(author_name)='m.n.singhal';

update Book set price=0.8*price;

update Book set edition_number=1+edition_number
where to_char(date_of_publication,'mm-yyyy')='12-2021';