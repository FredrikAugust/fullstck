class StaticPageController < ApplicationController
  def index
  end

  def letsencrypt
    render text: 'o5RFge336MEvRasA8NWrSNhTuZFj1Z5KMggG-FSqF5U._8dzRWZ5-z5LI5mskBodjOPtbhrPaRnnQrpZuNbs58Q'
  end
end
