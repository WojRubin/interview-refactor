require 'rails_helper'

RSpec.describe "make episode as watched", :type => :request do

  it "mark episode as watched" do
    user = User.create!(:email => "foo@example.com", :password => "secret123")
    tv_show = TvShow.create!(user_id: user.id, title: 'SOA')
    ep1 = Episode.create!(episode: 1, tv_show_id: tv_show.id, watched: false)
    ep2 = Episode.create!(episode: 2, tv_show_id: tv_show.id, watched: false)
    tv_show.episodes << [ep1, ep2]
    post "/auth/sign_in", params: {:email => "foo@example.com", :password => "secret123"}
    auth_header = user.create_new_auth_token
    put "/episodes/#{ep1.id}", params: {tv_show_id: tv_show.id, episode: { watched: true }}, headers: auth_header
    get "/tv_shows/#{tv_show.id}/episodes", headers: {"ACCEPT" => "application/json"}, headers: auth_header

    expect(response.body).to include('true')
  end
end
