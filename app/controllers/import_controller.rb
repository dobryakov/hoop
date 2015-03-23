class ImportController < ApplicationController

  def new
    @sponsor = Sponsor.find(params[:sponsor_id])
  end

  def create

    galleries = import_params[:galleries]

    galleries.each{ |paysite_id, raw_data|

      paysite = Paysite.find(paysite_id)

      content = raw_data[:pics]

      content.each_line{ |l|

        d = l.strip.split("|")

        url   = d[0]
        descr = d[1]

      }

    }

  end

  private

  def import_params
    params.permit(:sponsor, :galleries)
  end

end
