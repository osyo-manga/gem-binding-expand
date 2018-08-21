require "binding/expand/version"

module Binding::Expand
	module Refine
		def expand *keys
			b = self
			keys = b.local_variables if keys.empty?
			Hash[*keys.map { |key| [key, b.eval(key.to_s)] }.flatten(1)]
		end
	end

	refine Binding do
		include Refine
	end
end
