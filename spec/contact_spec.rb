require 'contact'

RSpec.describe Contact do
  it "creates a new instance of the Contact class" do
    my_contacts = Contact.new
    expect(my_contacts.is_a?Object).to eq(true)
  end
end
