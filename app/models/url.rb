class Url < ApplicationRecord


	validates :long_url, presence: true
	validates :long_url, uniqueness: {case_sensitive: false, message: "was shortened before"}
	validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}

	def shorten
		new_array =[]
		new_array << ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(6)
		self.short_url = new_array.join
		self.save

	end

end
