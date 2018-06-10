class BotController < Messenger::MessengerController
  #   #logic here
  #   render nothing: true, status: 200
  #   #Postback
  #   if fb_params.first_entry.callback.postback?
  #     value = params["entry"].first["messaging"].first["postback"]["payload"]
  #     puts case tag
  #     when "start"
  #       buttons = Messenger::Templates::Buttons.new(
  #         text: "Bonjour je m’appelle Delphos. Je suis ici pour t'aider à vivre mieux et pour vivre sans stress. Comment te sens-tu aujourd’hui ? 🤖😀",
  #         buttons: [
  #           Messenger::Elements::Button.new(
  #             type: 'postback',
  #             title: 'Sévèrement stressé(e)!',
  #             value: '3'
  #           ),
  #           Messenger::Elements::Button.new(
  #             type: 'postback',
  #             title: 'Moyennement stressé(e)!',
  #             value: '2'
  #           )
  #           Messenger::Elements::Button.new(
  #             type: 'postback',
  #             title: 'Peu/pas stressé(e)!',
  #             value: '1'
  #           )
  #         ]
  #       )
  #       Messenger::Client.send(
  #         Messenger::Request.new(buttons,fb_params.first_entry.sender_id)
  #       )
  #     end
  #   end
  # end
end
