#--
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.
#++

module CodeLines

class Adapter
  def authenticate(*args, &block)
    raise NotImplementedError, 'authenticate has been not implemented'
  end

  def count(*args, &block)
    raise NotImplementedError, 'count has been not implemented'
  end

  protected
  def comment?(what)
    [ ?;, ?#, '//' ].include? what.gsub(/\s+/, '')[0]
  end
end

end