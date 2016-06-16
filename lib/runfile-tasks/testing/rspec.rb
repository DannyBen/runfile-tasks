module RunfileTasks
  module Testing
    extend self

    def rspec(opts={})
      opts = { action: opts } if opts.is_a? String
      
      opts = {
        action:  'spec', 
        pattern: './spec/**/*_spec.rb',
        command: 'rspec'
      }.merge opts

      usage  "#{opts[:action]} [<name>] [<tag>]"
      help   "Run all specs or a single spec file matching a regex. You can provide a tag to run only specific tests."
      action opts[:action].to_sym do |args|
        if args['<name>'] 
          files = Dir[opts[:pattern]]  
          files.select! { |file| file =~ /#{args['<name>']}/i }
          abort "Cannot find a matching spec file with #{opts[:pattern]}" if files.empty?
          file = files.first
          cmd = "#{opts[:command]} \"#{file}\""
        else
          cmd = "#{opts[:command]}"
        end
        cmd = "#{cmd} --tag #{args['<tag>']}" if args['<tag>']
        say "!txtgrn!Running: !txtpur!#{cmd}"
        system cmd
      end
    end
  end

end