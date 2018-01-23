# gmail

Le programme marche avec 3 prog:

# 1 - scrap_mairies.rb : 
  Scrap les emails sur le site de la mairie du Val d'oise et les encapsule dans un Hash

# 2 - drive.rv : 

Note : penser à remplacer le "config.json" dans votre folder + key google spreadsheet correspondante


  Prends le Hash de scrap_mairies.rb et upload chacun des adresses dans une google spreadsheet

# 3 - gmail.rb

Note : penser à remplacer le "config.json" dans votre folder + key (ligne 11) + entrez vos logs dans " Gmail.connect("", "")" (ligne : 13)

  accede à la google spreadsheet (with a key) et envoi un email à chacun des adresses mails.

https://docs.google.com/spreadsheets/d/1f_aDUwBM57EnMAoiqRpZifR2dcLJzLHaBF49ap5WuHY/edit#gid=0

les emails dans la spreadsheet viennent d'un faux compte gmail (pour ne pas spammer les mails des mairies)

