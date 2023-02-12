require "csv"
require "json"

# aggregated central product list
cpl = {}

# read the csv file
csv = CSV.read("cpl.csv")
# exclude headers in first row
csv.shift

#
# according to ruby documentation, when working with big files, this is faster and saves memory
csv.each { |row|
  if row[2] == "Removed"
    next
  end
  # next if row[2] == "Removed"

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

# puts cpl.to_json
puts count
