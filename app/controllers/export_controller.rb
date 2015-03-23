class ExportController < ApplicationController

  def index

    @user = User.find(params[:user_id])

    if params[:filter]
      @galleries = @user.galleries.where(:paysite => params[:filter][:paysite_id])
    else
      @galleries = @user.galleries
    end

    respond_to do |format|
      format.rss { render :layout => false }
    end

  end

end
