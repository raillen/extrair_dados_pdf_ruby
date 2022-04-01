require_relative 'entidades/pdf.rb'
require_relative 'entidades/utils.rb'

pdfs = pdf_counter(ARGV[0])

OS.clear
OS.install_dependencies
sleep(2)
OS.clear

OS.progress_bar pdfs, 0.2

#retorna um objeto
analise = pdf_analysis(pdfs)

json_generator(analise)
puts OS.json_ok