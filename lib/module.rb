module Text
  def initialize
    super
    puts 'module initialized'
  end
  
  def reply_text
    client.reply_message(event['replyToken'], { type: 'text', text: self })
  end
end