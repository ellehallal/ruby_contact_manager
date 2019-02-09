class ContactManager
  require 'contact'
  require 'display'

  attr_reader :contact

  def initialize(display = Display.new, contact = Contact.new)
    @display = display
    @contact = contact
  end

  def begin
    exit_contact_manager = 'N'
    clear_screen
    puts ''
    puts 'Welcome to Contact Manager'

    while exit_contact_manager == 'N'
      @display.main_options
      selection = $stdin.gets.chomp

      case selection
      when '1'
        @contact.create_new_entry
      when '2'
        empty_contacts

        @contact.display_contacts if @contact.contacts.empty? == false

      when '3'
        empty_contacts

        if @contact.contacts.empty? == false
          puts 'Sort by:'
          puts '1. First name'
          puts '2. Last name'
          puts '3. Email address'

          sort_selection = $stdin.gets.chomp

          case sort_selection
          when '1'
            @contact.sort_by_key('first_name')
            @contact.display_contacts
          when '2'
            @contact.sort_by_key('last_name')
            @contact.display_contacts
          when '3'
            @contact.sort_by_key('email_address')
            @contact.display_contacts
          else
            puts "Sorry, that's an invalid selection. Please try again"
          end
        end

      when '4'
        empty_contacts

        if @contact.contacts.empty? == false
          puts 'Search by:'
          puts '1. First name'
          puts '2. Last name'
          puts '3. Email address'
          puts '4. Phone number'

          selection = $stdin.gets.chomp

          case selection
          when '1'
            puts 'Please enter your search term:'
            search_for = $stdin.gets.chomp
            @contact.search_first_name(search_for)
          when '2'
            puts 'Please enter your search term:'
            search_for = $stdin.gets.chomp
            @contact.search_last_name(search_for)

          when '3'
            puts 'Please enter your search term:'
            search_for = $stdin.gets.chomp
            @contact.search_email(search_for)

          when '4'
            puts 'Please enter your search term:'
            search_for = $stdin.gets.chomp
            @contact.search_phone(search_for)

          else
            puts "Sorry, that's an invalid selection. Please try again:"
          end
        end

      when '5'
        empty_contacts
        @contact.edit_contact

      when '6'
        empty_contacts

        if contact.contacts.length == 1
          puts 'You only have one contact. Would you like to delete it? Y/N'
          delete_selection = $stdin.gets.chomp.upcase

          @contact.delete_contact if delete_selection == 'Y'
        else
          @contact.delete_contact
        end

      when '7'
        exit_contact_manager = 'Y'

      else
        puts 'Sorry, that is an invalid selection. Please try again.'
      end
    end
    puts 'Thanks for using Contact Manager.'
  end
end

private

def empty_contacts
  while @contact.contacts.empty?
    puts 'You do not have any contacts. Would you like to add a new contact?'
    puts 'Y / N'
    add_new_contact = $stdin.gets.chomp.upcase

    if add_new_contact == 'Y'
      @contact.create_new_entry
    elsif add_new_contact == 'N'
      break
    else
      puts "Sorry, that isn't a valid selection."
    end
  end
end

def clear_screen
  print "\e[2J\e[f"
end
