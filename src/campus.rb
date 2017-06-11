
def get_campus_map(msg)
  if msg =~ /BKC/
    return 'http://www.ritsumei.ac.jp/image.jsp?id=227633'
  elsif msg =~ /KIC/ or msg =~ /衣笠/
    return 'http://www.ritsumei.ac.jp/image.jsp?id=229812'
  elsif msg =~ /OIC/
    return 'http://www.ritsumei.ac.jp/image.jsp?id=229814'
  else
    return ''
  end
end