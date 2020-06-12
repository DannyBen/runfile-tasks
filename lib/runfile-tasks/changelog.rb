module RunfileTasks
  module Changelog
    extend self

    def generator(repo)
      usage  "changelog [--commit]"
      help   "Generate changelog"
      option "-c, --commit", "Also commit CHANGELOG.md"
      action :changelog do |args|
        user, project = repo.split "/"
        commit = args['--commit'] || args['--push']

        run "github_changelog_generator --project #{project} --user #{user}"
        run "git add CHANGELOG.md && git commit -m changelog CHANGELOG.md" if commit
      end
    end
  end
end
