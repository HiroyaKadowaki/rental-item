class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :number
      t.string :name
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
