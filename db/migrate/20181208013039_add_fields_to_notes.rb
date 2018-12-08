class AddFieldsToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :begin, :timestamp
    add_column :notes, :end, :timestamp
  end
end
