require 'pdf-reader'
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

    data = {
        pages: [],
        pdf_directory: [],
        pdf_quantity: 0,
    }

    unless pdf_array.nil?
        pdf_array.each do |pdf|
            data[:pdf_directory] << pdf
            data[:pages] << PDF::Reader.new(pdf).page_count
            data[:pdf_quantity] += 1
        end
    else
        data = "Não existem pdf's nesse diretório!"
    end

    data
end


def json_generator data

    i = 0
    pdf_infos = OS.create_text_file('pdf_infos')
    pdf_directory = data[:pdf_directory]
    pdf_pages = data[:pages]

    pdf_infos << "[\n"
        data[:pdf_quantity].times do     
            pdf_infos << <<~info 
                {
                    "pdfName": "#{pdf_directory[i].slice(pdf_directory[i].rindex('/')+1, pdf_directory[i].size)}",
                    "pdfPages": #{pdf_pages[i]},
                    "pdfDirectory": "#{pdf_directory[i]}"
                },
                
            info
             
            i+=1
        end
        pdf_infos << "]"
end