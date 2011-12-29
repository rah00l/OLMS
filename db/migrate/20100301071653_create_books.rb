class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.integer :BookID
      t.string :Subject
      t.string :Title
      t.string :Author
      t.string :Publisher
      t.integer :Copyright
      t.integer :Edition
      t.integer :Pages
      t.string :ISBN
      t.integer :NumberOfBooks
      t.integer :NumberOfAvailbleBooks
      t.integer :NumberOfBorrowedBooks
      t.string :Library
      t.boolean :Availble

    #  t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
