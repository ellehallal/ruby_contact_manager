class ContactManager
  require 'contact'

  attr_reader :contact

  def initialize
    @contact = Contact.new
  end

  def begin
    exit_contact_manager = "N"
    clear_screen
    puts ""
    puts "Welcome to Contact Manager"

    while exit_contact_manager == "N"
      puts "Please select a number from 1 - 7:"
      puts "1. Add a new contact"
      puts "2. View all contacts"
      puts "3. Sort by..."
      puts "4. Search for a contact"
      puts "5. Edit a contact"
      puts "6. Delete a contact"
      puts "7. Exit Contact Manager"
      print ">"
      selection = $stdin.gets.chomp

      case selection
      when "1"
        @contact.create_new_entry
      when "2"
        empty_contacts

        if @contact.contacts.empty? == false
          @contact.display_contacts
        end

      when "3"
        empty_contacts

        if @contact.contacts.empty? == false
          puts "Sort by:"
          puts "1. First name"
          puts "2. Last name"
          puts "3. Email address"

          sort_selection = $stdin.gets.chomp

          case sort_selection
          when "1"
            @contact.sort_by_key("first_name")
            @contact.display_contacts
          when "2"
            @contact.sort_by_key("last_name")
            @contact.display_contacts
          when "3"
            @contact.sort_by_key("email_address")
            @contact.display_contacts
          else
            puts "Sorry, that's an invalid selection. Please try again"
          end
        end



      when "4"
        empty_contacts

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

          else
            puts "Sorry, that's an invalid selection. Please try again:"
          end
        end

      when "5"
        empty_contacts
        @contact.edit_contact

      when "6"
        empty_contacts

        if contact.contacts.length == 1
          puts "You only have one contact. Would you like to delete it? Y/N"
          delete_selection = $stdin.gets.chomp.upcase

          if delete_selection == "Y"
            @contact.delete_contact
          end
        else
          @contact.delete_contact
        end

      when "7"
        exit_contact_manager = "Y"

      else
        puts "Sorry, that is an invalid selection. Please try again."
      end
    end
    puts "Thanks for using Contact Manager."
  end
end


private

def empty_contacts
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
end

def clear_screen
  print "\e[2J\e[f"
end
