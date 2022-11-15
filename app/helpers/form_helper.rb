# app/helpers/form_helper.rb
module FormHelper
  class FormHelper::InvalidSymbolError < StandardError ; end
  def create_form_input_field(helper_sym, object, method, label_text = "", options = {}, label_options = {})
    affix = helper_sym.to_s.split('_')
    suffix = affix[affix.length - 1]
    if suffix == 'tag'
      raise FormHelper::InvalidSymbolError, ' WARNING: Be sure to use create_form_input_tag to access the tag object factory.'
    end
    value = {}
    if flash[:info] and flash[:info][method]
      value = {:value => flash[:info][method]}
    end
    label = label_tag (object.to_s + "_" +method.to_s).to_sym, label_text, label_options
    label + self.send(helper_sym,  object,  method, options.merge(value))
  end

  def create_form_input_tag(helper_sym, name, label_text, options = {}, label_options = {})
    # --- To ensure this isn't misused --- #
    nonapplicable_tags = [:button_tag,:check_box_tag, :field_set_tag, :file_field_tag, :image_submit_tag, :radio_button_tag, :select_tag, :submit_tag]
    if nonapplicable_tags.include?(helper_sym)
      raise FormHelper::InvalidSymbolError, ' WARNING: non-applicable symbol (form_tag) given for create_form_input_tag.'
    end
    affix = helper_sym.to_s.split('_')
    suffix = affix[affix.length - 1]
    if suffix == 'field'
      raise FormHelper::InvalidSymbolError, ' WARNING: Be sure to use create_form_input_field to access the field object factory.'
    end
    # --- --- --- --- --- #
    value = {}
    if flash[:info] and flash[:info][name]
      value = {:value => flash[:info][name]}
    end
    label = label_tag name.to_sym, label_text, label_options
    label + self.send(helper_sym, name, nil, options.merge(value))
  end

  def create_form_input_select(name, label_text, collection, value_method, text_method, options = {}, label_options = {}, selected: nil )
    #select_tag(name, option_tags = nil, options = {}) ⇒ Object
    value = selected
    if flash[:info] and flash[:info][name]
      value = {:selected => flash[:info][name]}
    end
    label = label_tag name.to_sym, label_text, label_options

    options_tags = options_from_collection_for_select(collection,value_method,text_method, value)
    label + select_tag(name,options_tags, options)

    #usage: = create_form_input_select(:names, "list of names: ",User.all,'id','email',:selected => 2)
    #creates:
    # <select name="names" id="names">
    #   <option value="1">alan@example.com</option>
    #   <option selected="selected" value="2">alan@test.com</option>
    # </select>
    #usage: = create_form_input_select(:names, "list of names: ",User.all,'email','email',:selected => "alan@test.com")
  end

  def create_form_error(object,method,label_text = false, options = {:class => "alert-danger"})
    if label_text
      label_tag (object.to_s + "_" + method.to_s).to_sym, label_text, options
    end
  end

  #button_tag(content_or_options = nil, options = nil, &block) ⇒ Object
  #check_box_tag(name, value = "1", checked = false, options = {}) ⇒ Object
  #field_set_tag(legend = nil, options = nil, &block) ⇒ Object
  #file_field_tag(name, options = {}) ⇒ Object
  #image_submit_tag(source, options = {}) ⇒ Object
  #radio_button_tag(name, value, checked = false, options = {}) ⇒ Object
  #submit_tag(value = "Save changes", options = {}) ⇒ Object
end