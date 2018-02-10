# fsdoor
simple shell script to determine the door state of the Fachschaft Informatik (h_da)

## Usage

- Option 1 (with path)
  
  to run the script by path
  
  `/path/to/fsdoor.sh` 
  
- Option 2 (linked, without path) 
  
  Create link: 
  
  `ln /path/to/fsdoor.sh /usr/local/bin/fsdoor`
  
  Now you can run it from anywhere with `fsdoor`
  
## Dependencies
- [jq](https://stedolan.github.io/jq/) (command-line JSON processor)
- curl
- sed
