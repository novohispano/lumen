module ContactHelper
  def contact_form_options
    %w(Trabajo Pasantía Voluntariado Alianza Comunidad Donación).sort.push('Otro')
  end
end
