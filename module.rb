require 'highline/import'

module Notification
  def self.included(param)
    param.extend(Impexp)
 end
  module Impexp
    def log
      p File.open("#{to_s.downcase}.log", 'r', &:read)
    end
  end
  def add_to_log(path, recepient)
    File.open(path, 'a+') { |file| file.write("\nInvalid data: #{recepient}") }
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
      raise ArgumentError, 'Invalid E-mail'
    end
  end

  def add_to_log(recepient)
    super('email.log', recepient)
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
      raise ArgumentError, 'Invalid number'

    end
end

  def add_to_log(recepient)
    super('sms.log', recepient)
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
  p 'SMS LOG'
  Sms.log
  p '*************************************************************'
  p 'EMAIL LOG'
  Email.log
end
