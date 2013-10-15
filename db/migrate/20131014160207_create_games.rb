class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.string :winner
      t.float :duration

      t.timestamps
    end
  end
end