class Rc5sController < ApplicationController

  def new
    if params
      @alg = Rc5.new
    end
  end

  def create
    if params
      @encrypted_object = Rc5.create(params.require(:rc5).permit(:key, :file))
      if File.extname(@encrypted_object.file.current_path) != ""
        encrypt(@encrypted_object)
      else
        decrypt(@encrypted_object)
      end
      render :new
    else
      render :new
    end
  end

  def encrypt(object)
    object.algo_starter
    object.encrypt_file(object.file.current_path)
  end

  def decrypt(object)
    object.algo_starter
    object.decrypt_file(object.file.current_path)
  end

 
end
