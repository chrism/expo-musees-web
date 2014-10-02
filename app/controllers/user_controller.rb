class UserController < ApplicationController
  def show
    @user = current_user
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
  end
end