class CreateDebates < ActiveRecord::Migration[7.1]
  def change
    create_table :debates do |t|
      t.string :title
      t.text :text
      t.string :user

      t.timestamps
    end
  end
end
