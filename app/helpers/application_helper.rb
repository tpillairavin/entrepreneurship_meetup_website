module ApplicationHelper
  def administrator(current_entrepreneur)
    if current_entrepreneur
      current_entrepreneur.admin
    else
      false
    end
  end
end
