## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  class << self
    def write_contact(name, email)
      CSV.open('contacts.csv', 'a') do |row|
        row << [name, email]
      end
    end

    def read_contact
      CSV.open('contacts.csv', 'r') do |row|
        row.read
      end
    end
  end

end