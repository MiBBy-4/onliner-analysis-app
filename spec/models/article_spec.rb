require 'rails_helper'

LINK = 'https://echo.msk.ru/news/2968524-echo.html'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
      expect(Article.new(title: 'Test title', link: LINK)).to be_valid  
  end

  it 'is valid without link' do
    expect(Article.new(title: 'Test title')).to_not be_valid 
  end

  it 'is valid with title which length is less than 3' do
    expect(Article.new(title: 'Te')).to_not be_valid  
  end

  it 'is valid if link is not url' do
    expect(Article.new(title: 'Test title', link: 'foobar')).to_not be_valid  
  end

  it 'calls save_comments method' do
    allow(Article.new(link: LINK)).to receive(:transaction_include_any_action?).with([:save_comments]).and_return(true)  
  end
end
