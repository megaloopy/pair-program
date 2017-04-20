module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "danger"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "info"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end
end
