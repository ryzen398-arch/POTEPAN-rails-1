class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :memo
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :all_day

      t.timestamps
    end
  end
end
