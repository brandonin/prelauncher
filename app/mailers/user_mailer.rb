class UserMailer < ActionMailer::Base
    default from: "High Standards <info@gethighstandards.com>"

    def signup_email(user)
        @user = user
        @twitter_message = "#Shaving is evolving. Excited for @harrys to launch."
        # attachments.inline['box.png'] = File.read( Rails.root.join("/app/assets/images", 'box.png'))
        mail(:to => user.email, :subject => "Thanks for signing up!")
    end
end

mail = UserMailer.signup_email(@user)
mail = mail.deliver_later