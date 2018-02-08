class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :description
      t.string :link, unique: true
      t.string :post_time

      t.timestamps
    end
  end
end
