class ExportController < ApplicationController

  def index

    @user = User.find(params[:user_id])

    if params[:filter]

      filter = {}

      %w(paysite_id content_type).each{ |content_type|
        filter[content_type] = params[:filter][content_type] if params[:filter][content_type]
      }

      @galleries = @user.galleries.where(filter)

    else
      @galleries = @user.galleries
    end

    respond_to do |format|
      format.rss { render :layout => false }
    end

  end

end
