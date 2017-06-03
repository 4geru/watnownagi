module Text
  def set_token(token)
    @token = token
  end

  def reply_text
    client.reply_message(@token, { type: 'text', text: self })
  end
end

module Image
  def set_token(token)
    @token = token
  end

  def reply_image(originalContentUrl, previewImageUrl = nil)
    client.reply_message(@token, {
      type: "image",
      originalContentUrl: originalContentUrl,
      previewImageUrl: previewImageUrl || originalContentUrl
    })
  end
end