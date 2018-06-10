require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

Bot.on :message do |message|
  # message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
  # message.sender      # => { 'id' => '1008372609250235' }
  # message.seq         # => 73
  # message.sent_at     # => 2016-04-22 21:30:36 +0200
  # message.text        # => 'Hello, bot!'
  # message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]
  if message.text.include? 'Sévèrement'
    message.mark_seen
    message.typing_on
    message.reply(text: "Ça tombe bien, je suis là pour t'aider ! Qu'est ce qui cause ton stress en ce moment ?")
  else
    message.mark_seen
    message.typing_on
    message.reply(text: "Bonjour je m’appelle Delphos. Je suis ici pour t'aider à vivre mieux et pour vivre sans stress. Comment te sens-tu aujourd’hui ?",
      quick_replies: [
        {
          content_type: 'text',
          title: 'Sévèrement stressé(e)!',
          payload: 'SEVERELY_STRESSED'
        },
        {
          content_type: 'text',
          title: 'Moyennement stressé(e)!',
          payload: 'SOMEWHAT_STRESSED'
        },
        {
          content_type: 'text',
          title: 'Peu/pas stressé(e)!',
          payload: 'NOT_STRESSED'
        }
      ]
      )
  end
end

Facebook::Messenger::Profile.set({
   get_started: {
     payload: 'LETS_START'
   }
 }, access_token: ENV['ACCESS_TOKEN'])


Bot.on :postback do |postback|
  postback.sender    # => { 'id' => '1008372609250235' }
  postback.recipient # => { 'id' => '2015573629214912' }
  postback.sent_at   # => 2016-04-22 21:30:36 +0200
  postback.payload   # => 'EXTERMINATE'
  if postback.payload == "LETS_START"
    postback.deliver(
      message: {
        text: "Bonjour je m’appelle Delphos. Je suis ici pour t'aider à vivre mieux et pour vivre sans stress. Comment te sens-tu aujourd’hui ?"
      }
    )
  end

  if postback.payload == "SEVERELY_STRESSED" || "SOMEWHAT_STRESSED"
    puts "Ça tombe bien, je suis là pour t'aider ! Qu'est ce qui cause ton stress en ce moment ?"
  end

  if postback.payload == "NOT_STRESSED"
    puts "cool"
  end

end
