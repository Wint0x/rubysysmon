require 'sys/proctable'
require 'sys/filesystem'
require 'free_disk_space'
require 'awesome_print'
require 'optparse'

#Sys::ProcTable.ps{ |process|
 #  ap process
#}

# Disk stuff
class DISKMON
   attr_reader :used
   def free_disk_space
      @used = FreeDiskSpace.gigabytes("/")
   end

   def total_disk_space
      total = Sys::Filesystem.stat("/")
      return total.bytes_total / 1000000000
   end
end

# Processes
class PROCMON

end

# Network...
class NETMON

end

def main
   disk = DISKMON.new()

   ap "Free disk space: #{disk.free_disk_space.to_f.round(3)} GB"
   ap "Total available disk space: #{disk.total_disk_space} GB"
end

main