require 'runfile-tasks/refinements'

module RunfileTasks
  module Docs
    extend self
    using Refinements

    @@default_rdoc_options = [
      "--main README.md",
      "--all",
    ]

    def rdoc(files=nil, options=@@default_rdoc_options)
      files or files = Dir['**/*.{rb,md}']
      files = "'" + files.join("' '") + "'"
      usage  "rdoc [-- OPTIONS...]"
      help   "Generate documentation using the rdoc command line tool. To pass arguments to rdoc, place them after '--'."
      action :rdoc do |args|
        inopts = args['OPTIONS']
        options = inopts unless inopts.empty?
        options = options.join(' ')
        cmd = "rdoc #{options} #{files}"
        puts "g`Running:` p`#{cmd}`".in_color
        system cmd
      end
    end
  end
end