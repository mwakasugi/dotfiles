begin
  require 'awesome_print' 
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "no awesome_print :("
end

Pry.config.correct_indent = false if ENV["INSIDE_EMACS"]
