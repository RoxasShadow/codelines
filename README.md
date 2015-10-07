CodeLines
=========
Count the number of lines of code contained in one or more repositories.

Currently there's just the support to GitHub, but feel free to make new adapters for any hosting website you want.

Install
-------
`$ gem install codelines`

Example
-------
You can use *codelines* running the built-in executable or using the gem in a ruby script.

`$ codelines --adapter github --profile RoxasShadow --repository codelines -i README.md,Rakefile`

```ruby
require 'codelines'
require 'codelines/adapters/github' # the adapter we want to use

github = CodeLines.setup CodeLines::GitHub, 'RoxasShadow' # the owner of the repositories we want to analyze
github.authenticate 'USERNAME', 'PASSWORD'                # authentication is not required, but it avoids to incurring to limit exceeded errors

CodeLines.count repository: [ { name: :codelines }, { name: :chainedexpressions}  ] # return the sum of the lines of code contained in given repositories
CodeLines.count repository: [ { name: :mescalina, branch: :'last-episode-preview' ], ignore_comments: true # select the given branch ignoring the comments
CodeLines.count repository: [ { name: :codelines                                  ], reload: true # count the lines contained in this repository without using the cache
CodeLines.count repository: [ { name: :codelines, ignore: %w(README.md)           ] # return the sum of the lines of code contained in given repositories ignoring README.md
```
