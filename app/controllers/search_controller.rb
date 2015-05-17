class SearchController < ApplicationController
  def index
  	access_token = "2036849429.3b513f0.22460f5ac57d4a3fbb819afa5d72e4b9"
    client = Instagram.client(access_token: access_token)
    default_search = client.tag_search('dctech')

    if params[:q]
      search_query = client.tag_search(params[:q])
      @tag = search_query.present? ? search_query : default_search
    else
      @tag = default_search
    end

    @tag = @tag.first.name
    @results = client.tag_recent_media(@tag)
  end
end
