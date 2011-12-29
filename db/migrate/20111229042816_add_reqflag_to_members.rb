class AddReqflagToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :Reqflag, :boolean ,:default => false
  end

  def self.down
    remove_column :members, :Reqflag
  end
end
