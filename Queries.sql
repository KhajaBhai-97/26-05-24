-----------------EXERCISE 1-----------------
1.Find the title of each film?
    SELECT title FROM movies;
2.Find the director of each film?
    SELECT director FROM movies;
3.Find the title and director of each film?
    SELECT title, director FROM movies;
4.Find the title and year of each film?
    SELECT title, year FROM movies;    
5.Find all the information about each film?
    SELECT * FROM movies;

-----------------EXERCISE 2-----------------
1.Find the movie with a row id of 6 ?
    SELECT * FROM movies where id = 6;
2.Find the movies released in the years between 2000 and 2010?
    SELECT * FROM movies where year BETWEEN 2000 AND 2010;
3.Find the movies not released in the years between 2000 and 2010?
    SELECT * FROM movies where year NOT BETWEEN 2000 AND 2010;
4.Find the first 5 Pixar movies and their release year?
    SELECT * FROM movies where id BETWEEN 1 AND 5;

------------------EXERCISE 3-----------------
1.Find all the Toy Story movies?
    SELECT * FROM movies where title LIKE '%Toy Story%';
2.Find all the movies directed by John Lasseter?
    SELECT * FROM movies where director = 'John Lasseter';
3.Find all the movies (and director) not directed by  John Lasseter?
    SELECT * FROM movies where director != 'John Lasseter';
4.Find all the WALL-* movies?
    SELECT * FROM movies where title LIKE 'WALL-%';

-----------------EXERCISE 4-----------------
1.List all directors of Pixar movies (alphabetically), without duplicates?
    SELECT distinct (director) FROM movies order by director asc;
2.List the last four Pixar movies released (ordered from most recent to least)?
    SELECT * FROM movies order by year desc limit 4;
3.List the first five Pixar movies sorted alphabetically by title?
    SELECT * FROM movies order by title asc limit 5;
4.List the next five Pixar movies sorted alphabetically?
    SELECT * FROM movies order by title asc limit 5 offset 5;

-----------------REVIEW 1-------------------
1.List all the Canadian cities and their populations?
    SELECT city,population FROM north_american_cities where country = 'Canada';
    SELECT * FROM north_american_cities where country = 'Canada';
2.Order all the cities in the United States by their latitude from north to south?
    SELECT * FROM north_american_cities where country = 'United States' order by latitude desc;
3.List all the cities west of Chicago, ordered from west to east?
    SELECT * FROM North_american_cities WHERE Longitude < -87.69 ORDER BY Longitude ASC;
4.List the two largest cities in Mexico (by population)?
    SELECT * FROM north_american_cities where country = 'Mexico' order by population desc limit 2;
5.List the third and fourth largest cities (by population) in the United States and their population?
    SELECT * FROM north_american_cities where country = 'United States' order by population desc limit 2 offset 2;

-----------------EXERCISE 6-----------------
1.Find the domestic and international sales for each movie?
    Select * from movies inner join boxoffice on movies.id = boxoffice.movie_id
2.Show the sales numbers for each movie that did better internationally rather than domestically?
    Select * from movies inner join boxoffice on id = movie_id where international_sales > domestic_sales
3.List all the movies by their ratings in descending order?
    Select * from movies inner join boxoffice on id = movie_id order by rating desc

-----------------EXERCISE 7-----------------
1.Find the list of all buildings that have employees?
    Select distinct building from employees
2.Find the list of all buildings and their capacity?
    Select * from buildings
3.List all buildings and the distinct employee roles in each building (including empty buildings)?
    Select distinct building_name, role from buildings left join employees on building_name = building

-----------------EXERCISE 8-----------------
1.Find the name and role of all employees who have not been assigned to a building?
    Select * from employees where building is null
2.Find the names of the buildings that hold no employees?
    Select building_name from buildings left join employees on building_name = building where name is null

-----------------EXERCISE 9-----------------
1.List all movies and their combined sales in millions of dollars?
    Select sum(domestic_sales + international_sales)/1000000, title from movies inner join boxoffice on id = movie_id group by title
2.List all movies and their ratings in percent?
    Select rating * 10, title from movies inner join boxoffice on id = movie_id
3.List all movies that were released on even number years?
    Select * from movies where year%2 ==0

-----------------EXERCISE 10-----------------
1.Find the longest time that an employee has been at the studio?
    Select max(years_employed) from employees 
2.For each role, find the average number of years employed by employees in that role?
    Select avg(years_employed), role from employees group by role
3.Find the total number of employee years worked in each building?
    SELECT sum(years_employed), building FROM employees group by building;

-----------------EXERCISE 11-----------------
1.Find the number of Artists in the studio (without a HAVING clause)
    Select count(*) from employees where role = 'Artist'
2.Find the number of Employees of each role in the studio
    Select role, count(*) from employees group by role
3.Find the total number of years employed by all Engineers
    Select sum(years_employed) from employees group by role having role = 'Engineer'

-----------------EXERCISE 12-----------------
1.Find the number of movies each director has directed
     Select count(*), director from movies group by director 
2.Find the total domestic and international sales that can be attributed to each director
    Select sum(domestic_sales + international_sales), director from movies inner join boxoffice on id = movie_id group by director

-----------------EXERCISE 13-----------------
1.Add the studios new production, Toy Story 4 to the list of movies (you can use any director)?
    insert into movies (id, title, director, year, length_minutes) values (15, 'Toy Story 4', 'Harry', 1997, 110);

2.Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table?
    insert into boxoffice (movie_id, rating, domestic_sales, international_sales) values (15, 8.7, 340000000, 270000000);

-----------------EXERCISE 14-----------------
1.The director for A Bugs Life is incorrect, it was actually directed by John Lasseter?
    update movies set director = 'John Lasseter' where title = "A Bug's Life";

2.The year that Toy Story 2 was released is incorrect, it was actually released in 1999?
    update movies set year = 1999 where title = 'Toy Story 2';

3.Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich?
    update movies set title='Toy Story 3', director='Lee Unkrich' where title = 'Toy Story 8';

------------------EXERCISE 15------------------
1.This database is getting too big, lets remove all movies that were released before 2005?
    delete from movies where year < 2005;

2.Andrew Stanton has also left the studio, so please remove all movies directed by him?
    delete from movies where director='Andrew Stanton';

-----------------EXERCISE 16-------------------
1.Create a new table named Database with the following columns:
– Name A string (text) describing the name of the database
– Version A number (floating point) of the latest version of this database
– Download_count An integer count of the number of times this database was downloaded
This table has no constraints.

     Create table if not exists database (name varchar, version float, download_count integer);

-----------------EXERCISE 17-------------------
1.Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in?
    alter table movies add  aspect_ratio float;

2.Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English?
    alter table movies add language varchar default 'English';

-----------------EXERCISE 18-------------------
1.We have sadly reached the end of our lessons, lets clean up by removing the Movies table?
    drop table if exists movies;
2.And drop the BoxOffice table as well?
    drop table if exists boxoffice;
