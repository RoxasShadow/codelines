#! /usr/bin/env ruby
require 'rake'

task :default => [ :build, :install, :test ]

task :build do
  sh 'gem build   *.gemspec'
end

task :install do
  sh 'gem install --no-force rspec'
  sh 'gem install *.gem'
end

task :test do
  FileUtils.cd 'test' do
    sh 'rspec codelines_spec.rb --backtrace --color --format doc'
    sh 'rspec github_spec.rb    --backtrace --color --format doc'
  end
end