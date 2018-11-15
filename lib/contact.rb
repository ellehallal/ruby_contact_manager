class Contact
  require 'json'

  attr_reader :contacts

  def initialize
    @contacts = []
    self.get_contacts_from_file('./lib/contacts.json').each do |contact|
      @contacts << contact
    end
  end

  def create_new_entry
    puts "Please enter the first name below:"
    first = $stdin.gets.chomp.capitalize

    puts "Please enter the last name below:"
    last = $stdin.gets.chomp.capitalize

    puts "Please enter the email address below:"
    email = $stdin.gets.chomp.downcase

    puts "Please enter the phone number below (e.g. 07999000111):"
    phone = $stdin.gets.chomp.scan(/\d+/).join

    add_contact_to_file(first, last, email, phone)
    @contacts << {"first_name" => first, "last_name" => last, "email_address" => email, "phone_number" => phone}
    sort_by_first_name

    puts ""
    puts "Here's your new contact:"
    puts "First name: #{first}"
    puts "Last name: #{last}"
    puts "Email address: #{email}"
    puts "Phone number: #{phone}"
    puts ""

  end

  def display_contacts
    puts "Here are your contacts:"
    puts ""

    @contacts.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end
  end

  def sort_by_first_name
    @contacts.sort_by! do |entry|
      entry["first_name"]
    end
  end


  def search_first_name(search_term)
    sort_by_first_name
    search = @contacts.select do |entry|
      entry["first_name"].start_with?(search_term.capitalize)
    end

    puts "Contacts with first names starting with #{search_term.capitalize}:"
    puts ""
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end
  end

  def search_last_name(search_term)
    sort_by_first_name
    search = @contacts.select do |entry|
      entry["last_name"].start_with?(search_term.capitalize)
    end

    puts "Contacts with last names starting with #{search_term.capitalize}:"
    puts ""
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end
  end

  def search_email(search_term)
    sort_by_first_name
    search = @contacts.select do |entry|
      entry["email_address"].start_with?(search_term.downcase)
    end

    puts "Contacts with an email address starting with #{search_term.downcase}:"
    puts ""
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end
  end

  def search_phone(search_term)
    sort_by_first_name
    search = @contacts.select do |entry|
      entry["phone_number"].start_with?(search_term.downcase)
    end

    puts "Contacts with a phone number starting with #{search_term}:"
    puts ""
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end
  end

  def delete_contact
    puts "Please select which contact you wish to delete (select a number)"
    puts ""
    @contacts.each_with_index do |entry, index|
      puts "#{index + 1}:"
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end

    selection = $stdin.gets.chomp.to_i
    index_to_delete = selection -= 1

    deleted_contact = []
    deleted_contact << @contacts[index_to_delete]
    @contacts.delete_at(index_to_delete)

    deleted_contact.each do |entry|
      puts "The following contact has been deleted:"
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end

  end


  def add_contact_to_file(first_name, last_name, email_address, phone_number)
    json_string = File.read('./lib/contacts.json')
    current_contacts = JSON.load(json_string)
    current_contacts << {first_name: first_name, last_name: last_name, email_address: email_address, phone_number: phone_number}
    File.write('./lib/contacts.json', current_contacts.to_json)
  end

  def get_contacts_from_file(filename)
    file_to_parse = File.read(filename)
    contacts_hash = JSON.parse(file_to_parse)
    contacts_hash
  end

end
