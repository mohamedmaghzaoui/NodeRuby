class AddIsAccepted < ActiveRecord::Migration[7.1]
  def change
    add_column :debates, :is_accepted, :boolean
  end
end
