require 'digest/sha1'

class WechatController < ApplicationController

  def verify_wechat
    if check_signature?(params['signature'],params['timestamp'],params['nonce'],WECHAT_TOKEN)
      respond_to do |format|
        format.text  { render :text => params['echostr'] }
      end 
    end
  end

  def process_wechat
  end

  private 
    def check_signature?(signature,timestamp,nonce,access_token)
      Digest::SHA1.hexdigest([timestamp,nonce,access_token].sort.join) == signature
    end
end
