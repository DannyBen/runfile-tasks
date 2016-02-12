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

      usage  "#{opts[:action]} [<name>]"
      help   "Run all specs or a single spec file matching a regex."
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
        say "!txtgrn!Running: !txtpur!#{cmd}"
        system cmd
      end
    end
  end

end