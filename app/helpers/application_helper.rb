# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  CLAN_SERVER = "http://stats.newerth.com/icondir"
  
  def flash_message
    level = :info    if flash[:info]
    level = :success if flash[:success]
    level = :warning if flash[:warning]
    level = :error   if flash[:error]
    message = flash[level]
    "<div class='#{level} rounded_4'>#{message}</div><br/>" if flash[level]
  end
  
  def format_event(event)
    user = "<b>#{link_to event.user.name, user_path(event.user)}</b>" unless event.kind == "announcement"
    case event.kind
      when "announcement"
        "<span class='announcement'>#{event.message}</span>"
      when "create_image"
        # "#{user} adicionou uma #{link_to 'imagem', image_path(event.image)} à galeria"
        "#{user} adicionou uma imagem à #{link_to 'galeria', images_path}"
      when "create_demo"
        "#{user} adicionou um demo à #{link_to 'galeria', demos_path}"
      when "create_image_comment"
        "#{user} comentou a #{link_to 'imagem', image_path(event.image)} adicionada por #{event.image.user.name}"
      when "create_demo_comment"
        "#{user} comentou o #{link_to 'demo', demo_path(event.demo)} adicionado por #{event.demo.user.name}"
      when "create_map_comment"
        "#{user} comentou o mapa #{link_to event.map.name, map_path(event.map)}"
      when "create_user"
        "#{user} é o novo integrante do Savage Brasil!"
    end
  end
  
  def colorize(text)
    text.gsub(/(\^\d\d\d)/){"<span style='color:##{$1[1..-1]}'>"}.
      gsub(/(\^clan \d+?)\^/){"<img class='icon' src='#{CLAN_SERVER}/#{$1[6..-1]}.png'/>"}.
      gsub(/(\^w)/){"<span style='color:#ffffff'>"}.
      gsub(/(\^r)/){"<span style='color:#ff0000'>"}.
      gsub(/(\^g)/){"<span style='color:#00ff00'>"}.
      gsub(/(\^b)/){"<span style='color:#0000ff'>"}.
      gsub(/(\^y)/){"<span style='color:#ffff00'>"}
  end
  
  def format_chat(text)
    text.gsub(/^chat_team/, "<span class='team'>TEAM</span>").gsub(/^chat/, "").gsub(/(^.+\>)/) {"<strong>#{$1[0..-2]}</strong>"}
  end
  
  # string1 = "I 5ill drill for a well in 2alla walla washington."
  # string1.gsub!(/(\d.ll)/){"<span style='color:#{$1}'>"}
  # puts string1
  
end
