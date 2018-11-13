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

  # xit "creates a new contact using the Person class and adds it to @contacts" do
  #   my_contacts = Contact.new
  #   my_contacts.create_new_entry
  #   expect(my_contacts.contacts.empty?).to eq(false)
  # end
  #
  # xit "creates two new contacts using the Person class and adds both to @contacts" do
  #   my_contacts = Contact.new
  #   my_contacts.create_new_entry
  #   my_contacts.create_new_entry
  #   expect(my_contacts.contacts.length).to eq(2)
  # end

  it "create_new_entry method accepts input, creates new instance of Person and adds to @contacts" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999")
    contacts = Contact.new
    contacts.create_new_entry
    expect(contacts.contacts).to eq([{:first_name=>"Elle", :last_name=>"H", :email_address=>"elle@hello.com", :phone_number=>"07999999999"}])
  end

end
