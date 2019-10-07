json.extract! site_setting, :id, :api_client_id, :api_key, :created_at, :updated_at
json.url site_setting_url(site_setting, format: :json)
