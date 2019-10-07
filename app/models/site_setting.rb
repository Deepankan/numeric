class SiteSetting < ApplicationRecord
  before_create :clear_existing

  def clear_existing
    SiteSetting.delete_all
  end
end
