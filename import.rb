#!/usr/bin/ruby
# -*- encoding: utf-8 -*-

def file(filepath)
  if File.exists?(filepath)
    command = "osascript -e \"tell application \\\"iTunes\\\" to add POSIX file \\\"#{filepath}\\\"\" to playlist \\\"Library\\\" of source \\\"Library\\\""
    system(command)
    
    delete(filepath)
  end
end

def delete(filepath)
  File.delete(filepath)
end

def dir(dir)
  media = 0
  files = 0
  
  Dir.glob(File.join(File.expand_path(dir), "**", "*")).each do |filepath|
    if filepath.match(/(.mp3|.aac|.wav|.mp4|.m4a|.pdf|.m4p|.m4v)\z/)
      file(filepath)
      media = media + 1
    end
    files = files + 1
  end
  if media == files
    # Dir.delete(dir)
  end
  puts "Found #{media} Media files"
end

puts dir("/Users/Kyle.Welsby/Music/from halfbook/Music/Garage Anthems */")