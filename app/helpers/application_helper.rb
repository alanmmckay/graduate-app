module ApplicationHelper
  def new_header header_text
    session[:header] = header_text
    render :file => 'layouts/header.html.haml'
  end

end
