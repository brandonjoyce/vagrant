require_relative 'lib/functions'

github_projects = ENV['GITHUB_PROJECTS'].split(':')
bitbucket_projects = ENV['BITBUCKET_PROJECTS'].split(':')
code_folder = "/vagrant/code"

github_projects.each do |project|
  Functions.setup_project('git@github.com', project, code_folder)
end

bitbucket_projects.each do |project|
  Functions.setup_project('git@bitbucket.com', project, code_folder)
end
