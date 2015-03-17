require_relative 'contact'
require_relative 'contact_database'

def start(command)
  puts "Reading from #{ContactDatabase::CSV_FILE}" #test
  case 
  when command[0] == "help"
    puts "Here is a list of available commands:
       new  - Create a new contact
       list - List all contacts
       show - Show a contact
       find - Find a contact"

  when command[0] == "new"
    puts "Enter first name: "
    firstname = STDIN.gets.chomp
    puts "Enter last name: "
    lastname = STDIN.gets.chomp
    puts "Enter email: "
    email = STDIN.gets.chomp
    Contact.create(firstname, lastname, email)

  when command[0] == "list"
    Contact.all

  when command[0] == "show"
    puts "Enter id: "
    index = STDIN.gets.chomp
    puts Contact.show(index.to_i)

  when command[0] == "find"
    puts "enter something"
    index = STDIN.gets.chomp.downcase
    puts Contact.find(index)
  end
end

start(ARGV)