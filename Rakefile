require 'fileutils'

class Installer
  def install
    dotfiles.each do |src|
      dest = "~/.#{src}"

      source = File.expand_path(src)
      destination = File.expand_path(dest)

      if File.exist?(destination)
        puts "#{dest} exists"
      else
        puts "Linking #{dest}"
        link(source, destination)
      end
    end
  end

  def dotfiles
    Dir['*'] - ['Rakefile', 'README.md']
  end

  def link(source, destination)
    FileUtils.ln_s(source, destination)
  end

end

desc 'Install'
task :install do
  Installer.new.install
end
