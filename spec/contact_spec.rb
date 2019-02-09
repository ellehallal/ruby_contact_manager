require 'contact'

def clear_contacts
  path = File.expand_path('../lib/contacts.json', __dir__)
  File.read(path)
  empty_contacts = []
  File.write(path, empty_contacts)
end

RSpec.describe Contact do
  before :each do
    clear_contacts
    @contact = Contact.new
  end

  it 'creates a new instance of the Contact class' do
    expect(@contact.is_a?(Object)).to eq(true)
  end

  it 'create_new_entry method creates new instance of Person and adds to @contacts' do
    allow($stdin).to receive(:gets).and_return('Elle', 'H', 'elle@hello.com', '07999999999')
    allow('./lib/contacts.json').to receive(:write).with('first_name' => 'Elle', 'last_name' => 'H', 'email_address' => 'elle@hello.com', 'phone_number' => '07999999999')
    @contact.create_new_entry
    expect(@contact.contacts).to eq([{ 'first_name' => 'Elle', 'last_name' => 'H', 'email_address' => 'elle@hello.com', 'phone_number' => '07999999999' }])
  end
end

RSpec.describe Contact do
  before :each do
    clear_contacts
    @contact = Contact.new
    allow($stdin).to receive(:gets).and_return('Elle', 'H', 'elle@hello.com', '07999999999', 'Deneice', 'Daniels', 'dee@hello.com', '07889999999', 'Amy', 'Winchester', 'amy@amy.com', '07000000000')
    @contact.create_new_entry
    @contact.create_new_entry
    @contact.create_new_entry
  end

  it 'returns contacts with the first name beginning with E only' do
    contacts_beginning_e = @contact.search_first_name('E')
    expect(contacts_beginning_e).to eq([{ 'first_name' => 'Elle', 'last_name' => 'H', 'email_address' => 'elle@hello.com', 'phone_number' => '07999999999' }])
  end
end

RSpec.describe Contact do
  before(:each) do
    clear_contacts
    @contact = Contact.new
    allow($stdin).to receive(:gets).and_return('Elle', 'Dorie', 'elle@hello.com', '07999999999', 'Deneice', 'Smith', 'dee@hello.com', '07989999999', 'Edward', 'Smith', 'e@smith.com', '07000000000')
    @contact.create_new_entry
    @contact.create_new_entry
    @contact.create_new_entry
  end

  it 'displays contacts with last names beginning with Sm only. Results sorted by first name' do
    last_name_sm = @contact.search_last_name('Sm')
    expect(last_name_sm).to eq([{ 'first_name' => 'Deneice', 'last_name' => 'Smith', 'email_address' => 'dee@hello.com', 'phone_number' => '07989999999' }, { 'first_name' => 'Edward', 'last_name' => 'Smith', 'email_address' => 'e@smith.com', 'phone_number' => '07000000000' }])
  end

  it "displays contacts with the email address beginning with 'E' only" do
    email_address_e = @contact.search_email('E')
    expect(email_address_e).to eq([{ 'first_name' => 'Edward', 'last_name' => 'Smith', 'email_address' => 'e@smith.com', 'phone_number' => '07000000000' }, { 'first_name' => 'Elle', 'last_name' => 'Dorie', 'email_address' => 'elle@hello.com', 'phone_number' => '07999999999' }])
  end

  it "displays contacts with the phone number beginning with '079' only" do
    phone_number = @contact.search_phone('079')
    expect(phone_number).to eq([{ 'first_name' => 'Deneice', 'last_name' => 'Smith', 'email_address' => 'dee@hello.com', 'phone_number' => '07989999999' }, { 'first_name' => 'Elle', 'last_name' => 'Dorie', 'email_address' => 'elle@hello.com', 'phone_number' => '07999999999' }])
  end
end

RSpec.describe Contact do
  before(:each) do
    clear_contacts
    @contact = Contact.new
    allow($stdin).to receive(:gets).and_return('Elle', 'Dorie', 'elle@hello.com', '07999999999')
    @contact.create_new_entry
  end

  it "creates a contact and then edits the first name to 'Eleanor'" do
    allow($stdin).to receive(:gets).and_return('1', '1', 'Eleanor')
    @contact.edit_contact
    expect(@contact.contacts).to eq([{ 'first_name' => 'Eleanor', 'last_name' => 'Dorie', 'email_address' => 'elle@hello.com', 'phone_number' => '07999999999' }])
  end

  it "creates a contact and then edits the last name to 'Hall'" do
    allow($stdin).to receive(:gets).and_return('1', '2', 'Hall')
    @contact.edit_contact
    expect(@contact.contacts).to eq([{ 'first_name' => 'Elle', 'last_name' => 'Hall', 'email_address' => 'elle@hello.com', 'phone_number' => '07999999999' }])
  end

  it "creates a contact and then edits the email address to 'elle@dorie.com'" do
    allow($stdin).to receive(:gets).and_return('1', '3', 'elle@dorie.com')
    @contact.edit_contact
    expect(@contact.contacts).to eq([{ 'first_name' => 'Elle', 'last_name' => 'Dorie', 'email_address' => 'elle@dorie.com', 'phone_number' => '07999999999' }])
  end

  it "creates a contact and then edits the phone number to '07888999000'" do
    allow($stdin).to receive(:gets).and_return('1', '4', '07888999000')
    @contact.edit_contact
    expect(@contact.contacts).to eq([{ 'first_name' => 'Elle', 'last_name' => 'Dorie', 'email_address' => 'elle@hello.com', 'phone_number' => '07888999000' }])
  end
end
