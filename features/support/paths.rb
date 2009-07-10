module NavigationHelpers
  # Maps a static name to a static route.
  #
  # This method is *not* designed to map from a dynamic name to a 
  # dynamic route like <tt>post_comments_path(post)</tt>. For dynamic 
  # routes like this you should *not* rely on #path_to, but write 
  # your own step definitions instead. Example:
  #
  #   Given /I am on the comments page for the "(.+)" post/ |name|
  #     post = Post.find_by_name(name)
  #     visit post_comments_path(post)
  #   end
  #
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      root_path
    when /the signup page/
      signup_path
    when /the upgrade page/
      upgrade_path
    when /the credentials page/
      credentials_path
    when /the account page/
      account_path
    when /the (login|sign in) page/
      login_path
    when /my bedroom page/
      bedroom_path(@current_user.person)
    when /the bedroom page "([^\"]*)"/
      bedroom_path($1)
    when /the scene named "([^\"]*)"/
      scene = Scene.find_by_title($1)
      scene_path(scene)
    when /the DHD signup page for "([^\"]*)"/
      optionid = MembershipPackage.find_by_name($1).nats_product_id
      username = @current_user.pending_upgrade.username
      email = CGI.escape(@current_user.email)
      password = @current_user.pending_upgrade.password

      # build it by hand so we're actually checking everything
      normalize_uri(
        "http://enterbedrooms.naughtyamerica.com/signup/signup.php?" +
        "cascade=credit" +
        "&amp;nats=MTAwNDo0OjQx" +
        "&amp;nextra%5BDHD%5D%5BDisableUser_Pass%5D=1" +
        "&amp;nextra%5BDHD%5D%5Bsub_username%5D=#{username}" +
        "&amp;nextra%5BDHD%5D%5BEmail_IsUsername%5D=0" +
        "&amp;nextra%5BDHD%5D%5BWebSiteName%5D=Bedrooms" +
        "&amp;nextra%5BDHD%5D%5BWebsiteHomepage%5D=http%3A%2F%2Fbedrooms.naughtyamerica.com%2F" +
        "&amp;signup%5Bemail%5D=#{email}" +
        "&amp;signup%5Boptionid%5D=#{optionid}" +
        "&amp;signup%5Bpassword%5D=#{password}" +
        "&amp;site=41" +
        "&amp;step=2"
      )
    when /the "keycard" promotion page/
      keycard_path
    when /the candidate signup page/
      signup_candidate_path
    when /the new candidate page/
      new_candidate_path
    when /the candidate page for "([^\"]*)"/
      "/candidates/#{$1}"
    when /the naughty president update candidate page for "([^\"]*)"/
      normalize_uri("http://www.naughtypresident.com/update/#{$1}")
    when /the naughty president candidate page for "([^\"]*)"/
      normalize_uri("http://www.naughtypresident.com/#{$1}")

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
    end
  end

  def normalize_uri(uri)
    normalized_uri =
      case uri
      when URI then uri
      else
        uri = 'http://' + uri unless uri =~ %r|^https?://|
        URI.parse(uri)
      end
    normalized_uri.query = sort_query_params(normalized_uri.query)
    normalized_uri.normalize
  end

  def sort_query_params(query)
    if query.nil? || query.empty?
      nil
    else
      query.split('&').sort.join('&')
    end
  end
end

World(NavigationHelpers)
