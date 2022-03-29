require_relative 'entidades/pdf.rb'
require_relative 'entidades/utils.rb'

pdfs = pdf_counter(ARGV[0])

OS.clear
OS.install_dependencies
sleep(3)
OS.clear

## só uma barra de progresso.
0.step(100, (100/pdfs.size.to_f).ceil(2)) do |i|
    print "Processando: #{i.ceil(2)}%\r"
    sleep(0.5)
end

#retorna um objeto
analise = pdf_analysis(pdfs)

json_generator(analise)

puts "\nArquivos .json gerado em #{ENV['HOME']}"