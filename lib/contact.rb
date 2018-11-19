class Contact
  require 'json'
  require 'colorize'

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
    sort_by_key("first_name")

    clear_screen

    puts ""
    puts "Here's your new contact:"
    puts "First name: #{first}".colorize(:green)
    puts "Last name: #{last}".colorize(:green)
    puts "Email address: #{email}".colorize(:green)
    puts "Phone number: #{phone}".colorize(:green)
    puts ""

  end

  def display_contacts
    clear_screen
    puts "Here are your contacts:"
    puts ""

    @contacts.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:cyan)
      end
      puts ""
    end
  end


  def sort_by_key(key)
    @contacts.sort_by! do |entry|
      entry[key]
    end
  end


  def search_first_name(search_term)
    search = @contacts.select do |entry|
      entry["first_name"].start_with?(search_term.capitalize)
    end

    clear_screen

    puts "Contacts with first names starting with #{search_term.capitalize}:"
    puts ""
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:yellow)
      end
      puts ""
    end
  end

  def search_last_name(search_term)
    search = @contacts.select do |entry|
      entry["last_name"].start_with?(search_term.capitalize)
    end

    clear_screen

    puts "Contacts with last names starting with #{search_term.capitalize}:"
    puts ""
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:yellow)
      end
      puts ""
    end
  end

  def search_email(search_term)
    search = @contacts.select do |entry|
      entry["email_address"].start_with?(search_term.downcase)
    end

    clear_screen

    puts "Contacts with an email address starting with #{search_term.downcase}:"
    puts ""
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:yellow)
      end
      puts ""
    end
  end

  def search_phone(search_term)
    search = @contacts.select do |entry|
      entry["phone_number"].start_with?(search_term.downcase)
    end

    clear_screen

    puts "Contacts with a phone number starting with #{search_term}:"
    puts ""
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:yellow)
      end
      puts ""
    end
  end

  def delete_contact
    puts ""
    @contacts.each_with_index do |entry, index|
      puts "#{index + 1}:"
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:magenta)
      end
      puts ""
    end

    deleted_contact = []

    if @contacts.length == 1
      deleted_contact << @contacts[0]
      @contacts.delete_at(0)
    else
      puts "Please select which contact you wish to delete (select a number)"

      selection = get_selection

      index_to_delete = selection -= 1
      deleted_contact << @contacts[index_to_delete]
      @contacts.delete_at(index_to_delete)
    end

    File.open("./lib/contacts.json","w") do |file|
      file.write @contacts.to_json
    end

    clear_screen
    puts ""
    deleted_contact.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:red)
      end
      puts "The contact above has been deleted"
      puts ""
    end
  end

  def edit_contact
    puts ""
    @contacts.each_with_index do |entry, index|
      puts "#{index + 1}:"
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:magenta)
      end
      puts ""
    end

    edited_contact = []

    # if @contacts.length == 1
    #   deleted_contact << @contacts[0]
    #   @contacts.delete_at(0)
    # else
      puts "Please select which contact you wish to edit (select a number)"

      selection = get_selection

      index_to_edit = selection -= 1
      puts ""
      puts "What detail would you like to edit? (Select 1 - 4)"
      puts "1. First name"
      puts "2. Last name"
      puts "3. Email address"
      puts "4. Phone number"

      edit_selection = $stdin.gets.chomp

      case edit_selection
      when "1"
        puts "Please enter the new first name:"
        new_detail = $stdin.gets.chomp
        @contacts[index_to_edit]["first_name"] = new_detail

      when "2"
        puts "Please enter the new last name:"
        new_detail = $stdin.gets.chomp
        @contacts[index_to_edit]["last_name"] = new_detail

      when "3"
        puts "Please enter the new email address:"
        new_detail = $stdin.gets.chomp
        @contacts[index_to_edit]["email_address"] = new_detail

      when "4"
        puts "Please enter the new phone number:"
        new_detail = $stdin.gets.chomp
        @contacts[index_to_edit]["phone_number"] = new_detail

      else
        puts "Sorry, that isn't a valid selection. Please try again."
      end

      edited_contact << @contacts[index_to_edit]



    # end

    File.open("./lib/contacts.json","w") do |file|
      file.write @contacts.to_json
    end

    clear_screen
    puts ""
    edited_contact.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}".colorize(:red)
      end
      puts "The contact above has been edited"
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

  private

  def get_selection
    selection = $stdin.gets.chomp.to_i
    while (1..@contacts.length).to_a.include?(selection) == false
      puts "You've entered an invalid selection. Please try again:"
      selection = $stdin.gets.chomp.to_i
    end
    selection
  end

  def clear_screen
    print "\e[2J\e[f"
  end

end
