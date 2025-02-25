class Post < ApplicationRecord
  belongs_to :user  # ✅ 게시글은 반드시 유저에 속해야 함.
  validates :title, presence: true
  validates :content, presence: true
end
