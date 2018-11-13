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

  it "creates a new contact using the Person class and adds it to @contacts" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999")
    my_contacts = Contact.new
    my_contacts.create_new_entry
    expect(my_contacts.contacts.empty?).to eq(false)
  end

  it "creates two new contacts using the Person class and adds both to @contacts" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999", "Deneice", "Daniels", "dee@hello.com", "07889999999")
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.contacts.length).to eq(2)
  end

  it "create_new_entry method accepts input, creates new instance of Person and adds to @contacts" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999")
    contacts = Contact.new
    contacts.create_new_entry
    expect(contacts.contacts).to eq([{:first_name=>"Elle", :last_name=>"H", :email_address=>"elle@hello.com", :phone_number=>"07999999999"}])
  end

  it "create_new_entry method accepts input, creates new instance of Person and adds to @contacts twice" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999", "Deneice", "Daniels", "dee@hello.com", "07889999999")
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.contacts).to eq([{:first_name=>"Elle", :last_name=>"H", :email_address=>"elle@hello.com", :phone_number=>"07999999999"}, {:first_name=>"Deneice", :last_name=>"Daniels", :email_address=>"dee@hello.com", :phone_number=>"07889999999"}])
  end

  # it "displays all contacts in @contacts" do
  #   allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999", "Deneice", "Daniels", "dee@hello.com", "07889999999")
  #   my_contacts = Contact.new
  #   my_contacts.create_new_entry
  #   my_contacts.create_new_entry
  #   expect {my_contacts.display_contacts}.to output("Here are your contacts:\n\nfirst_name: Elle\nlast_name: H\nemail_address: elle@hello.com\nphone_number: 07999999999\n\nfirst_name: Deneice\nlast_name: Daniels\nemail_address: dee@hello.com\nphone_number: 07889999999\n\n").to_stdout
  # end

  it "sorts @contacts in alphabetical order by last name" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999", "Deneice", "Daniels", "dee@hello.com", "07889999999")
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.sort_by_last_name).to eq([{:first_name=>"Deneice", :last_name=>"Daniels", :email_address=>"dee@hello.com", :phone_number=>"07889999999"}, {:first_name=>"Elle", :last_name=>"H", :email_address=>"elle@hello.com", :phone_number=>"07999999999"}])
  end

  it "sorts @contacts in alphabetical order by first name" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999", "Deneice", "Daniels", "dee@hello.com", "07889999999", "Amy", "Winchester", "amy@amy.com", "07000000000")
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.display_contacts).to eq([{:first_name=>"Amy", :last_name=>"Winchester", :email_address=>"amy@amy.com", :phone_number=>"07000000000"}, {:first_name=>"Deneice", :last_name=>"Daniels", :email_address=>"dee@hello.com", :phone_number=>"07889999999"}, {:first_name=>"Elle", :last_name=>"H", :email_address=>"elle@hello.com", :phone_number=>"07999999999"}])
  end

  xit "displays contacts with a last name beginning with H" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999", "Deneice", "Daniels", "dee@hello.com", "07889999999", "Jermaine", "Hull", "j@hull.com", "07000000000")
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.search).to eq([{:first_name=>"Amy", :last_name=>"Winchester", :email_address=>"amy@amy.com", :phone_number=>"07000000000"}, {:first_name=>"Deneice", :last_name=>"Daniels", :email_address=>"dee@hello.com", :phone_number=>"07889999999"}, {:first_name=>"Elle", :last_name=>"H", :email_address=>"elle@hello.com", :phone_number=>"07999999999"}])
  end

end
