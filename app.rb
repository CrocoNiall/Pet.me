class Animals < Sinatra::Base

  # General route actions
  get '/' do
    erb :home
  end

  get '/about' do
    erb :about
  end

  # RESTful Artist Controller Actions
  # index
  get '/animal' do
    @animals = Animal.all
    erb(:"animal/index")
  end

  # new
  get '/animal/new' do
    @animal = Animal.new
    erb(:"animal/new")
  end

  # create
  post '/animals' do
    @animal = Animal.new(params[:animal])
    if @animal.save
      redirect("/animals/#{@animal.id}")
    else
      erb(:"animal/new")
    end
  end

  # show
  get '/animals/:id' do
    @animal = Animal.find(params[:id])
    erb(:"animal/show")
  end

  # edit
  get '/animal/:id/edit' do
    @animal = Animal.find(params[:id])
    erb(:"Animal/edit")
  end

  # update
  post '/animals/:id' do
    @animal = Animal.find(params[:id])
    if @animal.update_attributes(params[:animal])
      redirect("/animals/#{@animal.id}")
    else
      erb(:"animal/edit")
    end
  end

  # delete
  post '/animals/:id/delete' do
    @animal = Animal.find(params[:id])
    if @animal.destroy
      redirect('/animal')
    else
      redirect("/animals/#{@animal.id}")
    end
  end

end
