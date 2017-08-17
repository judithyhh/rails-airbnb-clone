class PagesController < ApplicationController
  def home
    @lenses = Lense.all[0..8]
  end
end
