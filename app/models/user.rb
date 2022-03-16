class User < ActiveRecord::Base
	has_many :comments
	validates :username, presence: true,
						uniqueness: { case_sentitive: false },
						length: {minimum: 3, maximum: 25}
	VALID_EMAIL_REGEX = /.+\@.+\..+/
	validates :email, presence: true,
										uniqueness: { case_sentitive: false },
										format: { with: VALID_EMAIL_REGEX }
end
