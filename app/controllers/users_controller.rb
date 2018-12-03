class UsersController < ApplicationController

def index
    render json:User.all
end

def show
    user = get_current_user
    if user 
        render json:user
    else 
        render json: {error: 'You are not signed in.'}
    end 
end

def edit
    user = get_current_user
end

def update
    user = User.find_by(email: params[:email])
    if user
        updatedUser = user.update(email: params[:email], password: params[:password], city: params[:city], gender: params[:gender])
        render json:user
    else 
        render json: {error: 'You are not signed in.'}
    end 
end

def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        render json: {id: user.id, email: user.email, city: user.city, gender: user.gender, token: issue_token({id: user.id})}
    else
        render json: {error: 'Invalid email/password combination.'}, status: 400
    end
end

def signup
    user = User.new(email: params[:email], password: params[:password], city: params[:city], gender: params[:gender] )
    if user.valid?
        user.save
        render json: {email: user.email, id: user.id, city: user.city, gender: user.gender, token: issue_token({id: user.id})}
    else
        render json: {error: 'Incorrect details'}, status: 400
    end
end

def validate
    user = get_current_user
    if user
        render json: {email: user.email, id: user.id, token: issue_token({id: user.id}), city: user.city, gender: user.gender}
    else
        render json: {error: 'User not found.'}, status: 400
    end
end


end
