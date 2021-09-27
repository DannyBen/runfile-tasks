require 'fileutils'
require 'runfile-tasks/refinements'

module RunfileTasks
  module RubyGems
    extend self
    using Refinements

    def all(gemname, gemdir="gems")
      build gemname, gemdir
      publish gemname, gemdir
    end

    def build(gemname, gemdir="gems")
      gemver = get_gemver gemname

      command "gem"

      usage  "build [--install]"
      help   "Build gem from gemspec and move it to '#{gemdir}' folder.\nUse --install to also install it."
      action :build do |args|
        puts "g`Building gem`".in_color
        cmd = "gem build #{gemname}.gemspec"  
        puts "g`Running:` p`#{cmd}`".in_color
        system cmd
        puts "g`Moving gem file to #{gemdir}`".in_color
        files = Dir["*.gem"]
        Dir.exist? gemdir or FileUtils.mkdir gemdir
        files.each {|f| FileUtils.mv f, gemdir }
        args['--install'] and execute "gem install"
      end

      usage  "install [--remote]"
      help   "Install gem from local gem file or from rubygems (--remote)."
      action :install do |args|
        if args['--remote']
          cmd = "gem install #{gemname}"
        else
          gemfile = "gems/#{gemname}-#{gemver}.gem"
          cmd = "gem install #{gemfile}"
        end
        puts "g`Running:` p`#{cmd}`".in_color
        system cmd
      end

      endcommand
    end

    def publish(gemname, gemdir="gems")
      gemver = get_gemver gemname
      
      command "gem"

      help   "Publish gem to rubygems. Make sure to 'run gem build' before you publish."
      action :publish do
        gemfile = "gems/#{gemname}-#{gemver}.gem"
        File.exist? gemfile or abort "File not found #{gemfile}"
        cmd = "gem push #{gemfile}"
        puts "g`Running:` p`#{cmd}`".in_color
        system cmd
      end

      usage  "yank [VERSION]"
      help   "Yank gem from rubygems."
      action :yank do |args|
        ver = args['VERSION'] || gemver
        cmd = "gem yank #{gemname} -v #{ver}"
        puts "g`Running:` p`#{cmd}`".in_color
        system cmd
      end
      
      endcommand
    end

    def get_gemver(gemname)
      spec = Gem::Specification::load "#{gemname}.gemspec"
      spec or abort "Error loading #{gemname}.gemspec"
      spec.version.to_s
    end

  end

end