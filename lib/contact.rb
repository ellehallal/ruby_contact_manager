class Contact
  require 'display'
  require 'json'
  require 'colorize'

  attr_reader :contacts

  def initialize(display=Display.new)
    @display = display
    @contacts = []
    get_contacts_from_file('./lib/contacts.json').each do |contact|
      @contacts << contact
    end
  end

  def create_new_entry
    @display.request_contact_info('first name')
    first = $stdin.gets.chomp.capitalize

    @display.request_contact_info('last name')
    last = $stdin.gets.chomp.capitalize

    @display.request_contact_info('email address')
    email = $stdin.gets.chomp.downcase

    @display.request_contact_info('phone number')
    phone = $stdin.gets.chomp.scan(/\d+/).join

    add_contact_to_file(first, last, email, phone)
    @contacts << { 'first_name' => first, 'last_name' => last, 'email_address' => email, 'phone_number' => phone }
    sort_by_key('first_name')

    @display.clear_screen
    @display.display_new_entry(first, last, email, phone)
  end

  def display_contacts
    @display.clear_screen
    @display.contacts_message
    @display.insert_blank_line

    @contacts.each do |entry|
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:cyan)
      end
      @display.insert_blank_line
    end
  end

  def sort_by_key(key)
    @contacts.sort_by! do |entry|
      entry[key]
    end
  end

  def search_first_name(search_term)
    search = @contacts.select do |entry|
      entry['first_name'].start_with?(search_term.capitalize)
    end

    @display.clear_screen
    @display.display_search_term("first names", search_term.downcase)
    @display.insert_blank_line

    search.each do |entry|
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:yellow)
      end
      @display.insert_blank_line
    end
  end

  def search_last_name(search_term)
    search = @contacts.select do |entry|
      entry['last_name'].start_with?(search_term.capitalize)
    end

    @display.clear_screen
    @display.display_search_term("last names", search_term.downcase)
    @display.insert_blank_line

    search.each do |entry|
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:yellow)
      end
      @display.insert_blank_line
    end
  end

  def search_email(search_term)
    search = @contacts.select do |entry|
      entry['email_address'].start_with?(search_term.downcase)
    end

    @display.clear_screen
    @display.display_search_term("email address", search_term.downcase)
    @display.insert_blank_line

    search.each do |entry|
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:yellow)
      end
      @display.insert_blank_line
    end
  end

  def search_phone(search_term)
    search = @contacts.select do |entry|
      entry['phone_number'].start_with?(search_term.downcase)
    end

    @display.clear_screen
    @display.display_search_term("a phone number", search_term)
    @display.insert_blank_line
    
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:yellow)
      end
      @display.insert_blank_line
    end
  end

  def delete_contact
    @display.insert_blank_line
    @contacts.each_with_index do |entry, index|
      puts "#{index + 1}:"
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:magenta)
      end
      @display.insert_blank_line
    end

    deleted_contact = []

    if @contacts.length == 1
      deleted_contact << @contacts[0]
      @contacts.delete_at(0)
    else
      @display.delete_or_edit_prompt('delete')

      selection = get_selection

      index_to_delete = selection -= 1
      deleted_contact << @contacts[index_to_delete]
      @contacts.delete_at(index_to_delete)
    end

    File.open('./lib/contacts.json', 'w') do |file|
      file.write @contacts.to_json
    end

    @display.clear_screen
    deleted_contact.each do |entry|
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:red)
      end
      @display.delete_or_edit_confirmation('deleted')
      @display.insert_blank_line
    end
  end

  def edit_contact
    @display.insert_blank_line
    @contacts.each_with_index do |entry, index|
      puts "#{index + 1}:"
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:magenta)
      end
      @display.insert_blank_line
    end

    edited_contact = []

    @display.delete_or_edit_prompt('edit')

    selection = get_selection
    index_to_edit = selection -= 1

    @display.edit_contact
    edit_selection = $stdin.gets.chomp

    case edit_selection
    when '1'
      @display.request_contact_info('new first name')
      new_detail = $stdin.gets.chomp
      @contacts[index_to_edit]['first_name'] = new_detail

    when '2'
      @display.request_contact_info('new last name')
      new_detail = $stdin.gets.chomp
      @contacts[index_to_edit]['last_name'] = new_detail

    when '3'
      @display.request_contact_info('new email address')
      new_detail = $stdin.gets.chomp
      @contacts[index_to_edit]['email_address'] = new_detail

    when '4'
      @display.request_contact_info('new phone number')
      new_detail = $stdin.gets.chomp
      @contacts[index_to_edit]['phone_number'] = new_detail

    else
      @display.invalid_selection
    end

    edited_contact << @contacts[index_to_edit]

    File.open('./lib/contacts.json', 'w') do |file|
      file.write @contacts.to_json
    end

    @display.clear_screen

    edited_contact.each do |entry|
      entry.each do |key, value|
        puts "#{key}: #{value}".colorize(:red)
      end
      @display.delete_or_edit_confirmation('edited')
      @display.insert_blank_line
    end
  end

  def add_contact_to_file(first_name, last_name, email_address, phone_number)
    json_string = File.read('./lib/contacts.json')
    current_contacts = JSON.load(json_string)
    current_contacts << { first_name: first_name, last_name: last_name, email_address: email_address, phone_number: phone_number }
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
      @display.invalid_selection
      selection = $stdin.gets.chomp.to_i
    end
    selection
  end
end
