module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    #connect method which is called after a connection
    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      if (current_user = env['warden'].user)
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end



=begin
How to get a user? When you log in, everything is stored within a session and we have access to it from a channel.
Devise uses warden – it assigns to env[‘warden’] variable all information about the session and authentication.
By calling a env[‘warden’].user, you can get a current user! If there is no current user in the env[‘warden’],
we throw an error and reject the connection, because someone is not authorized to connect with the server
without being logged in.
=end
