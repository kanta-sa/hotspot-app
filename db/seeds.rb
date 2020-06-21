require 'csv'

#使用するデータ(CSVファイルの列)を指定
CSVROW_PREFID = 1
CSVROW_PREFNAME = 2
CSVROW_CITYNAME = 3

CSV.foreach('db/csv/prefectures_cities.csv') do |row|
  prefecture_id = row[CSVROW_PREFID]
  prefecture_name = row[CSVROW_PREFNAME]
  city_name = row[CSVROW_CITYNAME]

  Prefecture.find_or_create_by(name: prefecture_name)
  City.find_or_create_by(name: city_name, prefecture_id: prefecture_id)
end
