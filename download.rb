require 'faraday'
require 'faker'
class Image
  def self.download(url)
    response = Faraday.get(url)
    checker(response)
    type = Faker::StarWars.character + ".#{url.split('.').last}"
    type = type.delete(' ')
    File.open(type, 'wb') { |file| file.write(response.body) }
  end

  def self.checker(response)
    raise ArgumentError, 'did u paste proper URL?' if response
                                                      .status.to_s
                                                      .scan(/^\d/) == (4 || 5)

    raise TypeError, 'your link doesn`t contain image' if response
                                                          .headers['Content-Type']
                                                          .split('/')
                                                          .first != 'image'
  end
end

Image.download('http://www.planwallpaper.com/static/images/sw-worldbuilder-main3.jpg')
