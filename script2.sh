#!/bin/sh
#insert only the people that are above 15 years and that have a valid gmail address.
mysql -s -N --user=root --password=root RecipesDB -e "insert into Users(username,password, email,age) select username, password, email, age from UsersTemp where email like '%@gmail.com' and age > 15;"

#we delete all the elements of UsersTemp database, as they have been inserted into the main one.
mysql --user=root --password=root RecipesDB -e " delete from UsersTemp;"

#delete duplicate mails in case an user introduced it twice/thrice/etc.
mysql --user=root --password=root RecipesDB -e "delete u1 from Users u1 INNER JOIN Users u2 where u1.uid > u2.uid and u1.email = u2.email;"
