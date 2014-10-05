class UserController < ApplicationController
  def new
  end
  
  def create
    begin
      user_hash = User.add_user(params[:firstname], params[:lastname], params[:email], params[:password])
      if user_hash
        flash.now[:notice] = 'Thank you for signing up!'
        render "email_confirmation"
      end
    rescue ExpoMuseesWeb::AuthenticationError => e
      flash.now[:error] = e
      render "new"
    end
  end

  def show
    @current_user = User.get_user(session[:user_hash]) if session[:user_hash]
    @preferences = [
      {:short => "art_obj", :full => "objets d'art et design"},
      {:short => "europ_antiq", :full => "antiquités européennes"},
      {:short => "world_antiq", :full => "antiquités du monde"},
      {:short => "europ_antiq", :full => "antiquités européennes"},
      {:short => "world_art", :full => "arts du monde"},
      {:short => "popular_art", :full => "arts populaire"},
      {:short => "archi", :full => "architectures, cartes et plans"},
      {:short => "movie", :full => "vidéos et cinéma"},
      {:short => "draw", :full => "dessins, estampes et enluminures"},
      {:short => "paint", :full => "peintures"},
      {:short => "picture", :full => "photographies"},
      {:short => "scult", :full => "sculptures"},
      {:short => "d3", :full => "installations et œuvres en 3D"},
      {:short => "mudisc", :full => "musique, littérature et poésie"},
      {:short => "mode", :full => "mode, bijoux et costumes"},
      {:short => "science", :full => "sciences et nature"},
      {:short => "abstract", :full => "techno et multimédia"},
      {:short => "bd", :full => "bande dessinée et arts graphiques"},
      {:short => "life_art", :full => "art de vivre"},
      {:short => "contemp", :full => "art contemporain"}
    ]

    if (@current_user.nil?)
      redirect_to root_url, :notice => "You need to be signed in to access that page"
    end
  end
end
