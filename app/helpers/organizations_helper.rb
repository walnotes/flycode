module OrganizationsHelper

  # Take the user added value from the form and encode it with the domaain and username
  def encode(organization)
    case
      when !organization.twitter.nil?
        organization.twitter="https://twitter.com/" + organization.twitter
      when !organization.instagram.nil?
        organization.instagram="https://instagram.com/" + organization.instagram
      when !organization.facebook.nil?
        organization.facebook="https://facebook.com/" + organization.facebook
      else
    end
    organization  
  end

  # Take the value stored in the database and decode the domaain and username
  def decode(organization)
    case
      when organization.twitter
        if organization.twitter =~ /.*twitter.com\/(.*)$/
          organization.twitter = $1
        end
      when organization.instagram
        if organization.instagram =~ /.*instagram.com\/(.*)$/
          organization.instagram = $1
        end
      when organization.facebook
        if organization.facebook =~ /.*facebook.com\/(.*)$/
          organization.facebook = $1
        end
      else
      end
    organization
  end
    
end