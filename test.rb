module Notification
  def self.log(_path)
    # тут чето будет скоро
  end
  module Export
    def log
      p File.open("#{to_s.downcase}.log", 'r', &:read)
    end
 end

  def add_to_log(path, recepient)
    File.open(path, 'a+') { |f| f.write("\nInvalid data: #{recepient}") }
  end
end

module Send_message
  def send_message(type, recepient)
    p "Sending #{type} to #{recepient}"
  end
end

class Email
  include Notification
  include Send_message
  def send_message(recepient)
    if recepient =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
      super('Email', recepient)
    else
      add_to_log(recepient)
      raise ArgumentError, 'Invalid E-mail format, email registered'
    end
  end

  def add_to_log(recepient)
    super('Email.log', recepient)
  end
end

class Sms
  include Notification
  include Send_message
  def send_message(recepient)
    if recepient =~ /^\d{10}/
      super('Sms', recepient)
    else
      add_to_log(recepient)
      raise ArgumentError, 'Invalid phone number, number registered'
    end
  end

  def add_to_log(recepient)
    super('Sms.log', recepient)
  end
end

p '*************************************************************'
p 'enter phone number or mail'
p '*************************************************************'

recepient = gets.chomp
if recepient =~ /^[0-9]/
  Sms.new.send_message(recepient)
else
  Email.new.send_message(recepient)
end

p 'Do you want read log-files? (y/n)'
if gets.chomp == 'y'
  p '*************************************************************'
  p 'sms log'
  Sms.log
  p '*************************************************************'
  p 'email log'
  Email.log
end
