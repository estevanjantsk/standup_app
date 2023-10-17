# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_users, only: [:index]

  def index; end

  def new
    @user = User.new
    set_choices
  end

  def edit
    set_choices
  end

  def me
    @user = current_user
  end

  def password
    @user = current_user
  end

  def update_password
    @user = current_user

    respond_to do |format|
      if @user.update(user_password_params)
        bypass_sign_in(@user)
        format.html do
          redirect_to my_password_path,
                      notice: 'Password was successfully updated.'
        end
      else
        format.html { render :password }
      end
    end
  end

  def update_me; end

  def create; end

  def update; end
end
