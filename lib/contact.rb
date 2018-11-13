class Contact
  require 'person'

  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def create_new_entry
    new_contact = Person.new
    new_contact.get_display_person_details
    @contacts.push(new_contact.create_person_hash)
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

    def sort_by_last_name
      @contacts.sort_by do |entry|
        entry[:last_name]
      end
    end

  end

end
