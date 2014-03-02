#! /usr/bin/env ruby
require 'codelines'
require 'codelines/adapters/github'

describe CodeLines::GitHub do
  it 'counts the lines of code contained in a GitHub repository' do
    github = CodeLines::GitHub.new 'RoxasShadow'

    result          = github.count repository: [ { name: :codelines                        } ], ignore_comments: false
    filtered_result = github.count repository: [ { name: :codelines, ignore: %w(Readme.md) } ], ignore_comments: true
    result.should be          > 100
    filtered_result.should be > 100

    filtered_result.should_not be result
  end
end