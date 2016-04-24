class Patient < ActiveRecord::Base
	has_secure_password
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "30x30>" }, 
                                :url => "HAPP/avatars/patients/:id/:basename_:style.:extension", 
                                :path => "HAPP/avatars/patients/:id/:basename_:style.:extension",
                                :default_url => "avatar.png",
                                :convert_options => { :thumb => "-quality 75 -strip" }

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

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

    def fullname
    	return "#{name.capitalize} #{surname.capitalize}"
    end
end
