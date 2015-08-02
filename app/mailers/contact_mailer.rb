class ContactMailer < ApplicationMailer
  def contact_email(data)
    @data = OpenStruct.new(data)

    mail(
      from:          format_sender(@data),
      subject:       @data.subject,
      )
  end

  private

  def format_sender(data)
    "#{data.name} <#{data.email}>"
  end
end
