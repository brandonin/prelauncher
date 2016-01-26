class PreferenceController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def new
  end
  def create
  	Preference.create(preference_params)
    redirect_to "/complete"
  end
  def complete

  end

  private
  def preference_params
  	params.require(:preference).permit(:sweet, :mint, :salty, :milk_chocolate, :dark_chocolate, :caramel, :nuts, :fruity, :adventuring, :video_games, :socializing, :eating, :music, :movies, :frequency, :anxiety, :sleep, :pain, :strain)
  end
end
