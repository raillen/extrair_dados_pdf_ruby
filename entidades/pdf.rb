require 'pdf-reader'
require 'json'
require_relative 'utils'

@no_pdf_related = "Hasn't pdf in this directory"

def pdf_counter
  pdf_arr = []
  directory = Dir["#{ARGV[0]}/**/*.{pdf}"]

  # if there's pdf on folder, it'll push into array
  directory.each { |pdf| pdf_arr << pdf } unless directory.empty?

  pdf_arr
end

def pdf_analysis(pdf_array)
  data = []

  if pdf_array.any?
    pdf_array.each do |pdf|
      remove_dir = pdf.rindex('/') + 1
      remove_extension = pdf.rindex('.')

      data.push(
        {
          pdf_name: pdf[remove_dir...remove_extension],
          pages: PDF::Reader.new(pdf).page_count,
          pdf_directory: pdf
        })
    end
  else
    data = @no_pdf_related
  end

  data
end

def json_generator(data)
  time = Time.now.strftime('%m-%d-%Y %k:%M:%S')

  pdf_infos = OS.create_json_file("pdf_infos #{time}")
  pdf_infos << JSON.pretty_generate(data)
end
