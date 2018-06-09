class ApplicationController < ActionController::Base
  def hello
    message.mark_seen
    message.typing_on
    @message =     message.reply(text: "Bonjour je m’appelle Delphos. Je suis ici pour t'aider à vivre mieux et pour vivre sans stress. Comment te sens-tu aujourd’hui ?",
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
