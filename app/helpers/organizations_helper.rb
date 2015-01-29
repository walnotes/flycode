module OrganizationsHelper

  # Take the user added value from the form and encode it with the domaain and username
  def encode(organization)
    case organization
      when organization.twitter
        if !organization.twitter.nil?
          organization.twitter="https://twitter.com/" + organization.twitter
        end
      when organization.instagram
        if !organization.instagram.nil?
          organization.instagram="https://instagram.com/" + organization.instagram
        end
      when organization.facebook
        if !organization.facebook.nil?
          organization.facebook="https://facebook.com/" + organization.facebook
        end
      when organization.linkedin
        if !organization.linkedin.nil?
          organization.linkedin="https://linkedin.com/" + organization.linkedin
        end
      else
    end
    organization  
  end

  # Take the value stored in the database and decode the domaain and username
  def decode(organization)
    case organization
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
      when organization.linkedin
        if organization.linkedin =~ /.*linkedin.com\/(.*)$/
          organization.linkedin = $1
        end
      else
      end
    organization
  end
    
end