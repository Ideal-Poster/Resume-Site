class PagesController < ApplicationController
  def show
      render template: "pages/#{params[:page]}"
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}"))
  end
end
