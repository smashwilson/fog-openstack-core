module Fog
  module OpenStackCore
    class IdentityV2
      class Real

        def get_user_by_id(user_id)
          admin_request(
            :method   => 'GET',
            :expects  => [200, 203],
            :path     => "/v2.0/users/#{user_id}",
          )
        end

      end

      class Mock
      end
    end # IdentityV2
  end # OpenStackCore
end # Fog
