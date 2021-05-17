class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :subject,           null: false
      t.datetime :start_time,           null: false
      t.datetime :ending_time,           null: false
      t.string :place,           null: false
      t.string :details,           null: false
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
