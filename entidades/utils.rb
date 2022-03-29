require 'rbconfig'

module OS
    def self.name
        RbConfig::CONFIG['host_os']
    end

    
    def self.create_text_file file_name = ""
        home = ENV['HOME']
        file = ''
    
        case OS.name
        when 'linux'
            file = File.open(home + "/#{file_name}.json", 'w')
        when 'darwin'
            file = File.open(home + "/desktop/#{file_name}.json", 'w')
        when 'mswin|mingw32|windows'
            file = File.open(home + "desktop/#{file_name}.json", 'w')
        else
            file = File.open(home + "/#{file_name}.json", 'w')
        end
    
        file
    end

    def self.install_dependencies
        puts 'Instalando dependências...'
        system("gem install bundler") if !system("gem list bundler")
        system("bundle install")
        puts "Dependências instaladas."
    end

    def self.clear
        system('cls') || system('clear')
    end
end

