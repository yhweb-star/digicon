class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :school, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
