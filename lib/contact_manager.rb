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
      puts "3. Sort by..."
      puts "4. Search for a contact"
      puts "5. Delete a contact"
      puts "6. Exit Contact Manager"
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
          puts "Sort by:"
          puts "1. First name"
          puts "2. Last name"
          puts "3. Email address"

          sort_selection = $stdin.gets.chomp

          case sort_selection
          when "1"
            @contact.sort_by("first_name")
            @contact.display_contacts
          when "2"
            @contact.sort_by("last_name")
            @contact.display_contacts
          when "3"
            @contact.sort_by("email_address")
            @contact.display_contacts
          else
            puts "Sorry, that's an invalid selection. Please try again"
          end
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
          puts "Search by:"
          puts "1. First name"
          puts "2. Last name"
          puts "3. Email address"
          puts "4. Phone number"

          selection = $stdin.gets.chomp

          case selection
          when "1"
            puts "Please enter your search term:"
            search_for = $stdin.gets.chomp
            @contact.search_first_name(search_for)
          when "2"
            puts "Please enter your search term:"
            search_for = $stdin.gets.chomp
            @contact.search_last_name(search_for)

          when "3"
            puts "Please enter your search term:"
            search_for = $stdin.gets.chomp
            @contact.search_email(search_for)

          when "4"
            puts "Please enter your search term:"
            search_for = $stdin.gets.chomp
            @contact.search_phone(search_for)

          when "5"
            puts "Sorry, that's an invalid selection. Please try again:"
          end
        end

      when "5"
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
          @contact.delete_contact
        end

      when "6"
        exit_contact_manager = "Y"

      else
        puts "Sorry, that is an invalid selection. Please try again."
      end
    end
    puts "Thanks for using Contact Manager."
  end
end
