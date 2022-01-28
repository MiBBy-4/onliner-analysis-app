require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET index" do
    before(:example) { get articles_path }

    it 'success response' do
      expect(response).to have_http_status(:ok) 
    end

    it 'renders index' do
      expect(response).to render_template('index')  
    end

    it 'assigns all articles' do
      expect(assigns(:articles)).to eq(Article.order(created_at: :desc)) 
    end
  end

  describe "GET new" do
    before(:example) { get new_article_path }

    it 'success response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders new' do
      expect(response).to render_template('new')  
    end
  end

  describe 'POST create' do
    it 'creates an article' do
      assert_difference 'Article.count', 1 do
        post articles_url, params: { article: { link: LINK } }
      end
    end
  end
end
