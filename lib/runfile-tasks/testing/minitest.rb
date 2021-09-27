require 'runfile-tasks/refinements'

module RunfileTasks
  module Testing
    extend self
    using Refinements

    def minitest(pattern="./test/*_test.rb")
      usage  "test [NAME]"
      help   "Run all tests or a single test file."
      action :test do |args|
        if args['NAME'] 
          file = pattern.sub "*", args['NAME']
          puts "g`Using:` p`#{file}`".in_color
          require file
        else
          Dir[pattern].each do |file| 
            puts "g`Using:` p`#{file}`".in_color
            require file
          end
        end
      end
    end

  end
end