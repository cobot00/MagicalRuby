#!/usr/bin/ruby

=begin
  Dropbox 93万行(Python)
  Ruby 2.0 78万行(4723ファイル)
  Java 1.6 207万行(7168ファイル)
  Java 1.8 240万行(7705ファイル)
=end

PARTING_LINE = "-------------------------------"

def disp_time(prc)
  puts prc+" -> "+Time.now.strftime("%Y/%m/%d %H:%M:%S")
end

def file_count(args)
  puts PARTING_LINE
  
  start_time = Time.now
  
  dir = Dir.pwd
  if args.size >= 1    
    dir = args[0]
  end  
  
  extension = "**/*.*"
  if args.size >= 2    
    extension = "**/*." + args[1]
  end
  
  puts "directory = #{dir}"
  puts "extension = #{extension}"
  
  file_count = 0
  line_count = 0
  
  Dir.glob(dir + extension) do |f|
    file_count += 1
    line_count += File.readlines(f).size
  end
  puts "file_count = #{file_count}"
  puts "line_count = #{line_count}"
  
  puts PARTING_LINE
  
  end_time = Time.now
  
  File.open("line_count.log", "w") do |log|
    log.puts "start -> "+start_time.strftime("%Y/%m/%d %H:%M:%S")
    log.puts PARTING_LINE
    log.puts "directory = #{dir}"
    log.puts "extension = #{extension}"
    log.puts "file_count = #{file_count}"
    log.puts  "line_count = #{line_count}"
    log.puts PARTING_LINE
    log.puts "end   -> "+end_time.strftime("%Y/%m/%d %H:%M:%S")
  end
  
end

if __FILE__ == $0
  disp_time("start")
  file_count(ARGV)
  disp_time("end  ")
end
