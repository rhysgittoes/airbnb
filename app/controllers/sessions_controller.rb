class SessionsController < Clearance::SessionsController

	 def create
	    @user = authenticate(params)

	    sign_in(@user) do |status|
	      if status.success?
	      	cookies[:user_id] = @user.id
	        redirect_back_or url_after_create
	      else
	        flash.now.notice = status.failure_message
	        render template: "sessions/new", status: :unauthorized
	      end
	    end
	end
	

end 