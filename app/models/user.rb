class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy  # ✅ 유저가 삭제되면 관련 게시글도 삭제됨.

  validates :nickname, presence: true
end
