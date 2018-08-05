# frozen_string_literal: true

require_relative "spec_helper"

describe package("redis") do
  it { should be_installed }
end

describe service("redis") do
  it { should be_enabled }
  it { should be_running }
end
