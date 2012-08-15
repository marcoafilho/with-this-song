module ApplicationHelper
  def active_controller?(name)
    controller.controller_name.eql?(name)
  end
  
  def control_group(form, attrs, &block)
    if form.object.errors.include?(attrs)
      content_tag(:div, class: "control-group error") do
        capture(&block)
      end
    else
      content_tag(:div, capture(&block), class: "control-group")  
    end
  end
  
  def error_messages(form, attrs)
    content_tag(:span, format_error_message(form, attrs) , class: "help-inline")
  end
  
  def format_error_message(form, attrs)
    if form.object.errors.any? && form.object.errors.messages[attrs].any?
      form.object.errors.messages[attrs].join(". ").humanize
    end
  end
  
  def rating(number, max)
    max.times.collect do |n|
      if n <= number
        content_tag(:span, "", class: "icon-star")
      else
        content_tag(:span, "", class: "icon-star-empty")
      end
    end.join
  end
end
