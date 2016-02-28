class CreateInvitados < ActiveRecord::Migration
  def change
    create_table :invitados do |t|
      t.string :title
      t.text :description
      t.references :evento, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
