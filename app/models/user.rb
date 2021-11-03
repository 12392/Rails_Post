class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :addUser
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts
         has_many :comments

  def addUser
    dc = 'us5'
    unique_id = "e86db98f63"
    url = "https://#{dc}.api.mailchimp.com/3.0/lists/#{unique_id}/members"
    api_key = "5f459ef90384d0f3413b2c2b1b67e89d-us5"
      
          user_details = {
            email_address: self.email,
            status: "subscribed"
          }
          conn = Faraday.new(
            url: url,
            headers: {'Content-Type' => 'application/json', 'Authorization': "Bearer #{api_key}"}
          )
          response = conn.post() do |req|
            req.body = user_details.to_json
          end
      
          response_body = JSON.parse(response.body)
      
          # Check if the subscription is successful
          if response.status == 200
            # render json: {
            #   status: response.status,
            #   message: "#{user_details[:email_address]} has been added to the mailing list"
            # }
          else
            # render json: {
            #   status: response.status,
            #   message: response_body["detail"]
            # }
          end
      end
end
