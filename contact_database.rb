# ## TODO: Implement CSV reading/writing
# require 'csv'

# class ContactDatabase
#   class << self

#     def write_contact(name, email)
#       new_contact = Contact.new(name, email) #didn't create a new instance of Contact
#       CSV.open('contacts.csv', 'a') do |row|
#         row << [new_contact.name, new_contact.email]  
#       end
#     end

#     def read_contact
#       arr = []
#       CSV.foreach('contacts.csv', 'r') do |row|
#         name = row[0]
#         email = row[1]
#         temp = Contact.new(name, email)
#         # row.read
#         arr << temp
#       end
#       arr
#     end
#   end

# end


## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  CSV_FILE = 'contacts.csv'
  class << self

    def write_contact(name, email)
      new_contact = Contact.new(name, email) #didn't create a new instance of Contact
      CSV.open(CSV_FILE, 'a') do |row|
        row << [new_contact.name, new_contact.email]  
      end
    end

    def read_contact
      arr = []
      CSV.foreach(CSV_FILE, 'r') do |row|
        name = row[0]
        email = row[1]
        temp = Contact.new(name, email)
        # row.read
        arr << temp
      end
      arr
    end
  end

end