require "rbconfig"
require "uri"
require "bundler/setup"
Bundler.require

class Dotfiles < Thor

  desc "setup", "Runs all setup tasks."
  def setup
    install_homebrew
    update_homebrew
    install_git
    install_bash_completion
    install_rvm
    update_rvm
    install_fonts
    install_vim
    download_solarized
    setup_symlinks
    setup_executables
    `source $HOME/.bashrc`
    puts "Finished... Your system is now ready to kick some ass!".ljust(80).red
  end

  desc "install_homebrew", "Installs homebrew for Mac systems"
  def install_homebrew
    return unless mac?
    return if in_path?(:brew)
    puts "Installing Homebrew".ljust(80, ".").red
    `/usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"`
  end

  desc "update_homebrew", "Updates homebrew for Mac systems"
  def update_homebrew
    return unless mac?
    puts "Updating Homebrew".ljust(80, ".").yellow
    `brew update`
  end

  desc "install_git", "Installs GIT"
  def install_git
    return if in_path?(:git)
    puts "Installing GIT".ljust(80, ".").red
    if in_path?(:brew)
      `#{install_command} git`
    else
      `#{install_command} git-core`
    end
  end

  desc "install_bash_completion", "Installs bash-completion"
  def install_bash_completion
    puts "Installing bash-completion".ljust(80, ".").red
    should_install = `ls /etc/bash_completion` =~ /No such file or directory/i ? true : false
    if should_install
      should_install = `ls /usr/local/etc/bash_completion` =~ /No such file or directory/i ? true : false
    end
    `#{install_command} bash-completion` if should_install
  end

  desc "install_rvm", "Installs RVM"
  def install_rvm
    return if in_path?(:rvm)
    puts "Installing RVM".ljust(80, ".").red
    `curl -L get.rvm.io | bash -s stable`
  end

  desc "update_rvm", "Updates RVM"
  def update_rvm
    return unless in_path?(:rvm)
    puts "Updating RVM".ljust(80, ".").yellow
    `rvm get latest`
  end

  desc "install_fonts", "Installs preferred fonts (Anonymous Pro, etc...)"
  def install_fonts
    puts "Installing fonts".ljust(80, ".").red
    font_uri = "http://hopsoft.github.com/assets/fonts"
    font_dir = "$HOME/.fonts"
    font_dir = "$HOME/Library/Fonts" if mac?
    `mkdir -p #{font_dir}`
    fonts = ["Anonymous Pro.ttf", "Anonymous Pro B.ttf", "Anonymous Pro BI.ttf", "Anonymous Pro I.ttf"]
    fonts.each do |font|
      puts "Installing #{font}".ljust(80, ".").light_red
      path = File.join(font_dir, font)
      `curl -L #{font_uri}/#{URI.escape(font)} > "#{path}"`
    end
  end

  desc "install_vim", "Installs the Janus distribution of VIM. https://github.com/carlhuda/janus"
  def install_vim
    puts "Installing VIM".ljust(80, ".").red
    catalog(File.join("$HOME", ".vim.old"))
    `#{install_command} vim` if !in_path(:vim)
    `brew install macvim` if mac? && !in_path?(:mvim)
    `curl -Lo- http://bit.ly/janus-bootstrap | bash`
  end

  desc "download_solarized", "Downloads Solarized color schemes. http://ethanschoonover.com/solarized"
  def download_solarized
    puts "Downloading Solarized color schemes".ljust(80, ".").green
    `mkdir -p #{File.join(my_path, "assets")}`

    path = File.join(my_path, "assets", "solarized")
    if File.exists?(path)
      `cd #{path} && git checkout . && git pull origin master`
    else
      `git clone https://github.com/altercation/solarized.git #{path}`
    end

    path = File.join(my_path, "assets", "solarized-alt")
    if File.exists?(path)
      `cd #{path} && git checkout . && git pull origin master`
    else
      `git clone https://github.com/brianmichel/solarized.git #{path}`
    end
  end

  desc "setup_symlinks", "Sets up symlinks for [~/.bashrc, ~/.bash_profile, ~/.gitconfig] etc..."
  def setup_symlinks
    puts "Setting up symlinks".ljust(80, ".").red
    [".bashrc", ".bash_profile", ".gitconfig", ".gitignore", ".vimrc.after", ".gvimrc.after"].each do |file|
      target = File.join("$HOME", file)
      source = File.join(my_path, file)
      catalog(target)
      `ln -s #{source} #{target}`
    end

    `touch #{File.join(my_path, ".private")}`
    `source $HOME/.bash_profile`
  end

  desc "setup_executables", "Sets up executables for [dotdir] etc..."
  def setup_executables
    puts "Setting up executables".ljust(80, ".").red
    ["dotdir.rb"].each do |file|
      target = "/usr/bin/#{file.gsub(/\.rb$/, "")}"
      source = File.join(my_path, "scripts", file)
      catalog(target)
      `sudo ln -s #{source} #{target}`
    end
  end

  no_tasks do

    # Cataglogs a file or directory by renaming it as [path + 'old' + date]
    def catalog(path)
      if File.exists?(path)
        new_path = path.clone
        new_path << ".old" unless new_path =~ /\.old/i
        new_path << ".#{Time.now.strftime("%Y%m%d%H%M%S")}"
        puts "Moving #{path} -> #{new_path}".ljust(80).light_red
        `mv #{path} #{new_path}` rescue puts $!
      end
    end

    # Returns the expanded path for the current script.
    def my_path
      File.expand_path(File.dirname(__FILE__))
    end

    # Indicates if the executable exists in the PATH.
    def in_path?(name)
      (`which #{name}`).to_s.strip.size > 0
    end

    # Returns the install command for the current host.
    # Only supports [brew, apt-get, yum]
    def install_command
      return "brew install" if in_path?(:brew)
      return "sudo apt-get install" if in_path?("apt-get")
      return "sudo yum install" if in_path?("yum")
    end

    # Indicates if this machine is a Macintosh.
    def mac?
      Config::CONFIG["host_os"] =~ /darwin/i ? true : false
    end

    # A Hash to hold setup information.
    def info
      @info ||= {}
    end

  end

end
