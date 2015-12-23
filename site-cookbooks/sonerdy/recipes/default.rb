# create .projects config file in vagrant
template "/home/vagrant/.projects" do
  source '.projects.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables github_projects: node['github_projects'], bitbucket_projects: node['bitbucket_projects']
end

# setup apache config for each project
node['projects'].each do |project|
  domain_name = project.gsub(/\//, '.').gsub(/\.git/, '')
  template "/etc/apache2/sites-enabled/#{domain_name}.conf" do
    source 'virtual-host.conf.erb'
    owner 'root'
    group 'root'
    mode '0755'
    variables project: domain_name
  end
end


