class SignupmemController < ApplicationController
  #protect_from_forgery :only => [:create, :update, :destroy]  
  layout 'designforlogin'

auto_complete_for :member, :name

  def new
    p "in Signupmem's -> new"
    @member = Member.new
    flash[:notice] = "Thankx for Registation,You have got mail from Admin for your Membership activation"
  end

  def create
      p "in Signupmem's -> create"
	@member = Member.new(params[:member])
    # @member.usertype="Member"
      #   puts "--------------"
	exdate = Date.today
     
	puts exdate = exdate + 365
     
     puts @member.Expired = exdate
    @mem = Member.maximum('MemberID')
    if @mem == nil
	    puts "--------------"
	    @mem=100
	    else
			puts @mem = @mem.to_i + 1
			puts @member.MemberID =  @mem
		end
		
	if @member.save
        flash[:notice] = 'Member was successfully created.'
         redirect_to(@member) 
      else
        render :action => "new" 
        
      end
  end

end
