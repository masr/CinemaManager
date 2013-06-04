class AdminController < ApplicationController
  before_filter :require_admin



  def statistic
     @members=Member.find :all
  end



end
