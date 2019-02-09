require 'display'

RSpec.describe Display do
  before :each do
    @display = Display.new
  end

  it 'displays new contact' do
    expect do
      @display.display_new_entry('Elle', 'H', 'elle@hello.com', '07898988989')
    end.to output("\nHere's your new contact:\n\e[0;32;49mFirst name: Elle\e[0m\n\e[0;32;49mLast name: H\e[0m\n\e[0;32;49mEmail address: elle@hello.com\e[0m\n\e[0;32;49mPhone number: 07898988989\e[0m\n\n").to_stdout
  end
end
