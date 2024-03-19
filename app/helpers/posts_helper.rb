module PostsHelper

  def display_content(content)
    parsed_content = JSON.parse(content)
    content_html = parsed_content['blocks'].map do |block|
      case block['type']
      when 'paragraph'
        "<p>#{block['data']['text']}<p>"
      when 'block'
        "
          <div style='position:relative;padding:50px;'>
            <div>
              <h1 style='color:white'>#{block['data']['heading']}</h1>
              <h3 style='color:white'>#{block['data']['subheading']}</h3>
              <div style='display:flex;align-items:center;gap:0.5rem;margin-top:0.5rem'>
                <a href='#{block['data']['button1'] && block['data']['button1']['link']}'>
                  <button class='btn-green'>#{block['data']['button1'].present? ? block['data']['button1']['text'] : 'Button 1'}</button>
                </a>
                <a href='#{block['data']['button2'] && block['data']['button2']['link']}'>
                  <button class='btn-transparent'>#{block['data']['button2'].present? ? block['data']['button2']['text'] : 'Button 1'}</button>
                </a>
              </div>
            </div>
            <img src='#{'/img.jpeg'}' style='position:absolute;object-fit: cover;width:100%;height:100%;inset:0;z-index:-10;background-repeat: no-repeat;background-size: cover;'>
            <div style='background-color:#00000094;z-index:-10;inset:0;position:absolute'></div>
          </div>
        "
      else
      end
    end
    content_html.join.html_safe
  end
end
