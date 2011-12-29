class AdminController < ApplicationController
  
  layout 'designforlogin'
    protect_from_forgery :only => [:create, :update, :destroy]
  def login

	if request.post?
		user = Member.authenticate(params[:name], params[:password])
		if user
			session[:user_id] = user.id
			session[:user_type] = user.usertype 
#			puts session[:req_flag] = user.Reqflag
			if session[:user_type] == 'Admin'
					redirect_to :controller => "alert", :action => "list"
			else 
				if session[:req_flag].present?
					redirect_to :controller => "extrabook", :action => "blank"
				else
					flash[:notice] = "Member request is pendding"	
				end
				
			end
		  
		else
				flash[:notice] = "Invalid user/password combination"
		end
	end
 
 end
 

	def logout
		session[:user_id] = nil
		#flash[:notice] = "Logged out"
		redirect_to(:action => "login")
	end

  def index
  end
  

  

end
