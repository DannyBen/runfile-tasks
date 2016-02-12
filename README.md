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

Include any of the tasks you need with:

```ruby
RunfileTasks::RubyGems.all 'runfile-tasks'
RunfileTasks::Testing.cucumber
RunfileTasks::Docs.rdoc
```


## Task Index

SOON.  
For now, here is a [random cat].


---
[Runfile]: https://github.com/DannyBen/runfile
[random cat]: http://thecatapi.com/api/images/get
