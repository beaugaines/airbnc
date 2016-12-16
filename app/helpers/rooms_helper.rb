module RoomsHelper
    
    def count_imgs(room)
        Image.where(room_id: room.id).length
    end
    
    def file_url(x)
        @room.images[x].file.url(:medium)
    end
    
    def file_name(x)
        @room.images[x].file.instance.file_file_name
    end
    
end
