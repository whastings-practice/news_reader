class AddDescriptionToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :description, :text
  end
end
