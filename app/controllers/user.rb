get '/users/profile'  do
  @profile = User.find_by(id: session[:user_id])
  erb :'/users/profiles'
end

get '/users/profile/edit' do
  @user = current_user
  erb :'/users/edit'
end

put '/users/profile' do
  @editprofile = User.find_by(id: session[:user_id])
  @editprofile.update_attributes(
    username:      params[:username],
    password_hash: params[:password_hash],
    first_name:    params[:first_name],
    last_name:     params[:last_name],
    email:         params[:email],
    phone_number:  params[:phone_number]
    )
  redirect '/users/profile'
end