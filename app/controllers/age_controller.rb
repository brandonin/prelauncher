class AgeController < ApplicationController
  skip_before_action :check_age
  def verify_age

  end

  def verified_age
    cookies[:age_verification] = {
        :value => "agree",
        :expires => 1.year.from_now
    }
    redirect_to "/"
  end
end
