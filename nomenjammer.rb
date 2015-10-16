# define range of files to be renamed (rename by name? rename by date+time)

# define how files are to be renamed.

def name_switch(old_name, new_name)

	File.rename(old_name, new_name)
	
end

def switch_directory(current)
	set = false
	
	puts "Your current directory is \n\n#{current}\n\n"
	puts "Modify directory. Return a blank line when set."
	
	while set == false do 
		print "#{current}> "
		reloc = gets.chomp.split(' ')[-1]
		
		case reloc
		when nil
			set = true 
			#break
		when "ls"
			listfiles(current)
		when "~"
			Dir.chdir Dir::home			
		else
			Dir.chdir reloc
		end
		
		current = Dir.pwd
	
	end
	return current
end

def listfiles(current)
	all_files = Dir.entries(current).delete(/^./)
	dir_cols = 3
	
	puts "All files in #{current}:\n"
	if all_files.length == 1
		puts "There's only one file in this directory:\n\t#{all_files[0]}"
	end
	rows = all_files.length/3
	(0...all_files.length).each do |it|
		(0...dir_cols).step(dir_cols) do |this| 
			if it+this > all_files.length - 1; break; end
			print all_files[it+this].ljust(100/dir_cols)
		end
		print "\n"
	end
end
	
def file_layout
	
end

set = false
while set != true do
	current = Dir.pwd
	print "Current directory is:\n\n #{current}. \n\nIs this where you want to work? (y/n) >"
	x = gets.downcase.chomp
	if (x != "y") && (x != "n")
		puts "Please try again:\n\n"
		elsif x == "n"
			puts "Hm.\n\n"
			current = switch_directory(current)
		else set = true
	end
end

listfiles(current)


