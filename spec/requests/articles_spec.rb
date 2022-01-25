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
  end
end
