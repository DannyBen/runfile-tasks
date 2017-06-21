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
      help   "Run all specs or a single spec file matching a regex. You can provide a tag to run only specific tests. If you wish to provide a tag only, without a file pattern, simply prefix the tag with a colon, like 'run spec :focus'"
      action opts[:action].to_sym do |args|
        file = args['<name>'] 
        tag  = args['<tag>'] 

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
        say "!txtgrn!Running: !txtpur!#{cmd}"
        system cmd
      end
    end
  end

end