# Adapted program to never copy over an existing file
# If filename already exists, exit the program

Dir.chdir('C:/pictures')

pic_names = Dir['../../F:/*.jpg'].sort

puts 'What would you like to call this batch?'
batch_name = gets.chomp

puts
print "Downloading #{pic_names.length} files: "

pic_number = 1

pic_names.each do |name|
    print '.'
    new_name = if pic_number < 10
      "#{batch_name}0#{pic_number}.jpg"
    else
        "#{batch_name}#{pic_number}.jpg"
    end
    
    if File.exist?(new_name)
        puts
        puts "Error: #{new_name} already exists in C:"
        puts "Stopped importing pictures at #{new_name}"
        exit
    else
        File.rename(name, new_name)
        pic_number = pic_number + 1
    end
end

puts
puts "All images renamed and moved from :F to :C/pictures/ folder successfully"