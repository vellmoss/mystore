class CreateMstores < ActiveRecord::Migration
  def change
    create_table :mstores do |t|
      t.text :position
      t.decimal :price

      t.timestamps
    end
  end
end
