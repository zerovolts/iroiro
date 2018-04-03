user = User.create(login: "zerovolts")

Array.new(200).each_with_index do |name, index|
  Pallette.create_from_array(
    user,
    "Random " + index.to_s,
    Array.new(5).map {|| Color.random_data}
  )
end
