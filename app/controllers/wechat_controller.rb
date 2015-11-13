class WechatController < ApplicationController

  def verify
    @result = Hash.new
    @result['echostr'] = params['echostr']
    
    respond_to do |format|
      format.text  { render :text => params['echostr'] }
    end 

  end

  def process
    
  end

end
