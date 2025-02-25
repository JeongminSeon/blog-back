require 'rails_helper'

RSpec.describe "Posts API", type: :request do
  let(:user) { create(:user) }  # ✅ FactoryBot으로 유저 생성
  let!(:post) { create(:post, user: user) }  # ✅ 유저가 포함된 게시글 생성

  before do
    sign_in user  # ✅ Devise의 Session 기반 로그인 사용
  end

  describe "GET /posts/new" do
    context "로그인하지 않은 경우" do
      before { sign_out user }  # ✅ 로그아웃 상태로 설정

      it "HTTP 302 리디렉션을 반환해야 함" do
        get "/posts/new"
        expect(response).to have_http_status(302)
      end

      it "로그인 페이지로 리디렉션되어야 함" do
        get "/posts/new"
        expect(response).to redirect_to "/users/sign_in"
      end
    end

    context "로그인한 경우" do
      it "HTTP 200을 반환해야 함" do
        get "/posts/new"
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /posts/:id" do
    it "특정 게시글을 반환해야 함" do
      get "/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /posts/:id" do
    it "게시글을 수정해야 함" do
      patch "/posts/#{post.id}", params: { post: { title: "수정된 제목" } }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["title"]).to eq("수정된 제목")
    end
  end

  describe "DELETE /posts/:id" do
    it "게시글을 삭제해야 함" do
      expect {
        delete "/posts/#{post.id}"
      }.to change { Post.count }.by(-1)

      expect(response).to have_http_status(204)
    end
  end
end
