class CacheEntry
	include Comparable
	
	attr_reader :name
	attr_reader :type
	attr_reader :value
	
	def initialize(name,type,value)
		@name 	= name
		@type 	= type
		@value 	= value
	end
	
	def <=>(another_cache_entry)
		if 	self.name == another_cache_entry.name and
			self.type == another_cache_entry.type and
			self.value == another_cache_entry.value then
			0
		elsif self.name != another_cache_entry.name then
			-1
		elsif self.type != another_cache_entry.type then
			1
		elsif self.value != another_cache_entry.value then
			1
		end
	end
	
	def name_equal?(another_cache_entry)
		self.name == another_cache_entry.name
	end
	
	def value_differs?(another_cache_entry)
		self.value != another_cache_entry.value
	end
	
	def soft_differs?(another_cache_entry)
		self.type != "INTERNAL" and self.value != another_cache_entry.value
	end
	
end