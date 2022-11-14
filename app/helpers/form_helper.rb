# app/helpers/form_helper.rb
module FormHelper
  def create_form_input(helper_tag,object,method,label_text,options = {})
    label = label_tag (object.to_s + "_" +method.to_s).to_sym, label_text
    label + self.send(helper_tag,  object,  method)
    #input_tag = ActionView::Helpers::FormTagHelper.call
    #yield input_tag.call(object,method)
    #input fields have a label and an input type
    #   labels receive a symbol for the name and a text value for display
    #   input fields require a symbol for the object class, and a symbol for the 'method', and a set of options
    #     essentially, the id is generated from :class_:method.
  end
end