class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
end



# class OmniauthCallbacksController <Devise::OmniauthCallbacksController#<- встроенный класс  #

  # #определяем метод который говорит, что мы работаем с facebook
  # def facebook
  #   # #объявляем переменную @user
  #   # # #при заходе на facebook  вылезшла ошибка undefined method `find_for_oauth' for #<Class:0x0000000009939190>
  #   # # предложено исправить на find_for_authentication
  #   # @user=User.find_for_authentication(request.env['omniauth.auth'])
  #   # #проверяем есть пользователь сохранен, то мы должны вызвать метод sign_in_and_redirect
  #   # # (должны войти на сайт и перенаправить его)
  #   # if @user.persisted?
  #   #   sign_in_and_redirect @user,event: authentication
  #   #   # перенаправили на пользо^вателя и передали devise информацию, о том, что пользователь аутентифиципрван
  #   #   # встроенный метод: пришел ли тот запрос который ожидает пользователь
  #   #   if is_navigational_format?
  #   #     # будет выведено сообщение, что вы успешно аутентифицировались через фейсбук
  #   #     set_flash_message(:notice, :success, kind:'Facebook')
  #   #   end
  #   # end
  #   render json:request.env['omniauth.auth']
  # end



