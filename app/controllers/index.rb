get '/' do
  erb :home
end

post '/new_game' do
  player1_name = params[:name1]
  player2_name = params[:name2]

  if Player.find_by_name(player1_name)
    @player1 = Player.find_by_name(player1_name)
  else
    @player1 = Player.create(name: player1_name)
  end

  if Player.find_by_name(player2_name)
    @player2 = Player.find_by_name(player2_name)
  else
    @player2 = Player.create(name: player2_name)
  end

  @game = Game.create(player1_id: @player1.id, player2_id: @player2.id)

  session[:game_id] = @game.id

  redirect to "/play/#{@game.id}"
end

get '/play/:game_id' do
  session[:game_id]
  session_start!
  @game = Game.find(session[:game_id])

  player1_id = @game.player1_id.to_i
  player2_id = @game.player2_id.to_i

  @player1 = Player.find(player1_id)
  @player2 = Player.find(player2_id)

  erb :play
end
