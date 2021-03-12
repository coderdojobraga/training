require 'sinatra/namespace'
# set :public_folder, __dir__ + '/statics'

namespace '/api/v1' do
    get ('/atweets') { 
        Atweet.all.to_json 
    }

   # post '/atweets' do
   #    new_atweet = Atweet.new(Json.parse(request.body.read)).save
   #     new_atweet.to_json
   # end

    get '/atweets/:id' do |id| # nome que irei carregar/usar o parâmetro no código
        Atweet.find(id).author
    end

    # Testar com outra template engine e tentar direto com html5
    get '/atweets2/:id' do |id| # erb : ruby template engine(ruby conhece)
        # locals -> variáveis locais daqui que mandarei para a template engine
        erb :tweet, :locals => {:nome => Atweet.find(id).author,
                                :conteudo => Atweet.find(id).content,
                                :likes => Atweet.find(id).likes}
                                                   
    end
end
    