class MemberController < ApplicationController

  before_filter :require_log_in,:except=>['login','register']

  def index
  end

  def edit
    if request.post?
      Member.update(session[:member_id],params[:member])
      flash[:warning]="修改成功"
      redirect_to '/member/index'
    else
    @member=Member.find(session[:member_id]);
    end
  end

  def register
    if request.post?
      Member.create(params[:member])
      login()
    end
  end

  def login
    if request.post?
      member=Member.find_by_name(params[:member][:name])
      if member.nil?
        flash[:warning]="用户名错误"
        redirect_to '/member/login'
        return
      end
      if member[:password]== params[:member][:password]
        session[:member_name]=member[:name];
        session[:member_id]=member[:id]
        session[:admin]=member[:is_admin]
        flash[:warning]="登录成功"
        redirect_to (session[:pre_url] or '/')
        session[:pre_url]=""
        return
      else
        flash[:warning]="密码错误"
        redirect_to '/member/login'
        return
      end

    end
  end

  def logout
    session[:member_id]=nil
    session[:member_name]=nil
    session[:is_admin]=nil
    redirect_to '/'
  end

  def order
    origin_orders=Order.find_all_by_member_id session[:member_id]
    @orders=Array.new
    for t in origin_orders
      if ((order=orders_exist_film_id(@orders,t[:film_id])))
         order[:count]+=1
         order[:seats]<<t[:seat_num]
      else
        @orders<<t
        t[:count]=1
        t[:film]=Film.find t[:film_id]
        t[:seats]=Array.new
        t[:seats]<<t[:seat_num]
      end
    end
    

  end

  def orders_exist_film_id orders,id
    for t in orders
      if t.film_id==id
        return t
    end
  end
  return false
  end

  def add_point
    if request.post?
       user=Member.find(session[:member_id])
       point=user.point+params[:point].to_i#转换字符串成为数字
       user.update_attribute("point", point);
       redirect_to '/member'
    end
  end

  def change_password
    if request.post?
      user=Member.find(session[:member_id])
      if params[:old_password]!=user[:password]
        flash[:warning]="原密码输入错误"
        redirect_to request.url and return
      end
      user.update_attribute("password", params[:new_password])
      flash[:warning]="密码修改成功"
      logout
    end
  end

  def toggle_status
    user=Member.find params[:id]
    status=user[:status]?0:1
    user.update_attribute("status", status)
    render :text=>status
  end

end
