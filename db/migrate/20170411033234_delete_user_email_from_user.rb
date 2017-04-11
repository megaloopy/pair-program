class DeleteUserEmailFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :user_email
  end
end
