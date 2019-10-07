class CreateNetworkAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :network_addresses do |t|
      t.references :computer
      t.hstore :network_address, default: {}

      t.timestamps
    end
  end
end
