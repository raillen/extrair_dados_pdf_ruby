# É Um pequeno script que retronará um JSON com as seguintes informações dos PDFs.
- NOME DO PDF
- QUANTIDADE DE PÁGINA
- DIRETÓRIO

## Para executá-lo basta
                git clone https://github.com/raillen/extrair_dados_pdf_ruby
                cd extrair_dados_pdf_ruby
                ruby app.rb "<diretorio>"

- Ele instalará as dependências e rodará o script.
- Caso esteja no Linux, o arquivo será salvo na sua pasta HOME, no Windows será salvo na Área de Trabalho.
- O arquivo será gerado com o nome ``pdf_infos mm-dd-yyyy hh:MM:SS``
