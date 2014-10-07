require_relative "parser"

module KindleClipper
  
  class Application
    def initialize(argv)
      # last option 
        @file_format = argv[-1]
        @file_paths = argv - @file_format
    end
    
    # We no longer ask the format module/factory to give as a generator object but simply pass in the command line argument
    # to the parser 
    # format = Format.get_format(file_format)  
    
    def run
      @file_paths.do |file_path|
        my_parser = Parser.new(file_path, @file_format.capitalize)
        my_parser.convert
      end
    end
    
  end
  
end