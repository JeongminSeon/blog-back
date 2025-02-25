class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title         # 제목 추가
      t.text :content         # 내용 추가
      t.references :user, foreign_key: true  # User와 관계 추가 (선택)

      t.timestamps
    end
  end
end
