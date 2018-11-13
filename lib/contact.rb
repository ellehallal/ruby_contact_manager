class Contact
  require 'person'

  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def begin
    exit_contact_manager = "N"
    puts "Welcome to Contact Manager"
    while exit_contact_manager == "N"
      puts "What would you like to do? Please select a number from 1 - 5:"
      puts "1. Add a new contact"
      puts "2. View all contacts"
      puts "3. Search for a contact by first name"
      puts "4. Search for a contact by last name"
      puts "5. Exit Contact Manager"
      print ">"
      selection = $stdin.gets.chomp

      case selection
      when "1"
        create_new_entry
      when "2"
        while @contacts.empty?
          puts "You do not have any contacts. Would you like to add a new contact?"
          puts "Y / N"
          add_new_contact = $stdin.gets.chomp.upcase

          if add_new_contact == "Y"
            create_new_entry
          elsif add_new_contact == "N"
            break
          else
            puts "Sorry, that isn't a valid selection."
          end
        end

        if @contacts.empty? == false
          display_contacts
        end

      when "3"
        while @contacts.empty?
          puts "You do not have any contacts. Would you like to add a new contact?"
          puts "Y / N"
          add_new_contact = $stdin.gets.chomp.upcase

          if add_new_contact == "Y"
            create_new_entry
          elsif add_new_contact == "N"
            break
          else
            puts "Sorry, that isn't a valid selection."
          end
        end

        if @contacts.empty? == false
          puts "Please enter your search term:"
          search_for = $stdin.gets.chomp
          search_first_name(search_for)
        end

      when "4"
        while @contacts.empty?
          puts "You do not have any contacts. Would you like to add a new contact?"
          puts "Y / N"
          add_new_contact = $stdin.gets.chomp.upcase

          if add_new_contact == "Y"
            create_new_entry
          elsif add_new_contact == "N"
            break
          else
            puts "Sorry, that isn't a valid selection."
          end
        end

        if @contacts.empty? == false
          puts "Please enter your search term:"
          search_for = $stdin.gets.chomp
          search_last_name(search_for)
        end

      when "5"
        exit_contact_manager = "Y"
      end
    end
    puts "Thanks for using Contact Manager"
  end

  # private

  def create_new_entry
    puts "Please enter the first name below:"
    first = $stdin.gets.chomp.capitalize

    puts "Please enter the last name below:"
    last = $stdin.gets.chomp.capitalize

    puts "Please enter the email address below:"
    email = $stdin.gets.chomp.downcase

    puts "Please enter the phone number below:"
    phone = $stdin.gets.chomp


    new_contact = Person.new(first, last, email, phone)
    @contacts.push(new_contact.create_person_hash)
    sort_by_first_name

    puts ""
    puts "Here's your new contact:"
    puts "First name: #{new_contact.first_name}"
    puts "Last name: #{new_contact.last_name}"
    puts "Email address: #{new_contact.email_address}"
    puts "Phone number: #{new_contact.phone_number}"
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

  def sort_by_last_name
    @contacts.sort_by do |entry|
      entry[:last_name]
    end
  end

  def sort_by_first_name
    @contacts.sort_by! do |entry|
      entry[:first_name]
    end
  end


  def search_first_name(search_term)
    sort_by_first_name
    search = @contacts.select do |entry|
      entry[:first_name].start_with?(search_term.capitalize)
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
      entry[:last_name].start_with?(search_term.capitalize)
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

end
