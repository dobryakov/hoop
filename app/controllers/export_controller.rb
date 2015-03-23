class ExportController < ApplicationController

  def index

    @user = User.find(params[:user_id])
    @galleries = @user.galleries

    respond_to do |format|
      format.rss { render :layout => false }
    end

  end

end
