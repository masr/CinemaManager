# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def require_admin
    if !session[:admin]
      flash[:warning]="您得是管理员才行哥们！！！";
      redirect_to '/member/login'
    end
  end

  def mk_datetime datetime
     Time.mktime datetime["datetime(1i)"],datetime["datetime(2i)"],datetime["datetime(3i)"],datetime["datetime(4i)"],datetime["datetime(5i)"]
  end

  def require_log_in
    if !session[:member_id]
      flash[:warning]="您得登录才行"
      session[:pre_url]=request.url
      redirect_to '/member/login'
    end
  end
  
end
