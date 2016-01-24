class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"

    validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    # after_create :send_welcome_email

    REFERRAL_STEPS = [
        {
            'count' => 5,
            "html" => "$5 Off<br>First Box",
            "class" => "two",
            "image" =>  ActionController::Base.helpers.asset_path("refer/glass_pipe.jpg")
        },
        {
            'count' => 10,
            "html" => "Aluminum<br>Grinder",
            "class" => "three",
            "image" => ActionController::Base.helpers.asset_path("refer/grinder.jpg")
        },
        {
            'count' => 25,
            "html" => "Bubbler",
            "class" => "four",
            "image" => ActionController::Base.helpers.asset_path("refer/bubbler.jpg")
        },
        {
            'count' => 50,
            "html" => "Water<br>Pipe",
            "class" => "five",
            "image" => ActionController::Base.helpers.asset_path("refer/bong.png")
        }
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
        UserMailer.delay.signup_email(self)
    end
end
