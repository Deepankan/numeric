class CreateInternalIps < ActiveRecord::Migration[5.1]
  def change
    create_table :internal_ips do |t|
      t.references :computer
      t.string :ips

      t.timestamps
    end
  end
end
