require 'contact'

RSpec.describe Contact do
  it 'creates a new contact' do
    contact = Contact.new('Elle', 'H', 'e@hello.com', '07889999999')
    expect(contact.new_contact).to eq('first_name' => 'Elle', 'last_name' => 'H', 'email_address' => 'e@hello.com', 'phone_number' => '07889999999')
  end
end
