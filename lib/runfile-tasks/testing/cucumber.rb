module RunfileTasks
  module Testing
    extend self

    def cucumber
      usage  "(feature|features) [current]"
      help   "Run cucumber feature tests"
      action :feature, :features do |args|
        cmd = "cucumber"
        cmd = "#{cmd} --tags @current" if args['current']
        exec cmd
      end
    end
  
  end
end
