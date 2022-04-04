require_relative 'entidades/pdf.rb'
require_relative 'entidades/utils.rb'

pdfs = pdf_counter

OS.clear
OS.install_dependencies
sleep(1.5)
OS.clear


# returns an array with the obj that contains pdf data
analise = pdf_analysis(pdfs)

json_generator(analise)


puts OS.progress_bar(pdfs, 0.2)
puts OS.json_ok
