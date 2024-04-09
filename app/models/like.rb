class Like < ApplicationRecord
  belongs_to :yuzu
  belongs_to :user
  validates_uniqueness_of :yuzu_id, scope: :user_id
end
