# frozen_string_literal: true
require 'net/http'
require 'addressable/uri'
require 'json'

class KodiClient
  def initialize(uri)
    @uri = Addressable::URI.parse(uri)
  end

  def request(name, id, args = {})
    post_body = {
      'method' => name,
      'params' => args,
      'jsonrpc' => '2.0',
      'id' => id
    }.to_json

    resp = JSON.parse(http_post_request(post_body))
    return resp['error'] if resp['error']
    resp['result']
  end

  private

  def http_post_request(post_body)
    http = Net::HTTP.new(@uri.host, @uri.port)
    request = Net::HTTP::Post.new(@uri.request_uri)
    request.basic_auth(@uri.user, @uri.password)
    request.content_type = 'application/json'
    request.body = post_body
    http.request(request).body
  end
end
