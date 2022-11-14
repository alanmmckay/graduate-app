# app/helpers/form_helper.rb
module FormHelper
  def create_form_input(helper_tag,object,method,label_text,placeholder = {}, errors = {}, options = {})
    puts flash[:info]
    puts flash[:login]
    puts :heeeerre
    value = {}
    if flash[:info] and flash[:info][method]
      value = {:value => flash[:info][method]}
    end

    label = label_tag (object.to_s + "_" +method.to_s).to_sym, label_text
    output = label + self.send(helper_tag,  object,  method, options.merge(value))

    #might negate this errors handling here
    if flash[:login] and flash[:login][method]
      output + flash[:login][method][0]
    else
      output
    end

  end
end