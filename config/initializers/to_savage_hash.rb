class String
   def to_savage_hash
     hash = {}
     self.split("\377").each do |line|
       key, value = line.split("\376")
       hash[key] = value
      end
      hash
   end
end
