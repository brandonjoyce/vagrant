get_project = lambda do |url, folder|
  if File.directory?(folder)
    Dir.chdir(folder) do
      puts `git pull`
    end
  else
    puts `yes | git clone #{url} #{folder}`
  end
end

setup_project = lambda do |scm_host, project|
  project_name = project.downcase.gsub(/\.git/, '').gsub(/\//, '.')
  project_folder = "#{code_folder}/#{project_name}"
  project_url = "#{scm_host}:#{project}"

  get_project.call(project_url, project_folder)

  Dir.chdir(project_folder) do
    puts `sh script/setup`
  end
end

