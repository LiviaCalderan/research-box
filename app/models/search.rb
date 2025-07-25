class Search < ApplicationRecord
  validates :user_search, presence: true
  validates :user_ip, presence:true

  # Callback that strips leading and trailing whitespace from query before validation
  before_validation :strip_whitespace

  private

  def strip_whitespace
    self.user_search = user_search.strip if user_search.present?
  end
end
