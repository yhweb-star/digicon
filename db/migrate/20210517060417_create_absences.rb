class CreateAbsences < ActiveRecord::Migration[6.1]
  def change
    create_table :absences do |t|
      t.date :date_when,           null: false
      t.integer :reason_id,           null: false
      t.time :time_when,           null: false
      t.string :status,           null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
