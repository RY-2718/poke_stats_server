require 'bundler/setup'
require 'nokogiri'
require 'open-uri'
require 'yaml'

url = 'https://gamewith.jp/pokemon-usum/article/show/79582'
charset = nil

html = open(url) do |f|
  charset = f.charset
  f.read
end

dataset = []

doc = Nokogiri::HTML.parse(html, nil, charset)
doc.css('#tabledata > table > tr').each_with_index do |tr, i|
  next unless tr.get_attribute('data-col1')
  data = {}
  data['id'] = i
  data['name'] = tr.get_attribute('data-col1')
  data['type'] = tr.get_attribute('data-col2')[0..-3]
  data['cat'] = tr.get_attribute('data-col2')[-2..-1]
  data['power'] = tr.get_attribute('data-col3')
  data['accuracy'] = tr.get_attribute('data-col4')
  data['pp'] = tr.get_attribute('data-col5')
  dataset.push(data)
end

YAML.dump(dataset, File.open(File.dirname(__FILE__) + '/../db/fixture/moves.yml', 'w'))
