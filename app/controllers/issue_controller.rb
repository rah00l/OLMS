class IssueController < ApplicationController
  layout 'design'
  def new
     @borrow = Borrow.new
     puts "issue -> new"
       
        puts session[:user_id]
        @member = Member.find(:first, :conditions => "id = #{session[:user_id]}")
        puts $mem_id = @member.MemberID
        #render :action => "create"
  end

def create
		puts "issue -> create"
		puts "issue -> create"
		puts @Book_ID=params[:borrow][:BookID]
		#	puts @Member_ID=params[:borrow][:MemberID]
		#@condi = Borrow.find(:all ,
		#                              :conditions => "BookID = #{params[:borrow][:BookID]} and MemberID = #{params[:borrow][:MemberID]}")  
		#if @condi == []                                    
		# puts "::::::::::::::::::::::::::::::::::::::::::::"
		# puts params[:borrow][:DayOfBorrowed]
		# puts params[:borrow][:DayOfReturn]
		# puts "::::::::::::::::::::::::::::::::::::::::::::" 
		
		puts @day_ofborrwed = Date.civil(params[:borrow][:"DayOfBorrowed(1i)"].to_i,params[:borrow][:"DayOfBorrowed(2i)"].to_i,params[:borrow][:"DayOfBorrowed(3i)"].to_i)
		puts @day_ofreturn = Date.civil(params[:borrow][:"DayOfReturn(1i)"].to_i,params[:borrow][:"DayOfReturn(2i)"].to_i,params[:borrow][:"DayOfReturn(3i)"].to_i)
  
		#puts "*********************************" 
		puts @day_ofreturn1=@day_ofborrwed-14
            #@day_ofreturn1=@day_ofreturn-14
		#puts "*********************************" 
   


		if params[:borrow][:BookID].to_s!=""

				@book=Book.find(:first,:conditions => "BookID = #{params[:borrow][:BookID]}")

				if  @day_ofborrwed.to_date <=@day_ofreturn.to_date
      
						@member = Member.find(:first , :conditions => " MemberID = #{$mem_id}")
						#  puts @member.Email
						#puts @book.NumberOfAvailbleBooks.to_i
						puts "Available copies of book are"
						puts numberOfAvailbleBooks = @book.NumberOfAvailbleBooks.to_i
						numberOfBorrowedBooks = 1 + @book.NumberOfBorrowedBooks.to_i
						numberOfBooks = 1 + @member.NumberOfBooks.to_i
    
						if numberOfAvailbleBooks == 1 
									numberOfAvailbleBooks -= 1
									@bookborrowcounter=@book.Ranking.to_i+1
									puts "-----#{@book.Ranking.to_i+1}"
									@book.update_attributes(:BookID => "#{params[:borrow][:BookID]}",
																:NumberOfAvailbleBooks => "#{numberOfAvailbleBooks}", 
																:NumberOfBorrowedBooks => "#{numberOfBorrowedBooks}",
																:Availble => "Not Available",
																:Ranking => "#{@bookborrowcounter}") 
                
									@member.update_attributes(:MemberID => "#{params[:borrow][:MemberID]}",
																	:NumberOfBooks => "#{numberOfBooks}") 
                
									@borrow = Borrow.new(params[:borrow])
									puts @borrow.MemberID = $mem_id
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
									@book.update_attributes(:BookID => "#{params[:borrow][:BookID]}",
																:NumberOfAvailbleBooks => "#{numberOfAvailbleBooks}", 
																:NumberOfBorrowedBooks => "#{numberOfBorrowedBooks}",
																:Ranking => "#{@bookborrowcounter}") 
									@member.update_attributes(:MemberID => "#{$mem_id}",
																	:NumberOfBooks => "#{numberOfBooks}") 
						
									@borrow = Borrow.new(params[:borrow])
									puts @borrow.MemberID = $mem_id
									if @borrow.save
											session[:msg] = 'You have Issued book successfully'
												#redirect_to => :controller => 'mailer', :action => 'issuebook'
											render :action => "new" 
									else
											render :action => "new" 
									end
						else
								session[:msg]="This Book is Issued"
						end
		
				else
					puts "in else"
					session[:msg]="Please Select Proper Date "
					redirect_to :action => "new"
				end
		
		else
				session[:msg]="Please Enter Book ID"
				redirect_to :action => "new"
		end
             
	end

end
