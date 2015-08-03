class ContactController < ApplicationController
  def show
  end

  def create
    if MailerService.new(ContactMailer, :contact_email, contact_params).deliver
      redirect_to root_path, success: 'Tu mensaje fue enviado exitosamente.'
    else
      flash.now[:danger] = 'Tu mensaje no pudo ser enviado en este momento. Por favor, intenta más tarde.'
      render :show
    end
  end

  def contact_params
    params.required(:contact).permit(:name, :email, :subject, :message)
  end
end
