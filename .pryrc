begin
  require "awesome_print"
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => _err
  puts "no awesome_print :("
end

Pry.config.correct_indent = false if ENV["INSIDE_EMACS"]

if defined?(PryByebug)
  Pry.commands.alias_command "c", "continue"
  Pry.commands.alias_command "s", "step"
  Pry.commands.alias_command "n", "next"
  Pry.commands.alias_command "f", "finish"
  Pry.commands.alias_command "w", "whereami"
end
