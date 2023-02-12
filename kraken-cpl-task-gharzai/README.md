# CPL Reader 
CPL Reader is a simple Ruby script that converts CSV Data into a nested hash. 

## How it Works
The script uses the CSV library in Ruby's standard library to read CSV data and convert it into a nested hash structure. The resulting data can be output in either JSON or Ruby's native hash format.

## Usage
To run the script, simply run `ruby cpl_reader.rb` in your terminal. This will output the resulting data to the console.

For easier viewing and further processing, there are two recommended options:

- To output the data to a JSON file, run `ruby cpl_reader.rb > output.json` in your terminal. This will create a new JSON file in the directory with the intended output.
- To highlight the JSON syntax in the output in your terminal, install the `jq` command-line tool and run `ruby cpl_reader.rb | jq`. This will highlight the syntax and make the output easier to read.

## Sources

The solution is based on this [RubyGuides article](https://www.rubyguides.com/2018/10/parse-csv-ruby/) and the [official Ruby documentation](https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html#method-c-foreach) for the CSV library. 
