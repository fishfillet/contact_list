require 'rubygems'
require 'active_record'
require_relative 'contact'
require 'io/console'
# require_relative 'contact_database'

def start(command)
  # puts "Reading from #{ContactDatabase::CSV_FILE}" #test
  puts "type ruby contact_list.rb help for a list of commands."
  case 
  when command[0] == "help"
    puts "Here is a list of available commands:
       new  - Create a new contact
       list - List all contacts
       find - Find a contact
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
    enter = Contact.create(firstname: firstname, lastname: lastname, email: email)
    enter.save

  when command[0] == "list" 
    list = Contact.all
    list.each do |contact|
      puts "Name: #{contact.firstname} #{contact.lastname} // Email: #{contact.email} // id: #{contact.id}"
    end

  when command[0] == "find"
    puts "Enter id: "
    index = STDIN.gets.chomp
    contact = Contact.find(index)
    puts "Name: #{contact.firstname} #{contact.lastname} // Email: #{contact.email} // id: #{contact.id}"

  when command[0] == "firstname"
    puts "enter a first name"
    index = STDIN.gets.chomp
    contact = Contact.where(firstname: index)
    contact.each do |contact|
      puts "Name: #{contact.firstname} #{contact.lastname} // Email: #{contact.email} // id: #{contact.id}"
    end

  when command[0] == "lastname"
    puts "enter a last name"
    index = STDIN.gets.chomp
    contact = Contact.where(lastname: index)
    contact.each do |contact|
      puts "Name: #{contact.firstname} #{contact.lastname} // Email: #{contact.email} // id: #{contact.id}"
    end
  when command[0] == "email"
    puts "enter an email address"
    index = STDIN.gets.chomp
    contact = Contact.where(email: index)
    contact.each do |contact|
      puts "Name: #{contact.firstname} #{contact.lastname} // Email: #{contact.email} // id: #{contact.id}"
    end
  end
end

start(ARGV)