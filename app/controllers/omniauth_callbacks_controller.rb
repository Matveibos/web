class OmniauthCallbacksController <Devise::OmniauthCallbacksController#<- встроенный класс  #

  #определяем метод который говорит, что мы работаем с facebook
  def facebook
    # #объявляем переменную @user
    # # #при заходе на facebook  вылезшла ошибка undefined method `find_for_oauth' for #<Class:0x0000000009939190>
    # # предложено исправить на find_for_authentication
    # @user=User.find_for_authentication(request.env['omniauth.auth'])
    # #проверяем есть пользователь сохранен, то мы должны вызвать метод sign_in_and_redirect
    # # (должны войти на сайт и перенаправить его)
    # if @user.persisted?
    #   sign_in_and_redirect @user,event: authentication
    #   # перенаправили на пользо^вателя и передали devise информацию, о том, что пользователь аутентифиципрван
    #   # встроенный метод: пришел ли тот запрос который ожидает пользователь
    #   if is_navigational_format?
    #     # будет выведено сообщение, что вы успешно аутентифицировались через фейсбук
    #     set_flash_message(:notice, :success, kind:'Facebook')
    #   end
    # end
    render json:request.env['omniauth.auth']
  end
end