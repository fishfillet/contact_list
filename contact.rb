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

# ActiveRecord::Schema.define do
#   drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
#   create_table :contacts do |t|
#     t.column :firstname, :string
#     t.column :lastname, :string
#     t.column :email, :string
#     t.column :phone_number, :integer
#     t.timestamps
#   end
# end

class Contact < ActiveRecord::Base

  validates :firstname, :lastname, :email, :phone_number, presence: true
  validates :phone_number, length: { minimum: 7 }
  validates :email, uniqueness: true

end
