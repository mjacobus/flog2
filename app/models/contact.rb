class Contact < MailForm::Base
  attribute :subject, validate: true
  attribute :name,    validate: true
  attribute :email,   validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone, validate: true
  attribute :message, validate: true

  def headers
    {
      subject: "Mensagem via site: #{subject}",
      to:      "contato@pamelajacobus.com.br",
      from:    %("#{name}" <#{email}>)
    }
  end
end