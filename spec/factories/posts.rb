FactoryBot.define do
  factory :post do
    title { "테스트 게시글" }
    content { "이것은 테스트 게시글입니다." }
    association :user  # ✅ 게시글이 특정 유저와 연결되도록 설정
  end
end
