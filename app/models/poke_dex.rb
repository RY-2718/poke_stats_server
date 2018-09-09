# ポケモン図鑑的なクラス
class PokeDex < ActiveYaml::Base
  set_root_path File.expand_path('db/fixture', Rails.root)
  set_filename 'poke_dex'
end
