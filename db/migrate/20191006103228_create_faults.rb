class CreateFaults < ActiveRecord::Migration[5.1]
  def change
    create_table :faults do |t|
      t.references :computer
      t.string :falut

      t.timestamps
    end
  end
end
