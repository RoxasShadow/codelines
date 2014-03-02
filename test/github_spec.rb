#! /usr/bin/env ruby
require 'codelines'
require 'codelines/adapters/github'

describe CodeLines::GitHub do
  it 'counts the lines of code contained in a GitHub repository' do
    CodeLines.setup CodeLines::GitHub, 'RoxasShadow'

    result          = CodeLines.count repository: [ { name: :codelines                        } ], ignore_comments: false
    filtered_result = CodeLines.count repository: [ { name: :codelines, ignore: %w(Readme.md) } ], ignore_comments: true
    result.should be          > 100
    filtered_result.should be > 100

    filtered_result.should_not be result
  end
end