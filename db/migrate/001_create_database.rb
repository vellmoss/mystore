class CreateDatabase < ActiveRecord::Migration
  def self.up
    # insert schema.rb here
    create_table "mstores", id: false, force: true do |t|
      t.integer   "id",                                              null: false
      t.text      "position",   limit: 255,                          null: false
      t.decimal   "price",      precision: 10, scale: 2,             null: false
      t.datetime  "created_at",                                      null: false
      t.timestamp "updated_at",                                      null: false
    end

    add_index "mstores", ["id"], name: "index id", unique: true     #using: :btree

  end

  def self.down
    # drop all the tables if you really need
    # to support migration back to version 0
  end
end