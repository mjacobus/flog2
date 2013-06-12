module FacebookShareHelper
  #
  # meta info for facebook like
  #
  def facebook_like_meta
    if show_facebook_like?
      html = facebook_like_properties.map do |name, value|
        "<meta property=\"og:#{name}\" content=\"#{value}\" />"
      end.join("\n").html_safe
    end
  end
  
  #
  # facebook properties accessor
  #
  def facebook_like_properties
    @facebook_like_properties ||= {
      'country-name' => 'Brazil',
      email: 'contato@pamelajacobus.com.br',
      image: request.base_url + asset_path('logo-original.png'),
      site_name: 'Pamela Jacobus Fotografia',
      title: 'Pamela Jacobus Fotografia',
      type: :website,
      url: 'http://www.pamelajacobus.com.br',
    }
  end
  
  #
  # facebook script
  #
  def facebook_like_header
      html = <<STRING
      <div id="fb-root"></div>
      <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>
STRING

    if show_facebook_like?
      html.html_safe
    end
  end
  
  #
  # like buttom
  #
  def facebook_like_buttom(meta_options = {}, data = {})
    @show_facebook_like = true

    facebook_like_properties.merge!(meta_options)
    
    options = {
      class: "fb-like",
      data: {
        layout: 'button_count',
        send: true,
        width: 90,
        'show-faces' => true,
        href: request.original_url
      }.merge(data)
    }

    like_buttom = content_tag(:div, nil, options)
    content_tag(:div, like_buttom, {class: :fb_like_container})
  end
  
  #
  # whether show facebook like
  #
  def show_facebook_like?
    @show_facebook_like
  end  

end
