class StaticPagesController < ApplicationController
  skip_before_action :require_login!, only: [:welcome]
  def root
  end

  def welcome
    render :welcome, layout: false
  end
end
