require 'contact_manager'

RSpec.describe ContactManager do
  def clear_contacts
    path = File.expand_path('../../lib/contacts.json', __FILE__)
    File.read(path)
    empty_contacts = []
    File.write(path, empty_contacts)
  end

  before :each do
    @contact_manager = ContactManager.new
    clear_contacts
  end

  it 'creates a new instance of the ContactManager class' do
    expect(@contact_manager.is_a?(Object)).to eq(true)
  end
end
