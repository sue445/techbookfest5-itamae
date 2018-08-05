MITAMAE_VERSION = "v1.6.2"

def generate_skeleton(target, name)
  raise "name is required" unless name

  %W(
    #{target}s/#{name}/files
    #{target}s/#{name}/templates
  ).each do |dir|
    mkdir_p dir
    touch "#{dir}/.keep"
  end

  touch "#{target}s/#{name}/default.rb"
end

namespace :generate do
  desc "Generate cookbook skeleton"
  task :cookbook, [:name] do |_, args|
    generate_skeleton("cookbook", args[:name])
  end

  desc "Generate role skeleton"
  task :role, [:name] do |_, args|
    generate_skeleton("role", args[:name])
  end
end

desc "Download mitamae bin file"
task :download_bin do
  sh "wget https://github.com/itamae-kitchen/mitamae/releases/download/#{MITAMAE_VERSION}/mitamae-x86_64-linux --quiet -O bin/mitamae-x86_64-linux"
  chmod "+x", "bin/mitamae-x86_64-linux"
end
