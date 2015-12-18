class BorrowersController < ApplicationController
  def index
  	@borrower = Borrower.find(session[:user_id])
  	@lenders = History.joins(:lender).select('*').where(borrower:Borrower.find(session[:user_id]))
  end

  def create
  	@borrower = Borrower.create(first_name:params[:First_name], last_name:params[:Last_name], email:params[:Email], password:params[:Password], purpose:params[:Reason], description: params[:Description], raised: 0, money:params[:Money])
  	if @borrower.save == true
  		session[:user_id] = @borrower.id 
  		redirect_to "/borrower/#{@borrower.id}"
  	else
  		flash[:errors] = @borrower.errors.full_messages
  		redirect_to '/'
  	end
  end
end
