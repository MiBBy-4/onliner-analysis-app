require 'rails_helper'

LINK = 'https://echo.msk.ru/news/2968524-echo.html'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
      expect(Article.new(title: 'Test title', link: LINK)).to be_valid  
  end

  it 'is invalid without link' do
    expect(Article.new(title: 'Test title')).to_not be_valid 
  end

  it 'is invalid with title which length is less than 3' do
    expect(Article.new(title: 'Te')).to_not be_valid  
  end

  it 'is invalid if link is not url' do
    expect(Article.new(title: 'Test title', link: 'foobar')).to_not be_valid  
  end
  
  context 'test the save_comment method' do
    let(:article_instance) { FactoryBot.build_stubbed(:article) }
    before do
      allow(article_instance).to receive(:transaction_include_any_action?).with([:create]).and_return(true)
    end
  
    it 'should expect the call of CreateComment Service' do
      expect(CreateCommentService).to receive(:call)
      article_instance.run_callbacks(:commit)
    end
  end
end
