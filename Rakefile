require 'fileutils'

class Installer
  def install
    dotfiles.each { |src| check_link(src, "~/.#{src}") }
    config_files.each { |src| check_link(src, "~/.#{src}") }
  end

  private

  def dotfiles
    Dir['*'] - ['Rakefile', 'README.md', 'off', 'config']
  end

  def config_files
    Dir["config/**/*"].select { |file| File.file?(file) }
  end

  def check_link(src, dest)
    source = File.expand_path(src)
    destination = File.expand_path(dest)

    if File.exist?(destination)
      puts "#{dest} exists"
    else
      puts "Linking #{dest} -> #{src}"
      link(source, destination)
    end
  end

  def link(source, destination)
    FileUtils.mkdir_p(File.dirname(destination))
    FileUtils.ln_s(source, destination)
  end
end

desc 'Install'
task :install do
  Installer.new.install
end
