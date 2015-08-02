class ContactMailer < ApplicationMailer
  include ActionView::Helpers::TextHelper

  def contact_email(data)
    @data = OpenStruct.new(data)

    mail(
      from:    format_sender(@data),
      subject: @data.subject,
      body:    simple_format(@data.message)
      )
  end

  private

  def format_sender(data)
    "#{data.name} <#{data.email}>"
  end
end
