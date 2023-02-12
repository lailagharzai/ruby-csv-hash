require "csv"
require "json"

# aggregated central product list
cpl = {}

# According to https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html#method-c-foreach,
# `CSV.foreach` will process file row by row,
# compared to `CSV.each` which reads entire file into memory
# This solution is optimal as it can process much larger files
CSV.foreach("cpl.csv", headers: true) { |row|
  # skip rows that are marked "Removed" in column C
  next if row[2] == "Removed"

  # process entire row, check if nested keys already exist,
  # so as to not override existing data
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

# print out nested hash as JSON
puts JSON.pretty_generate cpl
