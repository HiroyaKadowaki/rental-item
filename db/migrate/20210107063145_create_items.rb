class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :number
      t.string :name
      t.text :comment
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
