class PagesController < ApplicationController
  def home
    @lenses = Lense.all.order('created_at DESC').limit(9)
  end
end
