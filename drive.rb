require 'google_drive'
require_relative 'scrap_mairies'
require 'json'
require 'pry'

$data = get_hash

# create a methode that access to the drive and set up the spreadsheet

def setup_spreadsheet

session = GoogleDrive::Session.from_config("config.json")
$ws = session.spreadsheet_by_title("emails").worksheets[0]
 $ws[1, 1] = "Mairie"
  $ws[1, 2] = "Adresse mail"
  $ws.save

end

# create a methode that get takes the hash and prints it on the google drive spreadsheet
		# by selection the position of the ligne and row ([i,1]) then we increment i in order to go to the next line (on the same row)

def upload_hash

	# initialize/connect to the google spreadsheet
	setup_spreadsheet
	# give a value of 2 to i in order to increment it later (ex : i += 1)
	i = 2
	# for each email we set it up as a key and by incrementing i we go from one row to the next.
	$data.keys.each do |key|
	$ws[i,1] = key
	$ws[i,2] = $data[$ws[i,1]]  
	i += 1 
	end
  $ws.save	
end

# we initialize the method above

upload_hash
