class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
    add_reference :people, :organization, foreign_key: true
  end
end
