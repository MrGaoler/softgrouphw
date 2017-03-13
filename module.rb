module Notification
  def log(_path); end

  def send_message(type, recepient)
    p "#{type} was sent to #{recepient}"
  end
end

class Email
  include Notification
  def email_message(recepient)
    if recepient =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      send_message
    else
      raise ArgumentError, 'Invalid E-mail'
    end
  end
end

class Sms
  include Notification
  def sms_message(recepient)
    if recepient =~ /^\d{10}$/
      send_message
    else
      raise ArgumentError, 'Invalid sms'
    end
end
end

p '*************************************************************'
p 'enter phone number or mail'
p '*************************************************************'
recepient = gets.chomp
if recepient =~ /^\d{10}$/
  clas_email = Sms.new
  type = 'sms'
else
  clas_email = Email.new
  type = 'mail'
end
clas_email.send_message(type, recepient)
