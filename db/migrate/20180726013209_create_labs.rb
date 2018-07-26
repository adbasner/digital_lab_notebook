class CreateLabs < ActiveRecord::Migration[5.2]
  def change
    create_table :labs do |t|
      t.integer :classroom_id
      t.string :lab_title
      t.boolean :complete
      t.timestamps
    end
  end
end
