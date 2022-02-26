class CreateMemoDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :memo_details do |t|

      t.timestamps
    end
  end
end
