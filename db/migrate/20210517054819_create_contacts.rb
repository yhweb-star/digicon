class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :subject,           null: false
      t.string :contents,           null: false
      t.references :school, foreign_key: true
      t.timestamps
    end
  end
end
