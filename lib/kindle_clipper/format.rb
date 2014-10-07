require_relative "utility/clean_string"

module KindleClipper
  class Format
  
    def self.generate(format_strategy, hash_bytitle)
      hash_bytitle.each do |title, body|
        file_name = title.to_s
        body = CleanString.to_string(title, body)
        format_strategy.render(file_name, body)
      end
    end
  
    # add formatting specific methods
  end
end