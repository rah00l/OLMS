class ReturnController < ApplicationController
layout 'design' 
 def new
    
  end

  def create
    puts @Book_ID=params[:return][:BookID]
    puts @Member_ID=params[:return][:MemberID]
    
    @book=Book.find(:first,:conditions => "BookID = #{params[:return][:BookID]}")
    
    @member = Member.find(:first , :conditions => " MemberID = #{params[:return][:MemberID]}")
    
    puts numberOfAvailbleBooks = @book.NumberOfAvailbleBooks.to_i
    numberOfBorrowedBooks = @book.NumberOfBorrowedBooks.to_i - 1
    puts "No. of Books present to this member are "
    puts numberOfBooks = @member.NumberOfBooks.to_i 
    
    if numberOfAvailbleBooks == 0 && numberOfBooks > 0
	 puts "in if"
			 numberOfAvailbleBooks += 1
								numberOfBooks -= 1
			 @book.update_attributes(:BookID => "#{params[:return][:BookID]}",
										:NumberOfAvailbleBooks => "#{numberOfAvailbleBooks}", 
										:NumberOfBorrowedBooks => "#{numberOfBorrowedBooks}",
										:Availble => "Available",
										:Reserve => "N")
			 
			 
			  
			 @member.update_attributes(:MemberID => "#{params[:return][:MemberID]}",
										    :NumberOfBooks => "#{numberOfBooks}") 
    
		    @borrow = Borrow.find(:all ,
									 :conditions => "BookID = #{params[:return][:BookID]} and  MemberID = #{params[:return][:MemberID]}")
		    
		    Borrow.delete_all(["BookID = ? AND MemberID = ? " , params[:return][:BookID] , params[:return][:MemberID] ])
		    #render :action => "new" 
		    
		    @id=params[:return][:BookID]
		    
		    @flag = Book.find(:first,
							    :conditions => "BookID =  #{params[:return][:BookID]}")
							    
		    
		    if @flag.Reserve == 'N'
			 redirect_to :controller => "Mailer", :action => "availablebook", :bookid => @id
		    else
			   render :text => "Book Is Already Reserved"
		    end    
    
    elsif numberOfAvailbleBooks > 0 && numberOfBooks > 0
	 puts "in elsif"
				numberOfAvailbleBooks += 1;
				numberOfBooks -= 1;          
				@book.update_attributes(:BookID => "#{params[:return][:BookID]}",
										:NumberOfAvailbleBooks => "#{numberOfAvailbleBooks}", 
										:NumberOfBorrowedBooks => "#{numberOfBorrowedBooks}") 
			 
			  
				@member.update_attributes(:MemberID => "#{params[:return][:MemberID]}",
										    :NumberOfBooks => "#{numberOfBooks}") 
    
				@borrow = Borrow.find(:all ,
									 :conditions => "BookID = #{params[:return][:BookID]} and  MemberID = #{params[:return][:MemberID]}")
				
				Borrow.delete_all(["BookID = ? AND MemberID = ? ", params[:return][:BookID] , params[:return][:MemberID]])
				
				render :action => "new" 
  else
	   session[:msg]="This Book is not Issued "
  end
	   
  
  end

end


