require "rubygems"
require "prawn"
module KindleClipper
  class Pdf
  
    def render(file_name, body)
      pdf_file_name = file_name + ".pdf"
      pdf = Prawn::Document.new
      pdf.text body
      pdf.render_file(pdf_file_name)
    end
  
  end
end