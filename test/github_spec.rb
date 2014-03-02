#! /usr/bin/env ruby
require 'codelines'
require 'codelines/adapters/github'

describe CodeLines::GitHub do
  it 'counts the lines of code contained in a GitHub repository' do
    github = CodeLines::GitHub.new 'RoxasShadow'

    github.count(repository: [ { name: :codelines } ], ignore_comments: true ).should be > 100
    github.count(repository: [ { name: :codelines } ], ignore_comments: false).should be > 100
  end
end