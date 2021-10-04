module UserOath
  #должен расширять модуль Active support и его метод concern
  extend ActiveSupport::Concern
  #создадим метод в который мы будем передавать auth
  def create_authorization(auth)
    #передаем поля таблицы authorization
    authorizations.create(provider: auth.provider,uid: auth.uid)
    class_methods do
      def find_for_oauth(auth)
        # используем встроенную helper class methods
        # создаем метод find for oauth
        # табличке передаем провайдер и uid(то, что мы нашли)
        authorizations=Authorization
                         .where(provider: auth.provider,uid: auth.uid)
                         .first
        # должны вернуть в табличку user если мы его нашли
        return authorizations.user if authorizations
        # devise требует, чтобы мы сохраняли почту (email)

      end
    end
  end
end