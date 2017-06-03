module Text
  def set_token(token)
    @token = token
  end

  def reply_text
    client.reply_message(event['replyToken'], { type: 'text', text: self })
  end
end