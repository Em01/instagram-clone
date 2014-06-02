class Post < ActiveRecord::Base
  has_attached_file :picture, 
  styles: { medium: '400x400>' }, 
  storage: :s3,
  s3_credentials: {
    bucket: 'Inster_Makers',
    access_key_id: Rails.application.secrets.s3_access_key,
    secret_access_key: Rails.application.secrets.s3_secret_key
  }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  belongs_to :user

  def tag_names
    ''
  end

  def tag_names=(tag_names)
  end
end
