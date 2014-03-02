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

class << self
  attr_reader :adapter

  def adapters
    Dir.glob(File.expand_path('../adapters/*.rb', __FILE__)).sort { |a, b| b <=> a }.map { |f|
      f = File.basename(f).split(?.)[0]
    }
  end
    alias_method :list, :adapters

  def setup(adapter, profile)
    @adapter = adapter.new profile
  end

  def authentication(*args, &block)
    raise LoadError, 'adapter not found' unless @adapter
    @adapter.authentication *args, &block
  end

  def count(*args, &block)
    raise LoadError, 'adapter not found' unless @adapter
    @adapter.count *args, &block
  end
end

end