# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111229042816) do

  create_table "books", :force => true do |t|
    t.integer "BookID"
    t.integer "mem_id"
    t.string  "Availble",              :default => "Available"
    t.string  "Reserve",               :default => "N"
    t.integer "NumberOfBooks"
    t.integer "NumberOfAvailbleBooks", :default => 0
    t.integer "NumberOfBorrowedBooks", :default => 0
    t.string  "Subject"
    t.integer "Ranking",               :default => 0
    t.string  "Title"
    t.string  "Author"
    t.string  "Publisher"
    t.integer "Copyright"
    t.integer "Edition"
    t.integer "Pages"
    t.string  "ISBN"
    t.string  "Library"
  end

  create_table "borrows", :force => true do |t|
    t.integer "BookID"
    t.integer "MemberID"
    t.date    "DayOfBorrowed"
    t.date    "DayOfReturn"
  end

  create_table "members", :force => true do |t|
    t.integer  "MemberID"
    t.string   "name"
    t.integer  "NumberOfBooks",                 :default => 0
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "Address"
    t.string   "PhoneNo"
    t.string   "usertype",        :limit => 25
    t.string   "Email"
    t.datetime "Expired"
    t.boolean  "Reqflag",                       :default => false
  end

end
