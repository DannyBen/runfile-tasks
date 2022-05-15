require 'runfile-tasks/refinements'

module RunfileTasks
  module Docker
    extend self
    using Refinements

    def all(image_name, image_version)
      build image_name, image_version
      test image_name, image_version
      push image_name, image_version
    end

    def build(image_name, image_version)
      command "docker"

      help   "Build the docker image"
      action :build, :b do |args|
        puts "g`Building docker image #{image_name}`".in_color
        system "docker build -t #{image_name} ."
        system "docker tag #{image_name} #{image_name}:#{image_version}"
        system "docker images | grep #{image_name}"
      end

      endcommand
    end

    def test(image_name, image_version)
      command "docker"

      help   "Test the --version flag in the dockerized version"
      action :test, :t do |args|
        docker_version = `docker run --rm #{image_name} --version`.chomp
        if docker_version != image_version
          puts "r`FAIL: docker version is #{docker_version}, expected #{image_version}`".in_color
          exit 1
        else
          puts "g`PASS: docker version is #{docker_version}`"
        end
      end

      endcommand
    end

    def push(image_name, image_version)
      command "docker"

      help   "Build the docker image"
      action :push, :p do |args|
        puts "g`Pushing docker image #{image_name}`".in_color
        system "docker push #{image_name}"
        system "docker push #{image_name}:#{image_version}"
      end

      endcommand
    end


  end

end