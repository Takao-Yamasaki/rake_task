class User < ApplicationRecord
    def self.import(path)
        list = []
        CSV.foreach(path,headers:true) do |row|
            list << {
                name: row["name"],
                age: row["age"],
                address: row["address"]
            }
        end
        puts "インポート処理を開始".red
        begin
            User.create!(list)
            puts "インポートに成功しました".green
        rescue ActiveModel::UnknownAttributeError => invalid
            puts "インポート失敗 :#{invalid}".red
        end
     end
end
