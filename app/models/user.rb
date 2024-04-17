class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def send_devise_notification(notification, *args)
    SendConfirmationEmailWorker.perform_async(id) if notification == :confirmation_instructions
  end
end
