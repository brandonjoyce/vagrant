require_relative 'lib/functions'

github_projects = ENV['GITHUB_PROJECTS'].split(':')
bitbucket_projects = ENV['BITBUCKET_PROJECTS'].split(':')
code_folder = "/vagrant/code"

github_projects.each do |project|
  setup_project.call('git@github.com', project)
end

bitbucket_projects.each do |project|
  setup_project.call('git@bitbucket.com', project)
end
