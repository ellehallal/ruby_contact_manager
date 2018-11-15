class ContactManager
  require 'contact'

  attr_reader :contact

  def initialize
    @contact = Contact.new
  end

  def begin
    exit_contact_manager = "N"
    puts "Welcome to Contact Manager"

    while exit_contact_manager == "N"
      puts "Please select a number from 1 - 5:"
      puts "1. Add a new contact"
      puts "2. View all contacts"
      puts "3. Search for a contact by first name"
      puts "4. Search for a contact by last name"
      puts "5. Exit Contact Manager"
      print ">"
      selection = $stdin.gets.chomp

      case selection
      when "1"
        @contact.create_new_entry
      when "2"
        while @contact.contacts.empty?
          puts "You do not have any contacts. Would you like to add a new contact?"
          puts "Y / N"
          add_new_contact = $stdin.gets.chomp.upcase

          if add_new_contact == "Y"
            @contact.create_new_entry
          elsif add_new_contact == "N"
            break
          else
            puts "Sorry, that isn't a valid selection."
          end
        end

        if @contact.contacts.empty? == false
          @contact.display_contacts
        end

      when "3"
        while @contact.contacts.empty?
          puts "You do not have any contacts. Would you like to add a new contact?"
          puts "Y / N"
          add_new_contact = $stdin.gets.chomp.upcase

          if add_new_contact == "Y"
            @contact.create_new_entry
          elsif add_new_contact == "N"
            break
          else
            puts "Sorry, that isn't a valid selection."
          end
        end

        if @contact.contacts.empty? == false
          puts "Please enter your search term:"
          search_for = $stdin.gets.chomp
          @contact.search_first_name(search_for)
        end

      when "4"
        while @contact.contacts.empty?
          puts "You do not have any contacts. Would you like to add a new contact?"
          puts "Y / N"
          add_new_contact = $stdin.gets.chomp.upcase

          if add_new_contact == "Y"
            @contact.create_new_entry
          elsif add_new_contact == "N"
            break
          else
            puts "Sorry, that isn't a valid selection."
          end
        end

        if @contact.contacts.empty? == false
          puts "Please enter your search term:"
          search_for = $stdin.gets.chomp
          @contact.search_last_name(search_for)
        end

      when "5"
        exit_contact_manager = "Y"

      else
        puts "Sorry, that is an invalid selection. Please try again."
      end
    end
    puts "Thanks for using Contact Manager."
  end
end
