require 'contact'

RSpec.describe Contact do
  before(:each) do
   allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999",  "Deneice", "Daniels", "dee@hello.com", "07889999999")
  end

  it "creates a new instance of the Contact class" do
    my_contacts = Contact.new
    expect(my_contacts.is_a?Object).to eq(true)
  end

  it "creates a new contact using the Person class and adds it to @contacts" do
    my_contacts = Contact.new
    my_contacts.create_new_entry
    expect(my_contacts.contacts.empty?).to eq(false)
  end

  it "create_new_entry method accepts input, creates new instance of Person and adds to @contacts" do
    allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999")
    allow('./lib/contacts.json').to receive(:write).with( {"first_name" => "Elle", "last_name" => "H", "email_address" => "elle@hello.com", "phone_number" => "07999999999"})
    contacts = Contact.new
    contacts.create_new_entry
    expect(contacts.contacts).to eq([{"first_name" => "Elle", "last_name" => "H", "email_address" => "elle@hello.com", "phone_number" => "07999999999"}])
  end

  it "create_new_entry method accepts input, creates new instance of Person and adds to @contacts twice" do
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.contacts).to eq([{"first_name"=> "Deneice", "last_name"=> "Daniels", "email_address"=> "dee@hello.com", "phone_number"=> "07889999999"}, {"first_name"=>  "Elle", "last_name"=> "H", "email_address"=> "elle@hello.com", "phone_number"=> "07999999999"}])
  end
end

  RSpec.describe Contact do
    before(:each) do
     allow($stdin).to receive(:gets).and_return("Elle", "H", "elle@hello.com", "07999999999", "Deneice", "Daniels", "dee@hello.com", "07889999999", "Amy", "Winchester", "amy@amy.com", "07000000000")
    end

  it "sorts @contacts in alphabetical order by first name" do
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.display_contacts).to eq([{"first_name"=> "Amy", "last_name"=> "Winchester", "email_address"=> "amy@amy.com", "phone_number"=> "07000000000"}, {"first_name"=> "Deneice","last_name"=> "Daniels","email_address"=> "dee@hello.com","phone_number"=> "07889999999"}, {"first_name"=> "Elle", "last_name"=> "H", "email_address"=> "elle@hello.com", "phone_number"=> "07999999999"}])
  end

  it "displays contacts with the first name beginning with E only, in alphabetical order" do
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.search_first_name("E")).to eq([{"first_name" => "Elle", "last_name" => "H", "email_address" => "elle@hello.com", "phone_number" => "07999999999"}])
  end
end

RSpec.describe Contact do
  before(:each) do
    allow($stdin).to receive(:gets).and_return("Elle", "Dorie", "elle@hello.com", "07999999999", "Deneice", "Smith", "dee@hello.com", "07889999999", "Edward", "Smith", "e@smith.com", "07000000000")
  end

  it "displays contacts with the first name beginning with Sm only. Results sorted by first name" do
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.search_last_name("Sm")).to eq([{"first_name" => "Deneice", "last_name" => "Smith", "email_address" => "dee@hello.com", "phone_number" => "07889999999"}, {"first_name" => "Edward", "last_name" => "Smith", "email_address" => "e@smith.com", "phone_number" => "07000000000"}])
  end

  it "displays contacts with the email address beginning with 'E' only" do
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.search_email("E")).to eq([{"first_name" => "Edward", "last_name" => "Smith", "email_address" => "e@smith.com", "phone_number" => "07000000000"}, {"first_name" => "Elle", "last_name" => "Dorie", "email_address" => "elle@hello.com", "phone_number" => "07999999999"}])
  end
end

RSpec.describe Contact do
  it "displays contacts with the phone number beginning with '079' only" do
    allow($stdin).to receive(:gets).and_return("Elle", "Dorie", "elle@hello.com", "07999999999", "Deneice", "Smith", "dee@hello.com", "07989999999", "Edward", "Smith", "e@smith.com", "07000000000")
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    my_contacts.create_new_entry
    expect(my_contacts.search_phone("079")).to eq([{"first_name" => "Deneice", "last_name" => "Smith", "email_address" => "dee@hello.com", "phone_number" => "07989999999"}, {"first_name" => "Elle", "last_name" => "Dorie", "email_address" => "elle@hello.com", "phone_number" => "07999999999"}])
  end

  it "creates a contact and then edits the first name to 'Eleanor'" do
    allow($stdin).to receive(:gets).and_return("Elle", "Dorie", "elle@hello.com", "07999999999", "1", "1", "Eleanor")
    my_contacts = Contact.new
    my_contacts.create_new_entry
    my_contacts.edit_contact
    expect(my_contacts.contacts).to eq([{"first_name" => "Eleanor", "last_name" => "Dorie", "email_address" => "elle@hello.com", "phone_number" => "07999999999"}])
  end
end
