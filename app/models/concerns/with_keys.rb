module WithKeys
  extend ActiveSupport::Concern

  def with_keys(keys)
    as_json.select {|key, value| keys.include? key}
  end
end
