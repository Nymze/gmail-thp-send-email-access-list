require 'gmail'
require 'mail'
require 'google_drive'
require 'pry'

#worksheet_key = "1sw0YH9W46NtcQ6UXIGWDnOqFUwEPGv4xJ6zlvF65o1g"

#Create a variable worksheet key with the key to access the google spreadsheet (on the related google drive)
# $mail connects to the allowed Gmail Account

worksheet_key = "your key here" # Replace this key with the key of your spreadsheet - don't forget to put your config.json file in the same folder

$gmail = Gmail.connect("", "") # put your logs here


#Create a methode to access the worksheet (through its keyà) on google drive => Using the Json file to log
def get_worksheet(worksheet_key)

$session = GoogleDrive::Session.from_config("config.json")
$ws = $session.spreadsheet_by_key(worksheet_key).worksheets[0]

end


# go through all the line of the column of the worksheet 
def go_through_all_the_lines(worksheet_key)

	data = []
	worksheet = get_worksheet(worksheet_key)

	# create an array called data in order to store all the emails

worksheet.rows.each do |row|

	# for each of line of the row we add it into the "data array"

	 data << row[1].gsub(/[[:space:]]/, '')
  end 
    
    return data
end

# send email methode (and the key as variable)

def send_gmail_to_listing(worksheet_key)


# first we connect to gmail with the $gmail variable (where our logs are stored)
	$gmail
	
#we go through each email adresse 
				# send we send (deliver) an email with subject + body

	go_through_all_the_lines(worksheet_key).each do |email|
		$gmail.deliver do
      to email
      subject "The Hacking Project" # write your subject here
      	text_part do 
      		body "je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à {townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec {townhall_name} !

Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80 "  #write your message here
			content_type 'text/plain; charset=UTF-8'
      	end
      end


  end

end

send_gmail_to_listing(worksheet_key)

