require 'irb/completion'
require 'wirb'

IRB.conf[:SAVE_HISTORY] = 10000

#Wirb.start

require "amazing_print"
AmazingPrint.irb!
