class Order < ApplicationRecord
    belongs_to :user
    has_many :orderitems
    has_one :adress
    has_one :payment_result
end
