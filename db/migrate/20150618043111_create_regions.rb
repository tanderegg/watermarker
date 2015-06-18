class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.references :image, index: true, foreign_key: true
      t.references :payoff, index: true, foreign_key: true
      t.string :name, null: false, default: ""
      t.integer :left, null: false, default: 0
      t.integer :top, null: false, default: 0
      t.integer :width, null: false, default: 0
      t.integer :height, null: false, default: 0
      t.string :original, default: ""
      t.string :watermark, default: ""
      t.integer :watermark_strength, null: false, default: 5
      t.integer :watermark_resolution, null: false, default: 50
      t.string :link_api_url, default: ""
      t.string :trigger_api_url, default: ""

      t.timestamps null: false
    end
  end
end
