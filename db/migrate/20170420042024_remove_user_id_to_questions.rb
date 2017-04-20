class RemoveUserIdToQuestions < ActiveRecord::Migration
  def change
    remove_reference :questions, :user_id, index: true, foreign_key: true
  end
end
