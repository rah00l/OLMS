#require 'will_paginate'

class ExtrabookController < ApplicationController
	
	layout 'design'
	
	def availablebooks
		puts "---------------"
		@books = Book.find(:all, :conditions => "Availble='Available'" )
    
  #  @books = Book.paginate(:page => params[:page], :per_page => 5)
	end

	def borrowedbooks
		puts "!!!!!!!!!!!!!!"
		@books = Book.find(:all, :conditions => "NumberOfBorrowedBooks > 0 OR Availble = 'Not Available'")
    #  @books = Book.paginate(:page => params[:page], :per_page => 5)
	end
  
	def favoritebooks
		p "inside favoritebooks"
		@books = Book.find(:all,
                                :order => "Ranking DESC" )
   # @books = Book.paginate(:page => params[:page], :per_page => 5)

	end

end
