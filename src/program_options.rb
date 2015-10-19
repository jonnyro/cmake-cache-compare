require 'optparse'

class ProgramOptions
	attr_accessor :options
	attr_accessor :arguments
	
	def initialize()
		@options = {}
		@arguments = []
	end
	
	def process(args)
		#Destructive parsing of ARGV
		OptionParser.new do |opts|
			opts.banner = "Usage: cache_compare.rb [options]"
			
			opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
				@options[:verbose] = v
			end
		end.parse!(args)
		@arguments = args
	end
end