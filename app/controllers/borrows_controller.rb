class BorrowsController < ApplicationController
  
  layout 'design'


	def new
  
		puts "borrows -> new"
		@borrow = Borrow.new
		puts session[:user_id]
		p "______________________"
        
		puts params[:id]
		puts params[:id1]
		$book_id=params[:id]
		@member = Member.find(:first, :conditions => "id = #{session[:user_id]}")
		puts $mem_id = @member.MemberID
		p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
		puts  session[:searchtype]
		puts session[:searchcontent]
		p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        
	end

  def create
    
	puts @Book_ID=$book_id
	#	puts @Member_ID=params[:borrow][:MemberID]
	puts "::::::::::::::::::::::::::::::::::::::::::::"
	# puts params[:borrow]
    
	puts @day_ofborrwed = Date.civil(params[:borrow][:"DayOfBorrowed(1i)"].to_i,params[:borrow][:"DayOfBorrowed(2i)"].to_i,params[:borrow][:"DayOfBorrowed(3i)"].to_i)
	puts @day_ofreturn = Date.civil(params[:borrow][:"DayOfReturn(1i)"].to_i,params[:borrow][:"DayOfReturn(2i)"].to_i,params[:borrow][:"DayOfReturn(3i)"].to_i)
    #@end_date = Date.civil(params[:range][:"end_date(1i)"].to_i,params[:range][:"end_date(2i)"].to_i,params[:range][:"end_date(3i)"].to_i)
    
	# puts params[:borrow][:DayOfReturn]
     
	puts "::::::::::::::::::::::::::::::::::::::::::::" 


     puts "*********************************" 
     puts @day_ofreturn1=@day_ofreturn-14
     puts "*********************************" 
		if  @day_ofborrwed.to_date <=@day_ofreturn.to_date

		@book=Book.find(:first,:conditions => "BookID = #{$book_id}")
		puts "tystssfsfg"
          @member = Member.find(:first , :conditions => " MemberID = #{$mem_id}")
    
		puts @member.Email
    
          #puts @book.NumberOfAvailbleBooks.to_i
          puts "Available copies of book are"
          puts numberOfAvailbleBooks = @book.NumberOfAvailbleBooks.to_i
          numberOfBorrowedBooks = 1 + @book.NumberOfBorrowedBooks.to_i
          numberOfBooks = 1 + @member.NumberOfBooks.to_i
    
          if numberOfAvailbleBooks == 1 
                         numberOfAvailbleBooks -= 1
                         @bookborrowcounter=@book.Ranking.to_i+1
                         puts "-----#{@book.Ranking.to_i+1}"
                
					@book.update_attributes(:BookID => "#{$book_id}",
                                                  :NumberOfAvailbleBooks => "#{numberOfAvailbleBooks}", 
                                                  :NumberOfBorrowedBooks => "#{numberOfBorrowedBooks}",
                                                  :Availble => "Not Available",
                                                  :Ranking => "#{@bookborrowcounter}") 
                
                 
					@member.update_attributes(:MemberID => "#{params[:borrow][:MemberID]}",
                                                      :NumberOfBooks => "#{numberOfBooks}") 
                
					@borrow = Borrow.new(params[:borrow])
					puts @borrow.MemberID = $mem_id
					@borrow.BookID = $book_id
				
					if @borrow.save
							session[:msg] = 'You have Issued book successfully'
							render :action => "new" 
					else
							render :action => "new" 
					end
    
		elsif numberOfAvailbleBooks > 1
					puts "in else .."
					numberOfAvailbleBooks -= 1
					puts numberOfAvailbleBooks
					@bookborrowcounter=@book.Ranking.to_i+1
					puts "-----#{@book.Ranking.to_i+1}"
					@book.update_attributes(:BookID => "#{$book_id}",
                                                  :NumberOfAvailbleBooks => "#{numberOfAvailbleBooks}", 
                                                  :NumberOfBorrowedBooks => "#{numberOfBorrowedBooks}",
                                                  :Ranking => "#{@bookborrowcounter}") 
                
					@member.update_attributes(:MemberID => "#{$mem_id}",
                                                      :NumberOfBooks => "#{numberOfBooks}") 
                
					@borrow = Borrow.new(params[:borrow])
					puts @borrow.MemberID = $mem_id
					@borrow.BookID = $book_id
					
					if @borrow.save
							session[:msg] = 'You have Issued book successfully'
							#redirect_to => :controller => 'mailer', :action => 'issuebook'
							render :action => "new" 
					else
							render :action => "new" 
					end
          else
					session[:msg] = "This book is Issued"
		end
      
	else
				puts "in else"
				session[:msg]="Please Select Proper Date"
				redirect_to :action => "new"
	end
    
    end

def reserve
     puts "borrws -> reserve"
end

 
 
end


