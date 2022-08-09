class Rainfall

     def initialize(city, data)
       @city = city
       @data = data.split("\n")
       @rainfall_data = nil
       @mean_value = nil
     end
   
     def mean
       @rainfall_data ||= get_rainfall_data(@data, @city)
       return -1 if @rainfall_data.empty?
   
       @mean_value = @rainfall_data.sum / @rainfall_data.size
   
       @mean_value
     end
   
     def variance
       @mean_value ||= self.mean
       return -1 if @mean_value == -1
   
       diff_rainfall_data = @rainfall_data.map { |value| (value - @mean_value) ** 2 }
     
       diff_rainfall_data.sum / diff_rainfall_data.size
     end
   
     private
   
     def get_rainfall_data(data, city)
       city_str = ''
   
       # searching the string with rainfall numbers of a city
       data.each do |str|
         city_str = str if str.include?(city.capitalize)
       end
   
       # retrevive float numbers from the string and return array with this values
       # then convert values from string to float
       city_str.scan(/\d+[.]\d+/)
               .map { |value| value.to_f }
     end
   
   end