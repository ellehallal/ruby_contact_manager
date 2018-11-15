require 'contact_manager'

RSpec.describe ContactManager do
  it "creates a new instance of the ContactManager class" do
    contact_manager = ContactManager.new
    expect(contact_manager.is_a?Object).to eq(true)
  end

  it "adds a new contact" do #contact.json needs to be empty
    allow($stdin).to receive(:gets).and_return("1", "Elle", "H", "elle@hello.com", "07999999999", "5")
    my_contacts = ContactManager.new
    my_contacts.begin
    expect(my_contacts.contact.contacts.empty?).to eq(false)
  end

end
