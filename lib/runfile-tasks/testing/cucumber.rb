module RunfileTasks
  module Testing
    extend self

    def cucumber
      usage  "(feature|features) [<tag_or_file>]"
      help   "Run cucumber feature tests. Optionally, specify a tag or a filename to run. Tags should be prefixed with @."
      action :feature, :features do |args|
        cmd = "cucumber"
        single = args['<tag_or_file>']
        if single
          if single[0] == '@' 
            say "!txtgrn!Running features tagged #{single}"
            cmd = "#{cmd} --tags #{single}"
          else
            say "!txtgrn!Running #{single} features"
            cmd = "#{cmd} 'features/#{single}.feature'"
          end
        end
        exec cmd
      end
    end

    def cucumber_docs(filename='stepdefs.md')
      usage  "stepdefs"
      help   "Generate step definitions markdown document.\n" +
             "Comments in the step definition file that start with two or " +
             "more # characters, will also be added to the output " +
             "document, as captions."
      action :stepdefs do
        step = /^(Given|When|Then)\((\/.*\/)\) do.*$/
        caption = /^(\#{2,6} .*)$/
        files = Dir['features/step_definitions/**/*.rb']
        doc = []
        doc << "# Cucumber Step Definitions Summary\n"
        doc << "Generated by `run stepdefs`."
        files.each do |file|
          doc << "\n## #{File.basename(file, '.rb')}\n"
          File.readlines(file).each do |line|
            if matches = step.match(line)
              clause = matches.captures[0]
              definition = matches.captures[1] # .gsub /(".*?")/, '`__\1__`'
              doc << "- __`#{clause}`__ `#{definition}`"
            end
            if matches = caption.match(line)
              title = matches.captures[0]
              doc << "\n#{title}\n"
            end
          end
        end
        doc = doc.join "\n"
        File.write filename, doc
        say "Generated #{filename}"  
      end

    end
  
  end
end
