class Post < ApplicationRecord
  belongs_to :user  # 각 게시글(Post)은 특정 사용자(User)에게 속함

  validates :title, presence: true  # 제목(title)은 필수
  validates :content, presence: true  # 내용(content)도 필수
end
