require 'sys/proctable'
require 'awesome_print'

Sys::ProcTable.ps{ |process|
   ap process
}
