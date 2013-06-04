class FilmController < ApplicationController
  before_filter :require_admin ,:only=>['edit','new','delete']
  before_filter :require_log_in,:only=>['order']
  def index
    @films=Film.find :all
  end

  def edit
    if request.get?
      @film=Film.find(params[:id])
    else if request.post?
        @film=Film.find(params['film']['id'])
        @film[:datetime]=mk_datetime params[:datetime]
        @film.update_attributes(params['film'])
  
      end
    end
  end

  def new
    if request.get?
      @film=Film.new
    else if request.post?
        film=Film.new
        film[:datetime]=mk_datetime params[:datetime]
        film[:seats_remain]=params[:film][:full_seats]
        film.update_attributes(params[:film])
        redirect_to '/film/show/'+film[:id].to_s
      end
    end
  end

  def show
    @film=Film.find(params[:id])
  end

  def delete
    Film.delete(params[:id])
  end





  def order
    if request.post?
      Order.create(params[:order])
      film=Film.find params[:order][:film_id]
      film[:seats_remain]-=1
      film.save
      member=Member.find params[:order][:member_id]
      member[:point]-=film[:price]
      member.save

      redirect_to '/film/index'
    else if request.get?
        @film=Film.find params[:id]
        film_orders=Array.new
        film_orders+=Order.find_all_by_film_id @film[:id]
        if film_orders.empty?
          @available_seats=Array(1..@film[:full_seats])
        else
          @available_seats=Array(1..@film[:full_seats])-film_orders.collect{|i| i[:seat_num]}
        end
      end
    end
  end

end
