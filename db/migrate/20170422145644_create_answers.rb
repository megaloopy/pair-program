class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body

      t.timestamps null: false
    end
    add_reference :answers, :question, index: true, foreign_key: true
  end
end
