class CreateCommentService < ApplicationService
  def initialize(article_url, article_id)
    @article_url = article_url
    @article_id = article_id
  end

  def call
    @comments = CommentsScraper.call(@article_url)
    @comments.each do |comment|
      new_comment = Comment.new(content: comment[:content])
      new_comment.article_id = @article_id
      new_comment.rate = comment_rate(comment[:content])
      new_comment.save!
    end
  end

  private

  def comment_rate(content)
    RateCommentService.call(content)
  end
end
