# frozen_string_literal: true

require 'rest-client'

# This Module describes methods for Redmine API
module ApiWrapper
  def api_create_user(user)
    response = RestClient.post "#{ENV['ROOT_URL']}users.json",
                               {
                                 "user": {
                                   "login": user.username,
                                   "firstname": user.firstname,
                                   "lastname": user.lastname,
                                   "mail": user.email,
                                   "password": user.password
                                 }
                               }.to_json,
                               api_headers

    raise 'User was not created via API' unless response.code == 201
  end

  def api_headers
    { content_type: :json, 'x-redmine-api-key': ENV['API_KEY'] }
  end
end

World(ApiWrapper)
