class Customer < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  broadcasts_refreshes_to ->(customer) { :customers_list }
end
