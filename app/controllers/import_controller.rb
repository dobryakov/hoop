class ImportController < ApplicationController

  http_basic_authenticate_with :name => ENV['ADMIN_HTTP_LOGIN'], :password => ENV['ADMIN_HTTP_PASSWORD'] if Rails.env.production? || Rails.env.development?

  def new
    @sponsor = Sponsor.find(params[:sponsor_id])
  end

  def create

    galleries = params[:galleries]

    created_galleries = []

    galleries.each{ |paysite_id, raw_data|

      paysite = Paysite.find(paysite_id)

      [:pics, :movies].each{ |content_type|

        content = raw_data[content_type]

        content.each_line{ |l|

          d = l.strip.split("|")

          url   = d[0].to_s.strip
          descr = d[1].to_s.strip

          if url.length > 0
            begin
              g = Gallery.create(
                :url          => url,
                :description  => descr,
                :paysite      => paysite,
                :content_type => content_type,
                :owner        => current_user
              )
            rescue ActiveRecord::RecordNotUnique => e
            end
          end

          created_galleries.push(g)

        }

      }

    }

    redirect_to action: "new", sponsor_id: params[:sponsor][:id], notice: "Successfully imported #{created_galleries.count} galleries"

  end

  private

  def import_params
    params.permit(:sponsor, :galleries)
  end

end
