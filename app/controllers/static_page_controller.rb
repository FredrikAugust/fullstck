class StaticPageController < ApplicationController
  def index
  end

  def letsencrypt
    render text: 'YpR6lWn-MytVCmF_cTlfmPe_XFFQSTUr_qRrwzAxUrk._8dzRWZ5-z5LI5mskBodjOPtbhrPaRnnQrpZuNbs58Q'
  end
end
