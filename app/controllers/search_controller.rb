class SearchController < ApplicationController
  layout 'design'
  def index
  end

  def show
    puts "hi"
    
  #  if params[:search][:select]!=nil  and params[:search][:txtfield]!= nil
    
    
    puts @first = params[:search][:select]
    puts @temp = params[:search][:txtfield]
    
    session[:searchtype] = params[:search][:select]
    session[:searchcontent]  = params[:search][:txtfield]
    
#    if params[:search][:select].to_i == 1
  #    @books = Book.find(:all, :conditions => "BookID = #{params[:search][:txtfield]}" )
  
  
      
    if session[:searchtype] .to_i == 2
      @books =      Book.find( :all, 
                                        :conditions => "Subject = '#{session[:searchcontent]}'",
                                        :order => "Ranking DESC" )
     
    elsif session[:searchtype] .to_i == 3
      @books = Book.find(:all, 
                                   :conditions => "Title = '#{session[:searchcontent]}'" ,
                                   :order => "Ranking DESC")
      
      
    elsif session[:searchtype] .to_i == 1
      @books = Book.find(:all, 
                                   :conditions => "Author = '#{session[:searchcontent]}'" ,
                                   :order => "Ranking DESC")
      
   end 
    
    #elsif params[:search][:select].to_i == 5
    #  @books = Book.find(:all, :conditions => "Publisher = '#{params[:search][:txtfield]}'" )
      
   # elsif params[:search][:select].to_i == 6      
   #   @books = Book.find(:all, :conditions => "ISBN = '#{params[:search][:txtfield]}'" )  
      
     # puts "inelse"
   # end
   # else 
    #  end
    
    
    
    
  end

  def reserve
    puts params[:id]
    
    @book = Book.find(:first, :conditions => "BookID = #{params[:id]}")
    
    puts session[:user_id]
    
    @member = Member.find(:first, :conditions => "id = #{session[:user_id]}")
    
    puts @member.MemberID
    
    @book.update_attributes(:BookID => "#{params[:id]}",
							 :Reserve => "Y",
							 :mem_id => "#{@member.MemberID}")
							 
	#render :controller => "Mailer"
	redirect_to :controller => "Mailer", :action => "reserve", :bookid => params[:id]
	#render :file => 'app\views\mailer\index.html.erb'
    
    end

end
