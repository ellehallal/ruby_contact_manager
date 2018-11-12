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
    @contacts.each do |entry|
      entry.each do |key, value|
        puts "#{key.to_s}: #{value}"
      end
      puts ""
    end

  end

end
