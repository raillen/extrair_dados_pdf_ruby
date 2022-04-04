require 'rbconfig'

module OS
    def self.name
        RbConfig::CONFIG['host_os']
    end

    
    def self.create_json_file file_name = ""
        home = ENV['HOME']
        file = ''
    
        case OS.name
        when 'mingw32'#windows
            file = File.open(home + "/desktop/#{file_name}.json", 'w')
        when 'mswin' #windows
            file = File.open(home + "/desktop/#{file_name}.json", 'w')
        when 'linux'
            file = File.open(home + "/#{file_name}.json", 'w')
        when 'darwin'
            file = File.open(home + "/desktop/#{file_name}.json", 'w')
        else
            file = File.open(home + "/#{file_name}.json", 'w')
        end
    
        file
    end

    def self.install_dependencies
        puts 'Instalando dependências...'
        system("gem install bundler") if !system("gem list bundler")
        system("bundle install") if !system('bundle check')
        puts "Dependências instaladas."
    end

    def self.clear
        system('cls') || system('clear')
    end

    def self.json_ok
        if OS.name == 'mingw32' || OS.name == 'darwin' || OS.name == "mswin"
            "\nArquivos .json gerado em #{ENV['HOME']}/desktop"
        else
            "\nArquivos .json gerado em #{ENV['HOME']}"
        end
    end

    ## just a fake progress bar
    def self.progress_bar counter = [], sleep_time = 0
        arr_size = counter.size.to_f
        
        
        if counter.any?
            0.step(100, (100/arr_size).ceil(2)) do |i|
                print "Processando: #{i.ceil(2)}%\r"
                sleep(sleep_time)
            end
        else
            print "Processando: 100%"
        end
    end
end

