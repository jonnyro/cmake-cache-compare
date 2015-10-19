class CacheLoader
	attr_reader :entries

	def initialize(filename)
		@filename = filename
		@entries = {}
	end

	def parse
		description_buffer = ""
		File.readlines(@filename).each do |line|
			if line.chomp == "" then
				#do nothing, blank line.
			elsif line.start_with?("#") then
				#Comment line, ignore.
			elsif line.start_with?("//") then
				description_buffer = line[2..-1]
			else
				#Line will be NAME:TYPE=VALUE
				name,type,value = line.match(/^(.*):(.*)=(.*)$/).captures
				@entries[name] = CacheEntry.new(name,type,value)
			end
			
		end
	end

end