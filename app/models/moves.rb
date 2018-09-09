# 技
class Moves < ActiveYaml::Base
  set_root_path File.expand_path('db/fixture', Rails.root)
  set_filename 'moves'
end
