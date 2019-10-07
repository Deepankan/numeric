class Computer < ApplicationRecord

  has_many :network_addresses
  has_many :faults
  has_many :internal_ips
end
