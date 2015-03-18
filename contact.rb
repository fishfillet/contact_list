require 'rubygems'
require 'active_record'

# Output messages from AR to STDOUT
ActiveRecord::Base.logger = Logger.new(STDOUT)
 
puts "Establishing connection to database ..."

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'd1btka6k630gln',
  username: 'esqjcdxmjhpbsx',
  password: 'nJp2-XfHFMXD4PpElV7Ikm3UhL',
  host: 'ec2-54-221-249-3.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)

puts "CONNECTED"

class Contact < ActiveRecord::Base

  validates :firstname, :lastname, :email, presence: true

end
