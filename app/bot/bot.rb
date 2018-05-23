require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  if message.text include? "Bonjour"
    message.reply("Bien le bonjour l'ami !")
  elsif message.text include? "Yo"
    message.reply("Wesh ma gueule !")
  elsif message.text("Salut")
    message.reply("Salut salut mon petit loup ! :)")
  else
    message.reply("Ne pas hésiter à dire bonjour, je ne suis pas ton chien...")
  end
end
