class RsasController < ApplicationController

  def new
    if params
      @alg = RSA.new
    end
  end

  def create
    if params

      @encrypted_object = RSA.create(params.require(:rsa).permit(:file))
      if File.extname(@encrypted_object.file.current_path) != ""
        @encrypted_object.generate_keys
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
    object.encrypt_file(object.file.current_path)
  end
  #
  def decrypt(object)
    object.decrypt_file(object.file.current_path)
  end

 
end
