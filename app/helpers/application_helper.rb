module ApplicationHelper
  def title
    if @title.present?
      "Topican - #{@title}"
    else
      "Topican"
    end
  end
end
