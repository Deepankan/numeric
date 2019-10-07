class CreateComputers < ActiveRecord::Migration[5.1]
  enable_extension 'hstore' unless extension_enabled?('hstore')

  def change

    create_table :computers do |t|
      t.string :connector_guid
      t.string :hostname
      t.string :active
      t.hstore :links, default: {}
      t.string :connector_version
      t.string :operating_system
      t.string :external_ip
      t.hstore :policy, default: {}
      t.hstore :isolation, default: {}
      t.string :group_guid
      t.string :install_date

      t.timestamps
    end
  end
end
