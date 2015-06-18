class CreatePayoffs < ActiveRecord::Migration
  def change
    create_table :payoffs do |t|
      t.references :project, index: true, foreign_key: true
      t.string :name, null: false, default: ""
      t.string :url, null: false, default: ""
      t.string :payoff_api_url

      t.timestamps null: false
    end
  end
end
