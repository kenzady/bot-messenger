require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  message.typing_on
  if message.text.include? "Bonjour"
    message.reply(text: "Bien le bonjour l'ami !")
  elsif message.text.include? "Yo"
    message.reply(text: "Wesh ma gueule !")
  elsif message.text.include? "Salut"
    message.reply(text: "Salut salut mon petit loup ! :)")
  else
    message.reply(text: "Ne pas hésiter à dire bonjour, je ne suis pas ton chien...")
  end
end
