## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  CSV_FILE = 'contacts.csv'
  class << self

    def write_contact(firstname, lastname, email)
      new_contact = Contact.new(firstname, lastname, email) #didn't create a new instance of Contact
      CSV.open(CSV_FILE, 'a') do |row|
        row << [new_contact.firstname, new_contact.lastname, new_contact.email]  
      end
    end

    def read_contact
      arr = []
      CSV.foreach(CSV_FILE, 'r') do |row|
        firstname = row[0]
        lastname = row[1]
        email = row[2]
        temp = Contact.new(firstname, lastname, email)
        # row.read
        arr << temp
      end
      arr
    end
  end
end
