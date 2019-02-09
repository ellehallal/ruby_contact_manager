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
    expect(@contact_manager.is_a?(bject)).to eq(true)
  end

  xit 'adds a new contact to @contacts' do
    allow($stdin).to receive(:gets).and_return('1', 'Elle', 'H', 'elle@hello.com', '07999999999')
    @contact_manager.begin
    expect(@contact_manager.contact.contacts.empty?).to eq(false)
  end
end
