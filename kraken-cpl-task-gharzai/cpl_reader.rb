require "csv"
require "json"

# Initialise an empty hash to store the data.
cpl = {}

# Use CSV.foreach to process the CSV file row by row,
# while skipping any rows that are marked as "Removed" in column C.
# This solution is optimal as it can process much larger files than if CSV.each was used.
CSV.foreach("cpl.csv", headers: true) { |row|
  next if row[2] == "Removed"

  # Check if nested keys already exist, to avoid overriding existing data.
  if cpl[row[3]].nil?
    cpl[row[3]] = {}
  end

  if cpl[row[3]][row[4]].nil?
    cpl[row[3]][row[4]] = {}
  end

  if cpl[row[3]][row[4]][row[8]].nil?
    cpl[row[3]][row[4]][row[8]] = {
      "firmware_version": row[9],
      "smets_chts_version": row[10],
      "gbcs_version": row[11],
      "image_hash": row[12],
    }
  end
}

# Convert the nested hash to JSON and print it out in easier to read format.
puts JSON.pretty_generate cpl
