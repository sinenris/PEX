#!/bin/sh

#The next line will select a random recipe from all of our Recipes, compose a message and write it into mesaj.txt.
mysql -s -N --user=root --password=root RecipesDB -e "select * from Recipes ORDER BY RAND() LIMIT 1;" | awk -F'\t' '{print "Hi! Thank you so much for choosing our website! Your daily recipe is here.\nToday, you could be cooking ", $2, "!\nFor this, you will need ", $3, ".\nThis recipe will occupy around ", $5, "minutes of your time.\nHere you have a short guide.\n", $4,"\n\nWe hope you will love it, and happy cooking!" > "/home/cami/mesaj.txt"}'

#The next line will select all the mails of subscribed users and add them to mail_list.txt
echo "select * from Users" | mysql --user=root --password=root RecipesDB | sed s/\\t/,/g | grep -o '[^,]*@gmail.com[^,]*' > /home/cami/mail_list.txt

#We go through each gmail in our list, and we compose a mail for them, respecting the requirements imposed by SSMTP.
cat /home/cami/mail_list.txt | while read line
do
	echo "To:$line" > /home/cami/text_to_send.txt
	echo "From:cezara.camelia@gmail.com" >> /home/cami/text_to_send.txt
	echo "Subject: Recipe" >> /home/cami/text_to_send.txt
	echo >> /home/cami/text_to_send.txt

	cat /home/cami/mesaj.txt >> /home/cami/text_to_send.txt

	#Sending the mail
	sendmail -t < /home/cami/text_to_send.txt

done


