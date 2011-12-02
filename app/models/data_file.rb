class DataFile < ActiveRecord::Base
#  def self.save(upload)
#    name =  upload['datafile'].original_filename
#    directory = "public/data"
    # create the file path
#    path = File.join(directory, name)
    # write the file
#    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
#    File.open(path).readlines.each do |linha|
#      nome, telefone, email = linha.split(/#/)
#      Temp.create(:nome=>nome, :telefone=> telefone, :email=> email)
#    end

#  end
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    File.open(path).readlines.each do |linha|
      id, nome = linha.split(/#/)
      Temp.create(:id_unidades=>id, :nome=> nome)
    end

  end

end
