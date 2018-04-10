require 'nokogiri'
require 'open-uri'
class Fre_lotto
    def Fre=(value)
      @fre = value
    end
    def Num=(num)
        @num=num
    end
    
    
    def Fre
        return @fre
    end
    def Num
        return @num
    end
end

class MainController < ApplicationController
  def swap(arr, x, y)
    temp=arr[x]
    arr[x]=arr[y]
    arr[y]=temp
  end
  
  def first
    
  end

  def second
   
    doc = Nokogiri::HTML(open("http://www.nlotto.co.kr/gameResult.do?method=statByNumber"))

    @arr=Array.new

    for i in (0...45) do
      @temp = Fre_lotto.new
      @temp.Fre=(doc.css('.tbbghn')[i].text.strip)
      @temp.Num=i+1
    
      @arr[i]=@temp
   
    end

    for i in (0...45) do
      max=i
      for j in (i+1...45) do
        if @arr[max].Fre.to_i < @arr[j].Fre.to_i
          max=j
        end
      end
      swap(@arr,i, max)
    end


    # @arr.each { |a| 
    #   puts a.Fre
    #   puts a.Num
    # }


    @top_ten = @arr[0...13].to_a
    @lotto_random=Array.new {Array.new}
    # puts "-----top ten-------"
    # @top_ten.each { |a| 
    #   puts a.Fre
    #   puts a.Num
    # }
    # for i in (0..4) do
    #   #puts "Lotto Random Num "+(i+1).to_s
    #   @lotto_random[i] = @top_ten.sample(6)
    
    #   @lotto_random[i].each { |a| 
    #     puts a.Fre.to_s+" "+a.Num.to_s
    #     puts " "
    #   }
    # end
  end

  def third
  end
end