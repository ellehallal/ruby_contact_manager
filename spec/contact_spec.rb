require 'contact'

RSpec.describe Contact do
  it "creates a new instance of the Contact class" do
    my_contacts = Contact.new
    expect(my_contacts.is_a?Object).to eq(true)
  end

  it "creates an instance variable called contacts with an empty array value" do
    my_contacts = Contact.new
    expect(my_contacts.contacts).to eq([])
  end

  xit "creates a new contact using the Person class and adds it to @contacts" do
    my_contacts = Contact.new
    my_contacts.create_new_entry
    expect(my_contacts.contacts.empty?).to eq(false)
  end

  xit "creates two new contacts using the Person class and adds both to @contacts" do
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.contacts.length).to eq(2)
  end

end
