class ApplicationController < ActionController::Base
    protect_from_forgery

    before_filter :ref_to_cookie
    before_filter :check_age

    def mobile_device?
        if session[:mobile_param]
            session[:mobile_param] == "1"
        else
            request.user_agent =~ /Mobile|webOS/
        end
    end

    protected

    def check_age
        if cookies[:age_verification] != "agree"
            redirect_to "/verify_age"
        end
    end

    def ref_to_cookie
        if params[:ref] && !Rails.application.config.ended
            if !User.find_by_referral_code(params[:ref]).nil?
                cookies[:h_ref] = { :value => params[:ref], :expires => 2.week.from_now }
            end

            if request.env["HTTP_USER_AGENT"] and !request.env["HTTP_USER_AGENT"].include?("facebookexternalhit/1.1")
                redirect_to proc { url_for(params.except(:ref)) }  
            end
        end
    end
end
