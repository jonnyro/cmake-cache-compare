require 'minitest/autorun'
require_relative '../src/program_options'

class TestOptions < Minitest::Test

	def setup
		@po = ProgramOptions.new
	end
	
	def test_verbose_flag
		args = ["-v"]
		@po.process(args)
		
		assert @po.options[:verbose] != nil
	end
	
	def test_arguments
		args = ["-v", "file1.txt", "file2.txt"]
		@po.process(args)
		assert @po.arguments == ["file1.txt","file2.txt"]
	end
	
end