require 'rails_helper'

LINK = 'https://echo.msk.ru/news/2968524-echo.html'

RSpec.describe "CreateCommentService" do
  describe "call method" do
    let(:article_instance) { create(:article) }
    before do
      allow(article_instance).to receive(:transaction_include_any_action?).with([:create]).and_return(true)
    end
    it 'receives call' do
      expect(CreateCommentService).to receive(:call)
      CreateCommentService.call(article_instance.link, article_instance.id)
    end
  end
  
end