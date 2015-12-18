class SessionsController < ApplicationController
  def new
  end
  def login
  end
  def create
  	lender = Lender.find_by_email(params[:Email])
  	borrower = Borrower.find_by_email(params[:Email])
    	if lender && lender.authenticate(params[:Password])
	      session[:user_id] = lender.id
	      redirect_to '/lenders/index'
    	elsif borrower && borrower.authenticate(params[:Password])
	      session[:user_id] = borrower.id
	      redirect_to '/borrowers/index'
    	else
	      flash[:errors] = "Invalid combination"
	      redirect_to '/already'
	    end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to '/sessions/new'
  end
end
