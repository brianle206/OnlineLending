class LendersController < ApplicationController
	Newmoney = 0
  def index
  	@user = Lender.find(session[:user_id])
  	@borrower = Borrower.all
  	@lent = History.joins(:borrower).select('*').where(lender: Lender.find(session[:user_id]))
  end

  def create
  	@user = Lender.create(first_name: params[:First_name],last_name:params[:Last_name],email:params[:Email],password:params[:Password],money: params[:Money])
  		if @user.save == true
        	session[:user_id] = @user.id
  		  	redirect_to "/lender/#{@user.id}"
  	  	else
  	  		flash[:errors] = @user.errors.full_messages
  	  		redirect_to '/'
  	  	end
  end
  def lend
  	
  	borrower = Borrower.find(params[:bid])
  	user = Lender.find(params[:uid])
  	user.update(money: user.money - params[:lend].to_i)
  	if borrower.raised < 0
  		borrower.update(raised:params[:lend].to_i)
  	else
  		borrower.update(raised: borrower.raised + params[:lend].to_i)
  	end
  	History.create(amount:params[:lend],lender: user, borrower: borrower)
  	redirect_to '/lenders/index'

  end
end
