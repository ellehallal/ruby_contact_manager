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
    @display.clear_screen
    @display.welcome

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
          @display.sort_by_options

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
            @display.invalid_selection
          end
        end

      when '4'
        empty_contacts

        if @contact.contacts.empty? == false
          @display.search_by_options

          selection = $stdin.gets.chomp

          case selection
          when '1'
            @display.search_term_prompt
            search_for = $stdin.gets.chomp
            @contact.search_first_name(search_for)
          when '2'
            @display.search_term_prompt
            search_for = $stdin.gets.chomp
            @contact.search_last_name(search_for)

          when '3'
            @display.search_term_prompt
            search_for = $stdin.gets.chomp
            @contact.search_email(search_for)

          when '4'
            @display.search_term_prompt
            search_for = $stdin.gets.chomp
            @contact.search_phone(search_for)

          else
            @display.invalid_selection
          end
        end

      when '5'
        empty_contacts
        @contact.edit_contact

      when '6'
        empty_contacts

        if contact.contacts.length == 1
          @display.delete_single_contact_warning
          delete_selection = $stdin.gets.chomp.upcase

          @contact.delete_contact if delete_selection == 'Y'
        else
          @contact.delete_contact
        end

      when '7'
        exit_contact_manager = 'Y'

      else
        @display.invalid_selection
      end
    end
    @display.exit_message
  end
end

private

def empty_contacts
  while @contact.contacts.empty?
    @display.empty_contacts
    add_new_contact = $stdin.gets.chomp.upcase

    if add_new_contact == 'Y'
      @contact.create_new_entry
    elsif add_new_contact == 'N'
      break
    else
      @display.invalid_selection
    end
  end
end
