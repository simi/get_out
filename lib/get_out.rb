# encoding: UTF-8
require 'cinch'

module GetOut
  def self.now!
    # We are starting a new IRC bot.
    bot = Cinch::Bot.new do
        # By default it will use irc.cservers.cz server
        # with Buh nick and will join #cservers channel.
      configure do |c|
        c.server   = "irc.cservers.cz"
        c.nick     = "Buh"
        c.channels = ["#cservers"]
      end
      # When some types exactly "Prosím ať NICK strašně vypadne"
      # it will automaticaly respond into channel with message
      # "NICK: Strašně, ale strašně, vypadni!"
      # So that one lucky user will get notification.
      on :message, /^Prosím, ať (.+?) strašně vypadne :\(/ do |m, who|
        m.reply "#{who}: Strašně, ale strašně, vypadni!"
      end
    end
    # Finally, we need to start this circus.
    bot.start
  end
end
