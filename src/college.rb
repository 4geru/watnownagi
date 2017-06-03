require 'json'

def get_college(str)
  colleges = open('../json/college.json') { |io|
    JSON.load(io)
  }
  colleges.each{ |college, value|
    if str.match(college)
      print "#{college}, #{value}\n"
    end
  }
  true
end

#print "get_college('isだよー')"