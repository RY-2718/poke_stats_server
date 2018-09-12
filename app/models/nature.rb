# 性格
class Nature < ActiveYaml::Base
  set_root_path File.expand_path('db/fixture', Rails.root)
  set_filename 'nature'

  field :a, default: 1.0
  field :b, default: 1.0
  field :c, default: 1.0
  field :d, default: 1.0
  field :s, default: 1.0
end
