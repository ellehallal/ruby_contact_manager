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
end
