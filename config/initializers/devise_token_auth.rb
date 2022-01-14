# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  # By default the authorization headers will change after each request. The
  # client is responsible for keeping track of the changing tokens. Change
  # this to false to prevent the Authorization header from changing after
  # each request.
  ## ======= 👇 ここからコメントを外し、trueからfalseに変更する =======
  config.change_headers_on_each_request = false
  ## ====== 👆 ここまでコメントを外し、trueからfalseに変更する =======

  # ...省略

  # By default, users will need to re-authenticate after 2 weeks. This setting
  # determines how long tokens will remain valid after they are issued.
  ## ======= 👇 ここからコメントを外す =======
  config.token_lifespan = 2.weeks
  ## ====== 👆 ここまでコメントを外す =======

  # ...省略

  # Makes it possible to change the headers names
  ## ======= 👇 ここからコメントを外す =======
  config.headers_names = {:'access-token' => 'access-token',
                         :'client' => 'client',
                         :'expiry' => 'expiry',
                         :'uid' => 'uid',
                         :'token-type' => 'token-type' }
  ## ====== 👆 ここまでコメントを外す =======

end
