require 'open-uri'

def get_campus_map(msg)
  if msg =~ /BKC/
    return 'https://watnownagi.herokuapp.com/img/BKC.jpg'
  elsif msg =~ /KIC/ or msg =~ /衣笠/
    return 'https://watnownagi.herokuapp.com/img/KIC.jpg'
  elsif msg =~ /OIC/
    return 'https://watnownagi.herokuapp.com/img/OIC.jpg'
  else
    return ''
  end
end