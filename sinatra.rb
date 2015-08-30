module Sinatra
  def self.included(klass)
   # puts "Mock Sinatra has been included"
  end

  def run(path)
    if paths.has_key?(path)
      before_filters[path.call]
      paths[path].call
    else
      raise StandardError.new("No route for #{path}")
    end
  end

  def before_filters
    @before_filters ||= {}
  end

  def before(path, &block)
    before_filters[path] = block
  end

  def paths
    @paths ||= {}
  end

  def get(path, &block)
    puts "Defining a GET request for #{path}"
    path = lambda { path }
    paths[path] = block
  end

end

include Sinatra
