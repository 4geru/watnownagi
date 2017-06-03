require 'json'

def random_menu
  menus = JSON.parse(open('./json/menus.json') { |io|
    JSON.load(io)
  })
  key = menus.keys.shuffle[0]
  menus[key]
end