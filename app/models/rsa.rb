class RSA < ActiveRecord::Base
  require 'openssl'

  mount_uploader :file, FileUploader



  def generate_keys
    new_key = OpenSSL::PKey::RSA.generate( 2048 )
    new_public = new_key.public_key
    output_public = File.new("./new_public.pem", "w")
    output_public.puts new_public
    output_public.close

    new_private = new_key.to_pem
    output_private = File.new("./new_private.pem", "w")
    output_private.puts new_private
    output_private.close
  end

  def encrypt_file(ofile)
    public_key = OpenSSL::PKey::RSA.new(File.read("./new_public.pem"))
    @save = File.open("cypher", 'w')
    s = File.open(ofile, 'rb') { |f| f.read }
    @save.write(public_key.public_encrypt( s ).force_encoding('UTF-8'))
    @save.close
  end

  def decrypt_file(ofile)
    private_key = OpenSSL::PKey::RSA.new(File.read("./new_private.pem"))
    @save = File.open("original", 'w')
    s = File.open(ofile, 'rb') { |f| f.read }
    @save.write(private_key.private_decrypt( s ).force_encoding('UTF-8'))
    @save.close
  end



end
