class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name, null: false, default: ""
      t.string :original, null: false, default: ""
      t.string :final
      t.integer :height, null: false, default: 0
      t.integer :width, null: false, default: 0

      t.timestamps null: false
    end
  end
end
