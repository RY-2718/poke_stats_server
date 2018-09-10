# ポケモン図鑑的なクラス
class PokeDex < ActiveYaml::Base
  set_root_path File.expand_path('db/fixture', Rails.root)
  set_filename 'poke_dex'

  def abilities
    [ability0, hidden_ability, ability1].delete_if(&:blank?)
  end

  def base
    {
      h: self.H,
      a: self.A,
      b: self.B,
      c: self.C,
      d: self.D,
      s: self.S,
    }
  end

  def types
    [type0, type1].delete_if(&:blank?)
  end
end
