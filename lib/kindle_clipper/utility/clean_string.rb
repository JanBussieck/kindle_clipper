module KindleClipper
  
  module CleanString
    # takes 
  	def to_string(headline, value)
  		body = value.flatten.compact.inject(""){|text, line| text + line }
    		result = headline.to_s + "\n\n" + body
    	end
  end
  
end