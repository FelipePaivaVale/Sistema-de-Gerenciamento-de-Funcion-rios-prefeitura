class UserMailer < ApplicationMailer
    def welcome_email(user, temporary_password)
      @user = user
      @temporary_password = temporary_password
      mail(to: @user.email, subject: 'Sua conta foi criada')
    end
  end
  