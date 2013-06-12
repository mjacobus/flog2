class FrontendController < ApplicationController
  layout 'flog'
  respond_to :js, :html

  def per_page
    params[:per_page] || 4 
  end

  def page
    params[:page]
  end

  def clean_params
    params.except(:controller, :action, :page)
  end
end
