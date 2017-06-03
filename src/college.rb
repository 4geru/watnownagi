require 'json'
require './lib/module'

def is_include_college(str)
  colleges = open('./json/college.json') { |io| JSON.load(io) }
  colleges.each{ |college, value|
    return value if str.match(college)
  }
  false
end

def get_college(str)
  colleges = open('./json/college.json') { |io| JSON.load(io) }
  colleges.each{ |college, value|
    return "#{value['college']}ですね！ キャンパスは#{value['canpus']}です！" 
      if str.match(college)
  }
end

#print "#{get_college('isだよー')}"