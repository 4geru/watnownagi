require 'json'



def random_menu
  menus = JSON.parse(open('../json/menus.json') { |io|
    JSON.load(io)
  })
  key = menus.keys.shuffle[0]
  menus[key]
end

def reply_menu
  menu = random_menu
  {
    "type": "template",
    "altText": "給食ガチャ",
    "template": {
        "type": "carousel",
        "columns": [
            {
              "thumbnailImageUrl": "https://www.u-coop.net/food/menu/menu_images/#{menu['id']}.jpg",
              "title": "#{menu['title']}",
            }
        ]

    }
  }
end