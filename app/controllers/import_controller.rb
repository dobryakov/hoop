class ImportController < ApplicationController

  def new
    @sponsor = Sponsor.find(params[:sponsor_id])
  end

  def create

    galleries = params[:galleries]

    created_galleries = []

    galleries.each{ |paysite_id, raw_data|

      paysite = Paysite.find(paysite_id)

      content = raw_data[:pics]

      content.each_line{ |l|

        d = l.strip.split("|")

        url   = d[0]
        descr = d[1]

        g = Gallery.create(
          :url          => url,
          :description  => descr,
          :paysite      => paysite,
          :owner        => current_user
        )

        created_galleries.push(g)

      }

    }

    render :html => created_galleries.to_json

  end

  private

  def import_params
    params.permit(:sponsor, :galleries)
  end

end