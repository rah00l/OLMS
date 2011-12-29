class AlertController < ApplicationController
  layout 'design'
  
      def list
        conditional_date1 = Date.today
        puts conditional_date = conditional_date1 - 2
    #@list = Borrow.find(:all,
	#					 :conditions => "DayOfReturn >= #{conditional_date}",
	#					 :order => "DayOfReturn")
						 
				@list = Borrow.find_by_sql("select * from borrows where DayOfReturn >= '#{conditional_date}' order by DayOfReturn")		 
				@list.each do |i|
					puts i.BookID
				end		
								
						 
           end
           
           def dispdata
                    puts params[:ipaddress]
           end
           
           def registerreq
			puts "registerreq"
			@members = Member.find(:all,
										:conditions =>  "Reqflag = 'N'")
            end
           
             
  

end
