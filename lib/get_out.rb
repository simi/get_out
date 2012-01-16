# encoding: UTF-8
require 'cinch'

module GetOut
  def self.now!
    bot = Cinch::Bot.new do
      configure do |c|
        c.server   = "irc.cservers.cz"
        c.nick     = "Buh"
        c.channels = ["#cservers"]
      end

      on :message, /^Prosím, ať (.+?) strašně vypadne :\(/ do |m, who|
        m.reply "#{who}: Strašně, ale strašně, vypadni!"
      end
    end

    bot.start
  end
end
