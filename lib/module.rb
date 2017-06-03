module Text
  def set_token(token)
    @token = token
  end

  def reply_text(word)
    client.reply_message(@token, { type: 'text', text: word || self })
  end
end

module Image
  def set_token(token)
    @token = token
  end

  def get_token
    @token
  end

  def reply_image(originalContentUrl, previewImageUrl = nil)
    client.reply_message(@token, {
      type: "image",
      originalContentUrl: originalContentUrl,
      previewImageUrl: previewImageUrl || originalContentUrl
    })
  end
end