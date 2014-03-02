CodeLines
=========
Count the number of lines of code contained in one or more repositories hosted on GitHub, Bitbucket, etc.

Install
-------
`$ gem install codelines`

Example
-------
You can use *codelines* running the built-in executable or using the gem in a ruby script.

`$ codelines --adapter github --profile RoxasShadow --repository codelines`

```ruby
require 'codelines'
require 'codelines/adapters/github' # the adapter we want to use

github = CodeLines::GitHub.new 'RoxasShadow' # the owner of the repositories we want to analyze
github.authenticate 'USERNAME', 'PASSWORD'   # authentication is not required, but it avoids to incurring to limit exceeded errors

github.count repository: [ { name: :codelines }, { name: :chainedexpressions}  } ] # return the sum of the lines of code contained in given repositories
github.count repository: [ { name: :mescalina, branch: :'last-episode-preview' } ], ignore_comments: false # select the given branch ignoring the comments
github.count repository: [ { name: :codelines                                  } ], reload: true # count the lines contained in this repository without using the cache
github.count repository: [ { name: :codelines, ignore: %w(README.md)           } ] # return the sum of the lines of code contained in given repositories ignoring README.md
```