module Sinatra

  # for the run to message a status
  def self.included(klass)
   puts "Mock Sinatra has been included"
  end

  # calling our procs
  def run(path)    
    if paths.has_key?(path)
      if before_filters.has_key?(path)
        before_filters[path].call
      end      
      paths[path].call
    else
      raise StandardError.new("No route for #{path}")
    end
  end

  # set up the hash or use one
  def before_filters
    @before_filters ||= {}
  end

  # put the proc in a hash
  def before(path, &block)
    puts "Defining a before filter request for #{path}" 
    before_filters[path] = block
  end

  # set the hash or use one
  def paths
    @paths ||= {}
  end

  # put the proc in a hash
  def get(path, &block)
    puts "Defining a GET request for #{path}"    
    paths[path] = block
  end

end

# show that sinatra module has been run
include Sinatra

=begin

Here's how Sinatra::Base would do it

routes.each do |pattern, keys, conditions, block|

and

handler.run(self, server_settings) do |server|

But the actual route method is this

def route(verb, path, options = {}, &block)
  # Because of self.options.host
  host_name(options.delete(:host)) if options.key?(:host)
  enable :empty_path_info if path == "" and empty_path_info.nil?
  signature = compile!(verb, path, block, options)
  (@routes[verb] ||= []) << signature
  invoke_hook(:route_added, verb, path, block)
  signature
end

When I start a simple Sinatra app in irb I get something that shows we have a proc.
[/\A\/\z/, [], [], #<Proc:0x8c62d90@/var/lib/gems/1.9.1/gems/sinatra-1.4.6/lib/sinatra/base.rb:1610>]

that line is part of this ternary
wrapper                 = block.arity != 0 ?
          proc { |a,p| unbound_method.bind(a).call(*p) } :
          proc { |a,p| unbound_method.bind(a).call }
          
Aha! A wrapper. 
          


=end
