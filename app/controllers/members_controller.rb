class MembersController < ApplicationController

layout 'design'

auto_complete_for :member, :name

def index
    @members = Member.all
 end

  def show
    @member = Member.find(params[:id])
end

  def new
    @member = Member.new
  end


  def edit
    @member = Member.find(params[:id])
  end

  def create
    
    @member = Member.new(params[:member])
    @mem = Member.maximum('MemberID')
		puts @member.Expired
		
		if @member.Expired==nil
			exdate = Date.today
			puts exdate = exdate + 365
			puts @member.Expired = exdate
		else
			puts "i n 	e l s e"
		end
		
		
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

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id])

    
      if @member.update_attributes(params[:member])
        flash[:notice] = 'Member was successfully updated.'
      redirect_to(@member) 
      
      else
        render :action => "edit" 
        
      end
   
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to(members_url)
    
  end
  
  def signup
  
  end
  
  
  
end
