class CreateMemoDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :memo_details do |t|
      t.text :content
      t.references :memo, foreign_key: true

      t.timestamps
    end
  end
end
