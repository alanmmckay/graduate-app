# app/helpers/form_helper.rb
module FormHelper
  def create_form_input(helper_tag,object,method,label_text = "", options = {}, label_options = {})
    value = {}
    if flash[:info] and flash[:info][method]
      value = {:value => flash[:info][method]}
    end

    label = label_tag (object.to_s + "_" +method.to_s).to_sym, label_text, label_options
    label + self.send(helper_tag,  object,  method, options.merge(value))

  end

  def create_form_error(object,method,label_text = false, options = {:class => "alert-danger"})
    if label_text
      puts label_tag (object.to_s + "_" + method.to_s).to_sym, label_text, options
      label_tag (object.to_s + "_" + method.to_s).to_sym, label_text, options
    end
  end
end