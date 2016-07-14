begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => _err
  puts 'no awesome_print :('
end

Pry.config.correct_indent = false if ENV['INSIDE_EMACS']
Pry.editor = 'vim'

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'w', 'whereami'
  Pry.commands.alias_command 'bt', 'backtrace'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, 'repeat last command' do
  _pry_.run_command Pry.history.to_a.last
end
