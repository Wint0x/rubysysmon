require 'sys/proctable'
require 'sys/filesystem'
require 'free_disk_space'
require 'etc'
require 'awesome_print'
require 'optparse'

#Sys::ProcTable.ps{ |process|
 #  ap process
#}

# System information such as groups, passwd, users, etc...
class ETC
   def self.uname
      ap Etc.uname
   end

   def self.current_login
      login = Etc.getlogin
      passwd = Etc.getpwnam(login)

      username = passwd.gecos.split(/,/).first
      userid = passwd.uid
      groupid = passwd.gid
      userdir = passwd.dir
      usershell = passwd.shell
      groups = nil

      fgroups = IO.popen("groups")
      groups = fgroups.read
      fgroups.close()

      return login, username, userid, groupid, userdir, usershell, groups.split(" ").join(", ")
   end

   def self.enumerate_groups
      idx = 0
      Etc.group {|g| puts "#{(idx += 1).to_s}) #{g.name}"}
   end

end

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

   # General info
   ETC.uname()
   current_user = Array.new(ETC.current_login)

   puts "=== [ Current User ] ==="
   puts "Login: #{current_user[0]}"
   puts "Username: #{current_user[1]}"
   puts "uid: #{current_user[2]}" 
   puts "gid: #{current_user[3]}"
   puts "Dir: #{current_user[4]}"
   puts "Shell: #{current_user[5]}"
   puts "User Groups: #{current_user[6]}"
   puts "=== [ All Groups ] ==="
   ETC.enumerate_groups

   puts "=== [ DISK ] ==="
   # Disk info
   ap "Free disk space: #{disk.free_disk_space.to_f.round(3)} GB"
   ap "Total available disk space: #{disk.total_disk_space} GB"
   puts "Total files encountered: \033[1m\033[36m#{disk.get_files_count}\033[0m"
   puts "\n=== [ Mounts ] ==="
   disk.get_mounts

end

main