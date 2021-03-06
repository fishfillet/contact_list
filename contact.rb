class Contact
 
  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: assign local variables to instance variables
    @name = name
    @email = email
  end
 
  def to_s
    # TODO: return string representation of Contact
    "Name: #{@name}, Email: #{@email}"
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      # TODO: Will initialize a contact as well as add it to the list of contacts
      # new_contact = Contact.new(name, email)
      ContactDatabase.write_contact(name, email)
    end
 
    def find(index)
      # TODO: Will find and return contact by index
      array = []
      contacts = ContactDatabase.read_contact
      contacts.each do |item|
      item = item.to_s
       array << item if item.include? index
      end
      puts array
    end
 
    def all
      # TODO: Return the list of contacts, as is
      ContactDatabase.read_contact
      puts ContactDatabase.read_contact
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      contacts = ContactDatabase.read_contact
      # id = id + 1
      contacts.each_with_index do |detail, index|
      puts index.to_s + ": " + detail.to_s  if id == index   #detail.join(", ")
      end
    end
  end
end