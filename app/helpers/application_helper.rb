# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def format_event(event)
    user = "<b>#{link_to event.user.name, user_path(event.user)}</b>" unless event.kind == "announcement"
    case event.kind
      when "announcement"
        "<span class='announcement'><big>#{event.message}</big></span>"
      when "create_image"
        # "#{user} adicionou uma #{link_to 'imagem', image_path(event.image)} à galeria"
        "#{user} adicionou uma imagem à #{link_to 'galeria', images_path}"
      when "create_demo"
        "#{user} adicionou um demo à #{link_to 'galeria', demos_path}"
      when "create_image_comment"
        "#{user} comentou a #{link_to 'imagem', image_path(event.image)} adicionada por #{event.image.user}"
      when "create_demo_comment"
        "#{user} comentou a #{link_to 'imagem', image_path(event.image)} adicionada por #{event.image.user}"
      when "create_map_comment"
        "#{user} comentou a #{link_to 'imagem', image_path(event.image)} adicionada por #{event.image.user}"
      when "create_user"
        "#{user} é o novo integrante do Savage Brasil!"
    end
  end
  
end
