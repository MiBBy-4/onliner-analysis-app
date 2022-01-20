class RateCommentService < ApplicationService
  URL = "https://language.googleapis.com/v1beta2/documents:analyzeSentiment?key=AIzaSyARfeAHElRfkGkT8FXOtrVzBYNPXLG3WFY"
  def initialize(content)
    @content = content
  end

  def call
    response = HTTPX.post(URL, json:{
      document: {
        language: "en",
        content: @content,
        type: "PLAIN_TEXT"
      },
      encodingType: "NONE"
    }
  )
  data_hash = JSON.parse(response.body)
  document_sentiment = data_hash['documentSentiment']
  document_sentiment['score'].to_f*100
  end
end
