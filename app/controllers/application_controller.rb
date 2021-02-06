class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options(*args)
    super.merge(locale: params["locale"])
  end

  private
  def set_locale
    lang = Constant::SUPPORTED_LANGUAGES[params["locale"]]
    I18n.locale = lang ? params["locale"] : I18n.default_locale
  end
end
