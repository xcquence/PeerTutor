module ApplicationCable
  class Connection < ActionCable::Connection::Base       #gets defined when a new connection is made

    identified_by :current_user             #devise method

    def connect
      self.current_user = find_verified_user
    end



    private

    def find_verified_user                  # this checks whether a user is authenticated with devise
      if verified_user = env['warden'].user
        verified_user
      else
        reject_unauthorized_connection      #method is supplied by Action Cable
      end
    end

  end
end
