class Contact
  require 'person'

  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def create_new_entry
    puts "Please enter the first name below:"
    first_name = $stdin.gets.chomp.capitalize

    puts "Please enter the last name below:"
    last_name = $stdin.gets.chomp.capitalize

    puts "Please enter the email address below:"
    email_address = $stdin.gets.chomp.downcase

    puts "Please enter the phone number below:"
    phone_number = $stdin.gets.chomp


    new_contact = Person.new(first_name, last_name, email_address, phone_number)
    new_contact.get_display_person_details
    @contacts.push(new_contact.create_person_hash)
  end

  def display_contacts
    sort_by_first_name
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
      entry[:first_name].start_with?(search_term)
    end

    puts "Contacts with first names starting with #{search_term}"
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
      entry[:last_name].start_with?(search_term)
    end

    puts "Last names which start with #{search_term}"
    search.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end
  end

end
