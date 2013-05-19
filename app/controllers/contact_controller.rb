class ContactController < FrontendController
  respond_to :html, :js

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    @contact.deliver

    unless request.xhr?
      flash[:notice] = t('helpers.messages.contact_delivered')
    end

    respond_with(@contact)
  end
end
