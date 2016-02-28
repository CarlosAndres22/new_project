class AddAttributesToEvento < ActiveRecord::Migration
  def change
    add_column :eventos, :title, :string
    add_column :eventos, :description, :text
  end
end
