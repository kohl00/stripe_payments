class MailinglistController < ApplicationController
  def subscribe
  	 @list_id ='82eb02ca6e'
     gb = Gibbon::API.new(ENV["MAILCHIMP_API_KEY"])

     gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })

    redirect_to root_path
  end

  def index
  end

  def new
  end
end
