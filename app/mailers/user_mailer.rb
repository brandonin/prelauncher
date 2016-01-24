class UserMailer < ActionMailer::Base
    default from: "High Standards <info@gethighstandards.com>"
    # include SendGrid

    def signup_email(user)
        @user = user
        @twitter_message = "#Shaving is evolving. Excited for @harrys to launch."
        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end

mail = UserMailer.signup_email(@user)
mail = mail.deliver_now