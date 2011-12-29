class MailerController < ApplicationController
layout 'design'
  def index
    puts "in index.."
    puts "~~~~~~~~ #{params[:id]} ~~~~~~~~~~~~~~"
    @mail_id = Member.find(:first, :conditions => "MemberID = #{params[:id]}")
    puts @mail_id1=@mail_id.Email
    @sub = "Alert regarding Return Book "
    @message = "This is a notification that your issued book's (Date of Return) is whithin next two Day."
	# render :file => 'app\views\mailer\index.html.erb'
	 
    end
    
    def reserve
		puts "in index1.."
		
		@mem = Member.find(:first,
								:conditions =>" usertype = 'Admin'")
		puts @mail_id=@mem.Email							
		p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		puts params[:bookid]
		p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    
    @book = Book.find(:first, :conditions => "BookID = #{params[:bookid]}")
    
	@mail_id = "rahul@sprylogic.com"
	@sub = "Reseve the Book"
	@message = "Please Kindly Reserve this Book for me, and give alert when it is available in Library.
					Book details are as follow :
					BOOKID:=#{@book.BookID}\n\tSUBJECT:=#{@book.Subject}\n\tTITLE:=#{@book.Title}\n\tAUTHOR:=#{@book.Author}\n\tEDITION:=#{@book.Edition}"
					
	 
    end
  
    
    def availablebook
	   puts "inside availablebook"
	   puts params[:bookid]
	   
		@book = Book.find(:first,
							  :conditions => "BookID = #{params[:bookid]}")
          puts @mem_id=@book.mem_id						
		@member = Member.find(:first,
									:conditions => "MemberID = #{@mem_id}")
		puts @mail_id = @member.Email
		@sub = "Availability Of Reseved Book"
		@message = "This is a notification that your reserved book is now Available in Library, So if You want you can Issue it."
	   
    end
    
    def issuebook
    puts "inside issuebook"
    
    
    end
    
    def newarrival
	    
	    #@group=Cluster.find(:all, :order => "ClusterName")
        
       # for item in @group
         #   @clustarray<< item.ClusterName
        #end
        #len=@clustarray.length 
	   
		@mem = Member.find(:all, :order => "name")
		@mail_id=[]
		
		@mem.each do |item|
			@mail_id << item.Email
		end
		
		puts @mail_id
		
		
		len=@mem.length 
		@mail_arry=[] 

		for i in 0..len-1 do
			if i==len-1
					@mail_arry<<@mail_id[i].to_s
			else 
					@mail_arry<<@mail_id[i].to_s
					@mail_arry<<',' 
			end 
		end 
		
		puts @mail_arry
		
		
		@sub = "Notification Of New Arrival of Books"
		@message = "This is a notification that there are some new books arrived in library."
    end
    
    def regmem
		puts "in regmem"
		puts params[:memname]
		@mem = Member.find(:first,
								:conditions => "name = '#{params[:memname]}'")
		puts @mem.MemberID
		@mem.update_attribute( :Reqflag,  'Y') 
		@mail_id = @mem.Email
		
		@sub = "Notification Of Activation of MemberShip"
		
		@message = "This is a notification that Your MemberShip for OnLine Library System has been Acivated."
		
		p "....................."
		
		#@u=Member.find_by_sql("	update members set reqflag='Y' where name='#{params[:memname]}'")

	end
    
    
    

  def sendmail
    puts "in sendmail.."
	 recipient = params[:email][:recipient]
	 
	 subject = params[:email][:subject]
	 message = params[:email][:message]
	 puts recipient
	 puts  subject 
	 puts message
	 
	 begin
		Mailer.deliver_contact(recipient, subject, message)
		return if request.xhr?
		#render :text => 'Message sent successfully'
    #page.alert "Mail sent successfully"
    #session[:msg]="Mail sent Successfully..."
    flash[:notice1]="Mail sent Successfully..."
    #render :action => index
	    # page.alert "Mail sent successfully"
	 rescue Exception => e
	   puts e.message
	 end
  end

end




