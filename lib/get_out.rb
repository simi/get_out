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
        c.nick     = "Marcela"
        c.channels = ["#cservers"]
      end
      # When some types exactly "Prosím ať NICK strašně vypadne"
      # it will automaticaly respond into channel with message
      # "NICK: Strašně, ale strašně, vypadni!"
      # So that one lucky user will get notification.
      on :message, /^Prosím, ať (.+?) strašně vypadne :\(/ do |m, who|
        m.reply "#{who}: Strašně, ale strašně, vypadni!"
      end

      on :message, /^Prosím, všichni vypadněte/ do |m|
	users =  m.channel.users.collect(&:first).collect(&:nick).join(', ')
        m.reply "#{users} vypadněte!"
      end

      on :message, /Buh, co si myslíš o nicku (.+?) \?/ do |m, nick|
        if rand(2) == 1
	  m.reply "#{nick} je super!"
        else 
          m.reply "#{nick} je pěknej vůl!"
	end
      end

      on :message, /Marcelo, máš moc hezký obvody :-*/ do |m|
	m.reply "Hi hi hi, nech toho :)))))"
      end

      on :message, /vypadni/ do |m|
        m.reply "jo, prostě vypadni"
      end

      on :message, /termin (.+?) neznam/ do |m|
	m.reply "calc pruser"
      end

    end
    # Finally, we need to start this circus.
    bot.start
  end
end
