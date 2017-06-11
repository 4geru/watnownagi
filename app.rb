require 'sinatra'
require 'line/bot'

require './src/menu'
require './src/college'
require './src/campus'
require './lib/module'

get '/' do
  message = "Hello world"
  message.extend(Text)
  message.reply_text.to_s
end

def client
  @client ||= Line::Bot::Client.new { |config|
    config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
    config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
  }
end

post '/callback' do
  body = request.body.read

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end

  events = client.parse_events_from(body)
  events.each { |event|
    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text
        token = event.message['text']
        token.extend(Text)
        token.set_token(event['replyToken'])
        if event.message['text'] =~ /いなむー/
          word = ['いなむらくーん', 'いなむーだよ', '俺いなむー！'][Random.rand(3).to_i]
          token.reply_text(word)
        elsif event.message['text'] =~ /メシ/
          menu = random_menu
          token.extend(Image) # 画像データに変換
          url = "https://www.u-coop.net/food/menu/menu_images/#{menu['id']}.jpg"
          token.reply_image(url)
        elsif event.message['text'] =~ /マップ/ or event.message['text'] =~ /地図/ or event.message['text'] =~ /map/
          campus_image_url = get_campus_map(token)
          token.reply_image(campus_image_url)
        elsif is_include_college(token)
          token.reply_text(get_college(get_campus_map))
        end
        token.reply_text
      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        response = client.get_message_content(event.message['id'])
        tf = Tempfile.open("content")
        tf.write(response.body)
      end
    end
  }

  "OK"
end