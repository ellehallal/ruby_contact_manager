class Display
  require 'colorize'

  def display_new_entry(first_name, last_name, email, phone)
    puts ''
    puts "Here's your new contact:"
    puts "First name: #{first_name}".colorize(:green)
    puts "Last name: #{last_name}".colorize(:green)
    puts "Email address: #{email}".colorize(:green)
    puts "Phone number: #{phone}".colorize(:green)
    puts ''
  end

  def request_contact_info(item)
    puts "Please enter the #{item} below"
  end

  def edit_contact
    puts ''
    puts 'What detail would you like to edit? (Select 1 - 4)'
    puts '1. First name'
    puts '2. Last name'
    puts '3. Email address'
    puts '4. Phone number'
  end

  def main_options
    puts 'Please select a number from 1 - 7:'
    puts '1. Add a new contact'
    puts '2. View all contacts'
    puts '3. Sort by...'
    puts '4. Search for a contact'
    puts '5. Edit a contact'
    puts '6. Delete a contact'
    puts '7. Exit Contact Manager'
    print '>'
  end

  def welcome
    puts ''
    puts 'Welcome to Contact Manager'
  end

  def sort_by_options
    puts 'Sort by:'
    puts '1. First name'
    puts '2. Last name'
    puts '3. Email address'
  end

  def invalid_selection
    puts "Sorry, that's an invalid selection. Please try again:"
  end

  def exit_message
    puts 'Thanks for using Contact Manager.'
  end

  def empty_contacts
    puts 'You do not have any contacts. Would you like to add a new contact?'
    puts 'Y / N'
  end

  def clear_screen
    print "\e[2J\e[f"
    puts ''
  end

  def search_by_options
    puts 'Search by:'
    puts '1. First name'
    puts '2. Last name'
    puts '3. Email address'
    puts '4. Phone number'
  end

  def search_term_prompt
    puts 'Please enter your search term:'
  end

  def delete_single_contact_warning
    puts 'You only have one contact. Would you like to delete it? Y/N'
  end

  def insert_blank_line
    puts ''
  end

  def display_search_term(data_type, user_input)
    puts "Contacts with #{data_type} starting with #{user_input}:"
  end

  def delete_or_edit_prompt(action)
    puts "Please select which contact you wish to #{action} (select a number)"
  end

  def delete_or_edit_confirmation(action)
    puts "The selected contact has been #{action}"
  end

  def contacts_message
    puts 'Here are your contacts:'
  end
end
