class PagesController < HighVoltage::PagesController
  layout :get_layout

  def show
    if params[:slug].present?
      @page = Page.find_by_slug!(params[:slug])
    else
      super
    end
  end

  private 
  def get_layout
    if params[:id] == 'home' 
      'clear'
    else
      'flog'
    end
  end

end
