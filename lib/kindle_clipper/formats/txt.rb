module KindleClipper
  class Txt
  
    def render(file_name, body)
      txt_file_name = file_name + ".txt"
		
  		File.open( txt_file_name , 'w') do |file|
  			file.puts body
  		end
		
    end
  end
end