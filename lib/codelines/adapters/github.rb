#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++
require 'github_api'
require 'base64'

module CodeLines

class GitHub < Adapter
  def initialize(profile)
    @profile      = profile
    @github       = Github.new
    @repositories = {}
  end

  def authenticate(username, password)
    @github = Github.new basic_auth: "#{username}:#{password}"
  end
    alias_method :login, :authenticate

  def count(options = {}, &block)
    repos           = options[:repository     ] || []
    ignore_comments = options[:ignore_comments] || false
    reload          = options[:reload]          || false

    lines = 0
    repos.each { |name|
      @repositories[name] = fetch(name) if reload || !@repositories.include?(name)

      @repositories[name].each { |github|
        source = Base64.decode64 github.content
        source.gsub!(/\r\n?/m, "\n")
        source.gsub!(/\/\*![^*]*\*+(?:[^*\/][^*]*\*+)*\//m, '') if ignore_comments

        source.each_line { |line|
          lines += 1 if ignore_comments == false || !comment?(line)
        }

        yield github if block_given?
      }
    }
    lines
  end

  protected
  def fetch(repository)
    [].tap { |results|
      @github.git_data.trees.get @profile, repository[:name], repository[:branch] || :master, recursive: true do |f|
        next if f.type != 'blob'

        file = @github.repos.contents.get user: @profile, repo: repository[:name], path: URI.escape(f.path)
        results << file
      end
    }
  end
end

end