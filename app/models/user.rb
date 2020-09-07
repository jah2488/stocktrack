class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
    (?=.*[[:^alnum:]]) # Must contain a symbol
  /x

  validates :password, 
    allow_nil: true, 
    length: { in: Devise.password_length }, 
    # format: { with: PASSWORD_FORMAT }, 
    confirmation: true, 
    on: [:create, :update]

  validates :email, 
    format: { with: Devise.email_regexp }


  def self.from_omniauth(access_token)
    data = access_token.info
    where(email: data['email']).first_or_initialize do |user|
      # user.name = data['name']
      user.password = Devise.friendly_token[0,20]

      # user.skip_confirmation!    // Enable this when devise's :confirmable is re-enabled
      user.save!
    end
  end
end
