class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false, default: ""
      t.string :description
      t.string :client, null: false, default: ""
      t.string :logo, null: false, default: ""

      t.timestamps null: false
    end
  end
end
