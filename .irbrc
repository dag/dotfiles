def prefer lib
  require lib
rescue LoadError
end

prefer 'rubygems'
prefer 'extensions/all'
prefer 'facets'
prefer 'irb/completion'
prefer 'map_by_method'
prefer 'open-uri'
prefer 'pp'
prefer 'utility_belt'
prefer 'what_methods'
prefer 'wirble'

if defined? Wirble
  Wirble.init
  Wirble.colorize
end

alias q exit

# vim: ft=ruby
