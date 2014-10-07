require_relative "format.rb"
require_relative "format"
module KindleClipper
  class Parser
    #default file format pdf

    def initialize(path, file_format = "Pdf")
    	@file_path = path
    	@delimiter = /={10}\s*/
    	@title_hash = Hash.new
    	#instantiate format strategy from String
    	@file_format = Object.const_get(file_format.camelize).new
    end

	
    def convert
    	parse_file
    	Format.generate(@file_format, @title_hash)
    end

  	# #parse_file splits the input file into chunks delimited by
  	# ============ 
  	# and adds the title as key to a hash once for every entry
  	# and subsequently the notes are added as value
	
    def parse_file
    #needs begin rescue exception handling 
  	begin 
    		raise FileNotFoundException.new("File not Found") unless File.exists?(@file_path)
	
    		File.open(@file_path).slice_before(@delimiter).each do |chunk|
    			chunk.reject! {|item| item =~ @delimiter }
      		title = chunk.shift
      		if @title_hash.has_key?(title)
      			@title_hash[title] = @title_hash[title] << chunk 
      		else
      		  p chunk
      			@title_hash[title] = chunk
      		end    		
    		end
  		
    	rescue FileNotFoundException => e
  		p e.message
  	end
	
    end 
  
  
    class FileNotFoundException < StandardError
    end
  
  end
end