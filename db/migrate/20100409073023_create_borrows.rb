class CreateBorrows < ActiveRecord::Migration
  def self.up
    create_table :borrows do |t|
      t.integer :BookID
      t.integer :MemberID
      t.date :DayOfBorrowed
      t.date :DayOfReturn

    #  t.timestamps
    end
  end

  def self.down
    drop_table :borrows
  end
end
