class PagesController < HighVoltage::PagesController
  layout :get_layout

  private 
  def get_layout
    if params[:id] == 'home' 
      'clear'
    else
      'flog'
    end
  end

end