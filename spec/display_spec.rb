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

  it 'displays new contact' do
    expect do
      @display.request_contact_info('first name')
    end.to output("Please enter the first name below\n").to_stdout
  end

  it 'displays choices for editing a contact' do
    expect do
      @display.edit_contact
    end.to output("\nWhat detail would you like to edit? (Select 1 - 4)\n1. First name\n2. Last name\n3. Email address\n4. Phone number\n").to_stdout
  end

  it 'displays main options' do
    expect do
      @display.main_options
    end.to output("Please select a number from 1 - 7:\n1. Add a new contact\n2. View all contacts\n3. Sort by...\n4. Search for a contact\n5. Edit a contact\n6. Delete a contact\n7. Exit Contact Manager\n>").to_stdout
  end

  it 'displays welcome message' do
    expect do
      @display.welcome
    end.to output("\nWelcome to Contact Manager\n").to_stdout
  end

  it 'displays sort by options' do
    expect do
      @display.sort_by_options
    end.to output("Sort by:\n1. First name\n2. Last name\n3. Email address\n").to_stdout
  end

  it 'displays invalid selection message' do
    expect do
      @display.invalid_selection
    end.to output("Sorry, that's an invalid selection. Please try again:\n").to_stdout
  end

  it 'displays exit_message' do
    expect do
      @display.exit_message
    end.to output("Thanks for using Contact Manager.\n").to_stdout
  end

  it 'displays empty contacts message' do
    expect do
      @display.empty_contacts
    end.to output("You do not have any contacts. Would you like to add a new contact?\nY / N\n").to_stdout
  end

  it 'displays clear screen' do
    expect do
      @display.clear_screen
    end.to output("\e[2J\e[f\n").to_stdout
  end

  it 'displays search by options' do
    expect do
      @display.search_by_options
    end.to output("Search by:\n1. First name\n2. Last name\n3. Email address\n4. Phone number\n").to_stdout
  end

  it 'displays search term prompt' do
    expect do
      @display.search_term_prompt
    end.to output("Please enter your search term:\n").to_stdout
  end

  it 'displays delete single contact warning' do
    expect do
      @display.delete_single_contact_warning
    end.to output("You only have one contact. Would you like to delete it? Y/N\n").to_stdout
  end

  it 'inserts blank line' do
    expect do
      @display.insert_blank_line
    end.to output("\n").to_stdout
  end

  it 'displays search term message' do
    expect do
      @display.display_search_term('first name', 'El')
    end.to output("Contacts with first name starting with El:\n").to_stdout
  end

  it 'inserts delete or edit prompt' do
    expect do
      @display.delete_or_edit_prompt('edit')
    end.to output("Please select which contact you wish to edit (select a number)\n").to_stdout
  end

  it 'inserts delete or edit confirmation' do
    expect do
      @display.delete_or_edit_confirmation('edit')
    end.to output("The selected contact has been edit\n").to_stdout
  end

  it 'displays contacts message' do
    expect do
      @display.contacts_message
    end.to output("Here are your contacts:\n").to_stdout
  end
end
