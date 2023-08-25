class UsersController < ApplicationController
  def index
    @users = User.geocoded
    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { user: user }),
        marker_html: render_to_string(partial: "marker", locals: { user: user })
      }
    end
  end
end
