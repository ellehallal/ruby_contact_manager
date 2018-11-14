class SaveToFile
  require 'json'
end

def add_contact_to_file(first_name, last_name, email_address, phone_number)
  json_string = File.read('contacts.json')
  current_contacts = JSON.load(json_string)
  current_contacts << {"first_name": first_name, "last_name": last_name, "email_address": email_address, "phone_number": phone_number}
  File.write('contacts.json')
end
