require 'runfile-tasks/refinements'

module RunfileTasks
  module Testing
    extend self
    using Refinements

    def rspec(opts={})
      opts = { action: opts } if opts.is_a? String
      
      opts = {
        action:  'spec', 
        pattern: './spec/**/*_spec.rb',
        command: 'rspec'
      }.merge opts

      usage  opts[:action] == :global ? "[NAME] [TAG]" : "#{opts[:action]} [NAME] [TAG]"
      help   "Run all specs or a single spec file matching a regex. You can provide a tag to run only specific tests. If you wish to provide a tag only, without a file pattern, simply prefix the tag with a colon, like 'run spec :focus'"
      action opts[:action].to_sym do |args|
        file = args['NAME'] 
        tag  = args['TAG'] 

        if file and file[0] == ':'
          tag = file
          file = nil
        end

        if tag and tag[0] == ':'
          tag = tag[1..-1]
        end

        if file
          files = Dir[opts[:pattern]]  
          files.select! { |f| f =~ /#{file}/i }
          abort "Cannot find a matching spec file with #{opts[:pattern]}" if files.empty?
          file = files.first
          cmd = "#{opts[:command]} \"#{file}\""
        else
          cmd = "#{opts[:command]}"
        end
        cmd = "#{cmd} --tag #{tag}" if tag
        puts "g`Running:` p`#{cmd}`".in_color
        exec cmd
      end
    end
  end

end
