module RunfileTasks
  module Docs
    extend self

    @@default_rdoc_options = [
      "--main README.md",
      "--all",
    ]

    def rdoc(files=nil, options=@@default_rdoc_options)
      files or files = Dir['**/*.{rb,md}']
      files = "'" + files.join("' '") + "'"
      usage  "rdoc [-- <options>...]"
      help   "Generate documentation using the rdoc command line tool. To pass arguments to rdoc, place them after '--'."
      action :rdoc do |args|
        inopts = args['<options>']
        options = inopts unless inopts.empty?
        options = options.join(' ')
        cmd = "rdoc #{options} #{files}"
        say "!txtgrn!Running: !txtpur!#{cmd}"
        system cmd
      end
    end
  end
end