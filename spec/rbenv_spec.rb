# frozen_string_literal: true

rbenv_root = node["rbenv"]["rbenv_root"]

describe file(rbenv_root) do
  it { should exist }
  it { should be_directory }
end

describe file("#{rbenv_root}/version") do
  it { should exist }
  it { should be_file }
  its(:content) { should eq "#{node["rbenv"]["global"]}\n" }
end

describe file("#{rbenv_root}/default-gems") do
  let(:default_gems) do
    node["rbenv-default-gems"]["default-gems"].join("\n") + "\n"
  end

  it { should exist }
  it { should be_file }
  its(:content) { should eq default_gems }
end

describe file("/etc/profile.d/rbenv.sh") do
  let(:profile) do
    <<~BASH
      export RBENV_ROOT=#{rbenv_root}
      export PATH="${RBENV_ROOT}/bin:${PATH}"
      eval "$(rbenv init -)"
    BASH
  end

  it { should exist }
  it { should be_file }
  its(:content) { should eq profile }
end
