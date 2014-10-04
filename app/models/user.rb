class User < ActiveRecord::Base
  attr_accessor :firstname, :lastname, :uniteam_id, :email, :id_facebook, :id_city, :preference, :accept_info, :phone, :office, :create_date, :id_type, :last_update_date, :last_login_date, :status

  def initialize(attributes = {})
    self.firstname = attributes[:firstname]
    self.lastname = attributes[:lastname]
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
    if session_hash.nil?
      raise ExpoMuseesWeb::AuthenticationError, "There was a problem signing in"
    else
      session_hash
    end
  end

  def self.add_user(firstname, lastname, email, password)
    session_hash = UniteamAPI::User.add_user(firstname, lastname, email, password)
    if session_hash.nil?
      raise ExpoMuseesWeb::AuthenticationError, "There was a problem signing up"
    else
      session_hash
    end
  end

  def self.get_user(session_hash)
    user = UniteamAPI::User.get_user(session_hash)
    unless (user.nil?)
      new user
    end
  end

  def self.get_username(session_hash)
    user = UniteamAPI::User.get_user(session_hash)
    unless (user.nil?)
      [user[:firstname], user[:lastname]].map(&:capitalize).join(" ")
    end
  end

  def self.destroy(session_hash)
    destroyed = UniteamAPI::User.log_out(session_hash)
    if destroyed.nil?
      raise ExpoMuseesWeb::AuthenticationError, "There was a problem signing out"
    else
      true
    end
  end

  def name
    [firstname, lastname].map(&:capitalize).join(" ")
  end

end
