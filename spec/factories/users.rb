FactoryBot.define do
  factory :user do
    nickname { "테스트유저#{rand(1000)}" }  # ✅ nickname 추가
    email { "test#{rand(1000)}@example.com" }
    password { "password" }
  end
end
