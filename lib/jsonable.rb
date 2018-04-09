require 'active_model'
require 'json'

module Jsonable

	class << Jsonable

		def __init__(klass)
    		klass.class_eval do
      			include ActiveModel::Serializers::JSON
    		end
		end

		private

		def included(klass)
			super
			Jsonable.__init__(klass)
		end

	end

 	def attributes
		hash = {}
		self.instance_variables.each do |var|
			hash[var.to_s.delete("@")] = nil
		end
		hash
 	end

  	def attributes=(hash)
    	hash.each do |key, value|
      		send("#{key}=", value)
    	end
  	end 	  

	def to_json
		JSON.pretty_generate(JSON[self.as_json.to_json])		
	end

end
