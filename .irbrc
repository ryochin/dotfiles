require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 10000

begin
  require 'amazing_print'
rescue LoadError
else
  AmazingPrint.irb!
  AmazingPrint.rdbg!
end
