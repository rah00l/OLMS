class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :MemberID
      t.string :MemberName
      t.string :Password
      t.string :FirstName
      t.string :Email
      t.string :Major
      t.integer :NumberOfBooks
      t.decimal :Mony
      t.datetime :Expired

     # t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
