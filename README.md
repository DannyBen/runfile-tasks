Runfile Tasks
=============

A library of tasks ready to be included in your [Runfile]

## Install

Install the gem or require it in your Gemfile:

	gem 'runfile-tasks'

In your Runfile, you can include either all tasks:

	require 'runfile-tasks'

Or pick and choose from the various task categories:

	require 'runfile-tasks/testing'


Requiring the task packs does not make the available in your Runfile 
immediately. You need to activate any of the tasks you want as described 
below.


## Usage

Include any of the tasks you need in your Runfile like this:

```ruby
require 'runfile-tasks'

name    "Greeter"
summary "A sample Runfile"
version "0.1.0"

# Include rdoc tasks and rspec tasks
RunfileTasks::Docs.rdoc
RunfileTasks::Testing.rspec

# The rest of your Runfile goes here
action :hello do
  puts "world"
end

```


## Task Index

### Testing Tasks

Including all testing tasks:

```ruby
require 'runfile-tasks/testing'
```

#### Testing with RSpec

Commands Added:

- `run spec [NAME]` - Run all specs or a single spec file matching a regex.

```ruby
# Runfile

# Only include the rspec tasks
require 'runfile-tasks/testing/rspec'

# Include the rspec tasks with default configuration
RunfileTasks::Testing.rspec

# Set the Runfile action to 'test' instead of the default 'spec'
RunfileTasks::Testing.rspec 'test'

# Change the default options with a hash (these are the defaults)
RunfileTasks::rspec action: 'spec', 
  pattern: './spec/**/*_spec.rb', command: 'rspec'

```


#### Testing with Minitest

Commands Added:

- `test [NAME]` - Run all tests or a single test file.

```ruby
# Runfile

# Only include the minitest tasks
require 'runfile-tasks/testing/minitest'

# Include the minitest tasks with default configuration
RunfileTasks::Testing.minitest

# Set the file pattern to look for (this is the default)
RunfileTasks::Testing.rspec './test/*_test.rb'

```

#### Testing with Cucumber

Commands Added:

- `(feature|features) [current]` - Run cucumber feature tests

```ruby
# Runfile

# Only include the minitest tasks
require 'runfile-tasks/testing/cucumber'

# Include the cucumber tasks with default configuration
RunfileTasks::Testing.cucumber
```


### Gem Authoring Tasks

Commands Added:

- `build [--install]` - Build gem from gemspec and move it to 'gems' folder. 
   Use --install to also install it.
- `install [--remote]` - Install gem from local gem file or from rubygems 
   (--remote).
- `publish` - Publish gem to rubygems. Make sure to 'run gem build' before 
   you publish.
- `yank [VERSION]` - Yank gem from rubygems.


```ruby
# Runfile
require 'runfile-tasks/rubygems'

# Include the tasks with default configuration. Pass in your gem name.
RunfileTasks::RubyGems.all 'my-gem'

# Set the folder where gems are copied after they are built (default)
RunfileTasks::RubyGems.all 'my-gem', 'gems'
```


### Documentation Tasks

Commands Added:

- `rdoc [-- OPTIONS...]` - Generate documentation using the rdoc command 
  line tool. To pass arguments to rdoc, place them after '--'.


```ruby
# Runfile
require 'runfile-tasks/docs'

# Include the tasks with default configuration.
RunfileTasks::Docs.rdoc

# Set the files to be considered (default below)
RunfileTasks::Docs.rdoc '**/*.{rb,md}'

# Pass any additional option directly to rdoc (defaults below)
RunfileTasks::Docs.rdoc '**/*.{rb,md}', ["--main README.md", "--all",]
```


---
[Runfile]: https://github.com/DannyBen/runfile
[random cat]: http://thecatapi.com/api/images/get
