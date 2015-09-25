module AuthenticationHelper
  def token(user)
    user.access_tokens.create.token
  end
end

