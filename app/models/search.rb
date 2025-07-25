class Search < ApplicationRecord
  validates :user_search, presence: true
  validates :user_ip, presence:true
end
