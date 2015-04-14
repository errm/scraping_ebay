require 'wombat'
require 'monetize'
require 'pry'

Monetize.assume_from_symbol = true

class EbayPhone
  def initialize(data)
    self.name = data['name'].gsub("New listing\r\n\t\t",'')
    self.price = Monetize.parse(data['price'])
  end

  def to_s
    "#{name} - #{price.symbol}#{price}"
  end

  attr_reader :name, :price

  protected

  attr_writer :name, :price
end

class EbayPhonesScraper

  def self.get_phones(search)
    new(search).phones
  end

  def initialize(search)
    self.search = search
  end

  def phones
    data.fetch('phones', [])
      .map { |d| EbayPhone.new(d) }
      .select { |phone| phone.name.match(/#{search}/i) }
      .sort_by { |phone| phone.price }
  end

  protected

  attr_accessor :search

  private

  def data
    Wombat.crawl do
      base_url "http://www.ebay.co.uk"
      path "/sch/Mobile-Smart-Phones-/9355/i.html?_nkw=#{search}"
      phones "css=.lvresult", :iterator do
        name "css=.lvtitle"
        price "css=.lvprice"
      end
    end
  end
end

phones = EbayPhonesScraper.get_phones(ARGV[0])

puts "The Cheepest #{ARGV[0]}"
puts phones.first

puts "The Dearest #{ARGV[0]}"
puts phones.last
