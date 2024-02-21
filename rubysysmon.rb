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
   attr_reader :space_used
   attr_reader :total_space
   attr_reader :total_files
   attr_reader :mounts

   def free_disk_space
      @space_used = FreeDiskSpace.gigabytes("/")
   end

   def total_disk_space
      @total_space = Sys::Filesystem.stat("/")
      return @total_space.bytes_total / 1000000000
   end

   def get_files_count
      @total_files = Sys::Filesystem.stat("/")
      return @total_files.files
   end

   # mounts
   def get_mounts
      @mounts = Sys::Filesystem.mounts.each_with_index do 
         | mount, idx | puts ("[#{(idx + 1).to_s}] " + mount.name + "\n" + mount.mount_point + "\n\n")
      end
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
   puts "Total files encountered: \033[1m\033[36m#{disk.get_files_count}\033[0m"
   puts "\n=== [ Mounts ] ==="
   disk.get_mounts

end

main