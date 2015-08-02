class MailerService
  include ActiveModel::Validations

  attr_reader :mailer,
              :method,
              :name,
              :email,
              :subject,
              :message

  validates :mailer,  presence: :true
  validates :method,  presence: :true
  validates :name,    presence: :true, format: { with: /[a-z]/ }
  validates :email,   presence: :true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :subject, presence: :true
  validates :message, presence: :true

  def initialize(mailer, method, data)
    @mailer  = mailer
    @method  = method
    @name    = data[:name]
    @email   = data[:email]
    @subject = data[:subject]
    @message = data[:message]
  end

  def deliver
    if valid?
      mailer.send(method, data).deliver_now
    else
      false
    end
  end

  private

  def data
    {
      name:    name,
      email:   email,
      subject: subject,
      message: message
    }
  end
end
