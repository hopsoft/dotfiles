#!/usr/bin/env ruby
dir = File.expand_path(File.dirname(__FILE__))
if dir == "/usr/bin"
  dir = File.expand_path(File.join(File.readlink("/usr/bin/dotdir"), "..", "..")) rescue nil
else
  dir = File.expand_path(File.join(dir, ".."))
end
puts dir
