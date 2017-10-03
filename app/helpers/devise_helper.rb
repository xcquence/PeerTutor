module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-warning alert-dismissable" style="z-index: 1; position: fixed; top: 0; left: 40%;">
      <button type="button" class="close" data-dismiss="alert" aria-label="close">x</button>
      <h6>#{sentence}</h6>    <!--Error message header-->
      #{messages}             <!--Error messages-->
    </div>
    HTML

    html.html_safe
  end
end