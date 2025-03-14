module ImportersHelper
  def error_by_name(errors, key)
    return nil unless errors.key?(key.to_sym)

    "#{key} #{errors[key.to_sym][0]}"
  end
end
