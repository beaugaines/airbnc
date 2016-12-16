class AddAttachmentFileToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :images, :file
  end
end

@image = Image.new(file: File.new)
@image.save
@image.avatar.url #=> 'http://www.powerlet.com/img/image_coming_soon.jpg'

@user.reload
@user.file.url #=> #{attachment_name}_processing