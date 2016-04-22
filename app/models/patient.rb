class Patient < ActiveRecord::Base
	has_secure_password

	enum risk: [:low, :high]
	enum desired_inr: ["2.5-3.5", "2.0-3.0"]
	enum therapy_state: [:daily, :weekly]

	belongs_to :doctor

	has_many :inr_records
	has_many :drug_prescriptions

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i
	validates  :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    allow_nil: true,
                    uniqueness: { case_sensitive: false }
end
