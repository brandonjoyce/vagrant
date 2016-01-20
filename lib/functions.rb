class Functions
  def self.get_project url, folder
    if File.directory?(folder)
      Dir.chdir(folder) do
        puts `git pull`
      end
    else
      puts `yes | git clone #{url} #{folder}`
    end
  end

  def self.setup_project scm_host, project, code_folder
    project_name = project.downcase.gsub(/\.git/, '').gsub(/\//, '.')
    project_folder = "#{code_folder}/#{project_name}"
    project_url = "#{scm_host}:#{project}"

    get_project(project_url, project_folder)

    Dir.chdir(project_folder) do
      puts `sh script/setup`
    end
  end
end
