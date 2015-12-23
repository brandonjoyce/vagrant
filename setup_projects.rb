github_projects = ENV['GITHUB_PROJECTS'].split(':')
bitbucket_projects = ENV['BITBUCKET_PROJECTS'].split(':')
code_folder = "/vagrant/code"

setup_project = lambda do |scm_host, project|
  project_name = project.downcase.gsub(/\.git/, '').gsub(/\//, '.')
  project_folder = "#{code_folder}/#{project_name}"
  if File.directory?(project_folder)
    Dir.chdir(project_folder) do
      puts `git pull`
    end
  else
    puts `yes | git clone #{scm_host}:#{project} #{project_folder}`
  end
  Dir.chdir(project_folder) do
    puts `sh script/setup`
  end
end

github_projects.each { |project| setup_project.call('git@github.com', project) }
bitbucket_projects.each { |project| setup_project.call('git@bitbucket.com', project) }
