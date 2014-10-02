class User < ActiveRecord::Base
  attr_accessor :firstname, :lastname, :uniteam_id, :email, :id_facebook, :id_city, :preference, :accept_info, :phone, :office, :create_date, :id_type, :last_update_date, :last_login_date, :status

  def initialize(attributes)
    self.firstname = attributes[:firstname]
    self.lastname = attributes[:lastname],
    self.uniteam_id = attributes[:id],
    self.email = attributes[:email],
    self.id_facebook = attributes[:id_facebook],
    self.id_city = attributes[:id_city],
    self.preference = attributes[:preference],
    self.accept_info = attributes[:accept_info],
    self.phone = attributes[:phone],
    self.office = attributes[:office],
    self.create_date = attributes[:create_date],
    self.id_type = attributes[:idType],
    self.last_update_date = attributes[:last_update_date],
    self.last_login_date = attributes[:last_login_date],
    self.status = attributes[:status]
  end

  def self.authenticate(email, password)
    session_hash = UniteamAPI::User.authenticate(email, password)
    if session_hash
      session_hash
    else
      nil
    end
  end

  def self.get_user(session_hash)
    user = UniteamAPI::User.get_user(session_hash)
    new user
  end
end
