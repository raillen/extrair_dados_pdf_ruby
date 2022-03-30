require 'pdf-reader'
require 'json'
require_relative 'utils.rb'

def pdf_counter directories = ""
    pdfs = []
    dir = Dir["#{'' + directories + ''}/**/*.{pdf}"]
    ## se houver pdfs na pasta, serão adicionado ao array
    if dir.size > 0
        dir.each { |p| pdfs.push(p)}
        pdfs
    else
        pdfs = nil
    end
end


def pdf_analysis pdf_array

    data = []

    unless pdf_array.nil?
        pdf_array.each do |pdf|
            data.push({
                pdf_name: "#{pdf.slice(pdf.rindex('/') + 1, pdf.size)}",
                pages: PDF::Reader.new(pdf).page_count,
                pdf_directory: pdf
            })
        end
    else
        data.push("Não existem pdf's nesse diretório!")
    end

    data
end


def json_generator data
    pdf_infos = OS.create_json_file('pdf_infos')
    pdf_infos << JSON.pretty_generate(data)
end