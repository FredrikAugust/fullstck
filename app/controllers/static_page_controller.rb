class StaticPageController < ApplicationController
  def index
  end

  def letsencrypt
    render text: 'C2vz_hqCloge9wHHmF9LMw2xhmQ80P16Tffza2GnArs._8dzRWZ5-z5LI5mskBodjOPtbhrPaRnnQrpZuNbs58Q'
  end
end
