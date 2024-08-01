# find the string or substring in an array of strings, in my example Hell is part of Hello and should return true
require 'fileutils'
# Enter word to search: Hello
puts "Enter word to search: "
string = gets.chomp

puts "Select a dictionary: "
#lets you type in the name of the file.rb or file.txt
file_path = File.open(File.expand_path(gets.chomp))
file = File.read(file_path)
# make array of the file
file_array = file.split("\n")
# i started here with the function to find the substring
def substrig(string, dictionary)
    # i tried many methods until i found find_all
    dictionary.find_all do 
        # for every word, string includes the word or the word includes the string
        |word| string.include?(word) || word.include?(string)
    #end and sort the array
    end.sort
end

# call the function
 p substrig(string, file_array)