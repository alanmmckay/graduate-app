module ApplicationHelper
  def new_header header_text
    if !(session[:exclusions])
      session[:exclusions] = []
    end
    session[:header] = header_text
    render :file => 'layouts/header.html.haml'
  end

end
