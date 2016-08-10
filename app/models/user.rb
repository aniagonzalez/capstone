class User < ActiveRecord::Base

  def self.find_or_create_from_omniauth(auth_hash)
    # Find or create a user
    #user = User.where(uid: auth_hash["uid"]).where(provider: auth_hash["provider"]).first
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])
    # user = //something else here//
    if !user.nil?
    #   return user that was found
      return user
    else
    #   no user found, do something here
      user = User.new
      user.uid = auth_hash["uid"]
      user.provider = auth_hash["provider"]
      user.first_name = auth_hash["info"]["first_name"]
      user.image = auth_hash["info"]["image"]
      user.url = auth_hash["info"]["urls"][user.provider.capitalize] if auth_hash["info"]["urls"]

      if user.save
        return user
      else
        return nil
      end
    end
  end
end
