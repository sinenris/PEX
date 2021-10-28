#!/bin/sh

#This query will save into /home/cami/weekly_statistics2.txt 2 lines:
#on line one: "rid,cnt"
#on line two: <rid_value>,<number_of_occurences>
#rid = recipe id, cnt= how many times a recipe has appeared.
#This query will select and return the recipe id with the most occurences within the Reviews DB (basically, the most popular one).
echo "select rid, count(rid) as cnt from Reviews GROUP BY rid ORDER BY cnt DESC LIMIT 1;" | mysql --user=root --password=root RecipesDB | sed s/\\t/,/g > /home/cami/weekly_statistics2.txt


#now, we only need the second line, where we have our data!
second_line=`sed -n '2p' /home/cami/weekly_statistics2.txt`

#now we only need the first value of our data, our rid.
variable=`echo $second_line | awk -F ',' '{print $1}'`;

#we select the name of our recipe based on the acquired RID, and we save it into /home/cami/weekly_statistics2.txt
echo "select name from Recipes where rid=$variable;" | mysql -sN --user=root --password=root RecipesDB | sed s/\\t/,/g > /home/cami/weekly_statistics2.txt

#we copy it to /var/www/html/weekly_statistics2.txt
cp /home/cami/weekly_statistics2.txt /var/www/html/weekly_statistics2.txt
