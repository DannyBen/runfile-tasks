# Runfile Tasks

A library of tasks ready to be included in your [Runfile].

Note that this version of the gem is intended for Runfile version >= 1.0.

If you are using an older version of Runfile, you will also need to lock the 
runfile-tasks version.

```ruby
gem 'runfile-tasks', '< 1.0'
```

## Install

Manually:

```shell
$ gem install runfile-tasks
```

With bundler:

```ruby
gem 'runfile-tasks'
```

## Usage

In your Runfile, use the `import_gem` directive to require any of the runfiles:

```ruby
title 'My Runfile'

# commands for building and publishing your gem
import_gem 'runfile-tasks/gem'
# or without publish/yank actions
import_gem 'runfile-tasks/gem', private: true

# commands for building and publishing your Dockerfile
import_gem 'runfile-tasks/docker', image: 'my/image', version: '1.2.3'
```

---
[Runfile]: https://github.com/DannyBen/runfile
