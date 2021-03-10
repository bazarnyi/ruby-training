# frozen_string_literal: true

class MenuSection < SitePrism::Section
  element :sign_up_link, '.register'
  element :logged_as, '#loggedas'
end
