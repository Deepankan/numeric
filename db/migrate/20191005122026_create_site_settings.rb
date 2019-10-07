class CreateSiteSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :site_settings do |t|
      t.string :api_client_id
      t.string :api_key

      t.timestamps
    end
  end
end
