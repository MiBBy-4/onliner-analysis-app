require 'rails_helper'

RSpec.describe 'CreateCommentService' do
  describe 'call method' do
    let(:article_instance) {
      create(:article)
    }
    context 'test CommentsScraper' do
      it 'should expect the call of CommentsScraper' do
        expect(CommentsScraper).to receive(:call)
        CreateCommentService.call(article_instance.link, article_instance.id)
      end
    end
    context 'test the comment_rate method' do
      it 'should expect the call of RateComment Service' do
        expect(RateCommentService).to receive(:call)
        CreateCommentService.call(article_instance.link, article_instance.id)
      end
    end
  end
end