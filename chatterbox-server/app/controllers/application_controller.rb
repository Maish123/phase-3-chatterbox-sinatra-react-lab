class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  ##GET/messages
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  ## POST/messages
  post '/messages' do
    new_message = Message.create(
      body: params[:body],
      username: params[:username]
    )
    new_message.to_json
  end

  ##PATCH/messages/:id
  patch '/messages/:id' do
    updated_message = Message.find(params[:id])
    updated_message.update(
      body: params[:body]
    )
    updated_message.to_json
  end

  ##DELETE/messages/:id
  delete '/messages/:id' do
    deleted_message = Message.find(params[:id])
    deleted_message.destroy
    deleted_message.to_json
  end
  
end
