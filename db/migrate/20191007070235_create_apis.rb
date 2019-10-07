class CreateApis < ActiveRecord::Migration[5.1]
  def change
    create_table :apis do |t|
      t.string :url
      t.integer :offset
      t.integer :limit

      t.timestamps
    end
  end
end
