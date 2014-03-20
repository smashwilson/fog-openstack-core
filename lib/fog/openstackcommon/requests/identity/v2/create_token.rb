module Fog
  module Identity
    module V2
      class OpenStackCommon
        class Real

          def create_token(username, password, tenant_name=nil)
            data = {
              'auth' => {
                'passwordCredentials' => {
                  'username' => username,
                  'password' => password
                },
                'tenantName' => tenant_name
              }
            }

            request(
              :method   => 'POST',
              :expects  => [200, 202],
              :path     => '/tokens',
              :body     => MultiJson.encode(data)
            )
          end

        end # Real

        class Mock
        end
      end # OpenStackCommon
    end # V2
  end # Identity
end # Fog
