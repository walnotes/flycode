module ProfilesHelper

  # Take the user added value from the form and encode it with the domaain and username
  def self.encode(profile)
    # case profile
    #   when profile.twitter
    #     if !profile.twitter.nil?
    #       profile.twitter="https://twitter.com/" + profile.twitter
    #     end
    #   when profile.instagram
    #     if !profile.instagram.nil?
    #       profile.instagram="https://instagram.com/" + profile.instagram
    #     end
    #   when profile.facebook
    #     if !profile.facebook.nil?
    #       profile.facebook="https://facebook.com/" + profile.facebook
    #     end
    #   when profile.linkedin
    #     if !profile.linkedin.nil?
    #       profile.linkedin="https://linkedin.com/" + profile.linkedin
    #     end
    #   else
    # end
    profile  
  end

  # Take the value stored in the database and decode the domaain and username
  def decode(profile)
    # case profile
    #   when profile.twitter
    #     if profile.twitter =~ /.*twitter.com\/(.*)$/
    #       profile.twitter = $1
    #     end
    #   when profile.instagram
    #     if profile.instagram =~ /.*instagram.com\/(.*)$/
    #       profile.instagram = $1
    #     end
    #   when profile.facebook
    #     if profile.facebook =~ /.*facebook.com\/(.*)$/
    #       profile.facebook = $1
    #     end
    #   when profile.linkedin
    #     if profile.linkedin =~ /.*linkedin.com\/(.*)$/
    #       profile.linkedin = $1
    #     end
    #   else
    #   end
    profile
  end
    
end