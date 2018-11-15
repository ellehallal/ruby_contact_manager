require 'contact_manager'

RSpec.describe ContactManager do
  it "creates a new instance of the ContactManager class" do
    contact_manager = ContactManager.new
    expect(contact_manager.is_a?Object).to eq(true)
  end
end
