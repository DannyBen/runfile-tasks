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

SOON.  
For now, here is a [random cat].


---
[Runfile]: https://github.com/DannyBen/runfile
[random cat]: http://thecatapi.com/api/images/get
