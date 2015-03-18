require_relative 'contact'
# require_relative 'contact_database'

def start(command)
  # puts "Reading from #{ContactDatabase::CSV_FILE}" #test
  puts "type ruby contact_list.rb help for a list of commands."
  case 
  when command[0] == "help"
    puts "Here is a list of available commands:
       new  - Create a new contact
       list - List all contacts
       show - Show a contact
       firstname - Find a contact by firstname
       lastname - Find a contact by lastname
       email - Find a contact by email"

  when command[0] == "new"
    puts "Enter first name: "
    firstname = STDIN.gets.chomp
    puts "Enter last name: "
    lastname = STDIN.gets.chomp
    puts "Enter email: "
    email = STDIN.gets.chomp
    enter = Contact.new(firstname, lastname, email)
    enter.save

  when command[0] == "list"
    Contact.list.each do |contact|
    puts "Name: #{contact.firstname} #{contact.lastname} // Email: #{contact.email} // id: #{contact.id}"
    end

  when command[0] == "show"
    puts "Enter id: "
    index = STDIN.gets.chomp
    puts Contact.find(index.to_i).display

  when command[0] == "firstname"
    puts "enter a first name"
    index = STDIN.gets.chomp
    disp = Contact.find_all_by_first_name(index)
    disp.each {|x| x.display}

  when command[0] == "lastname"
    puts "enter a last name"
    index = STDIN.gets.chomp
    disp = Contact.find_all_by_last_name(index)
    disp.each {|x| x.display}

  when command[0] == "email"
    puts "enter an email address"
    index = STDIN.gets.chomp
    disp = Contact.find_by_email(index)
    disp.each {|x| x.display}
  end
end

start(ARGV)