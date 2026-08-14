module SupplyRequestsHelper
  def status_badge(status)
  css_class =
  case status
  when "pending"
    "text-yellow-600 "
  when "approved"
    "text-green-600 "
  when "rejected"
    "text-red-600 "
  when "fulfilled"
    "text-blue-600 "
  end

  content_tag(:span, status.humanize, class: css_class)
  end
end
