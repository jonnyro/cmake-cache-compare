require_relative 'cache_loader'
require_relative 'cache_entry'
require_relative 'options'

p options

#argv now contains the remainder
p ARGV

if ARGV.length != 2 then

	puts "I require two arguments"
	abort
end

file_a = ARGV[0]
file_b = ARGV[1]



a_exists = File.exist?(file_a)
b_exists = File.exist?(file_b)

if not a_exists and b_exists then
	puts "Two files required for compare"
	abort
end


p "A exists"
p a_exists
p "B exists"
p b_exists


a = CacheLoader.new file_a
a.parse
#puts a.entries
b = CacheLoader.new file_b
b.parse
#puts b.entries

#Loop over common elements, showing different values
puts "The following entries differ:"
(a.entries.keys & b.entries.keys).each do |key|
	if a.entries[key].soft_differs?(b.entries[key]) then
		puts "Key: " + key + " " + "a:" + a.entries[key].value + " " + "b:" + b.entries[key].value
	end
end