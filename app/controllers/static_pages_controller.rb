class StaticPagesController < ApplicationController
  skip_before_action :require_login!, except: [:root]
  def root
  end

  def welcome
    render :welcome, layout: false
  end

  def privacy
  end

  def terms
  end
end
