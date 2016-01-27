class PreferenceController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def new
  end
  def create
    if params[:preference]
    	Preference.create(preference_params)
      redirect_to "/complete"
    else
      flash[:notice] = "please choose your preferences";
      redirect_to "/preference"
    end
  end
  def complete

  end

  private
  def preference_params
  	params.require(:preference).permit(:sweet, :mint, :salty, :milk_chocolate, :dark_chocolate, :caramel, :nuts, :fruity, :adventuring, :video_games, :socializing, :eating, :music, :movies, :frequency, :anxiety, :sleep, :pain, :strain)
  end
end
