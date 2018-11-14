class SaveToFile
  require 'json'

  def initialize

  end

  def add_contact_to_file(first_name, last_name, email_address, phone_number)
    json_string = File.read('contacts.json')
    current_contacts = JSON.load(json_string)
    current_contacts << {"first_name": first_name, "last_name": last_name, "email_address": email_address, "phone_number": phone_number}
    File.write('contacts.json')
  end

  def get_contacts_from_file(filename)
    file_to_parse = File.read(filename)
    contacts_hash = JSON.parse(file_to_parse)
    contacts_hash
  end
end
