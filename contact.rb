require 'pg'

class Contact

   CONN = PG::Connection.new({
                                host: 'ec2-54-221-249-3.compute-1.amazonaws.com',
                                user: 'esqjcdxmjhpbsx',
                                password: 'nJp2-XfHFMXD4PpElV7Ikm3UhL',
                                dbname: 'd1btka6k630gln'
                            })
 
  attr_accessor :firstname, :lastname, :email
  attr_reader :id

  def initialize(firstname, lastname, email, id=nil)
    # TODO: assign local variables to instance variables
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = id
  end

  def is_new?
    @id.nil?
  end

  def save
    if is_new?
      result = CONN.exec_params('INSERT INTO contacts (firstname, lastname, email) VALUES ($1, $2, $3) returning id', [@firstname, @lastname, @email])
      @id = result[0]['id']
    else
      CONN.exec_params('UPDATE contacts SET firstname = $1, lastname = $2, email = $3 WHERE id = $4', [@firstname, @lastname, @email, @id])
    end
  end

  def destroy
    CONN.exec_params('DELETE FROM contacts WHERE id = $1', [@id])
  end
 
 def self.find(id)
    result = nil
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE id = $1 LIMIT 1', [id]) do |rows|
      rows.each do |row|
        result = Contact.new(
            row['firstname'],
            row['lastname'],
            row['email'],
            row['id']
        )
      end
    end
    result
  end

  def self.list
    results = []
    CONN.exec_params('SELECT * FROM contacts') do |rows|
      rows.each do |row|
        results << Contact.new(row['firstname'], row['lastname'], row['email'], row['id'])
      end
    end
    results  
  end


 def self.find_all_by_last_name(name)
    results = []
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE lastname = $1', [name]) do |rows|
      rows.each do |row|
        results << Contact.new(row['firstname'], row['lastname'], row['email'], row['id'])
      end
    end
    results
  end 

   def self.find_all_by_first_name(name)
    results = []
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE firstname = $1', [name]) do |rows|
      rows.each do |row|
        results << Contact.new(row['firstname'], row['lastname'], row['email'], row['id'])
      end
    end
    results
  end 

   def self.find_by_email(email)
    results = []
    CONN.exec_params('SELECT id, firstname, lastname, email FROM contacts WHERE email = $1', [email]) do |rows|
      rows.each do |row|
        results << Contact.new(row['firstname'], row['lastname'], row['email'], row['id'])
      end
    end
    results
  end 



############################################################################################################################################# 
  # def to_s
  #   # TODO: return string representation of Contact
  #   "Name: #{@firstname} #{@lastname}, Email: #{@email}"
  # end
 
  # ## Class Methods
  # class << self
  #   def create(firstname, lastname, email)
  #     # TODO: Will initialize a contact as well as add it to the list of contacts
  #     # new_contact = Contact.new(name, email)
  #     ContactDatabase.write_contact(firstname, lastname, email)
  #   end
 
  #   def find(index)
  #     # TODO: Will find and return contact by index
  #     array = []
  #     contacts = ContactDatabase.read_contact
  #     contacts.each do |item|
  #     item = item.to_s
  #      array << item if item.include? index
  #     end
  #     puts array
  #   end
 
  #   def all
  #     # TODO: Return the list of contacts, as is
  #     ContactDatabase.read_contact
  #     puts ContactDatabase.read_contact
  #   end
    
  #   def show(id)
  #     # TODO: Show a contact, based on ID
  #     contacts = ContactDatabase.read_contact
  #     # id = id + 1
  #     contacts.each_with_index do |detail, index|
  #     puts index.to_s + ": " + detail.to_s  if id == index   #detail.join(", ")
  #     end
  #   end
  # end
  #  # puts CONN.inspect
end
