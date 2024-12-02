library(jsonlite)
library(digest)

# Function to create a JSON file with the hash of an R data file
create_hash_json <- function(file_path, json_path) {
  if (!file.exists(file_path)) {
    stop("Error: The specified file does not exist: ", file_path)
  }

  # Calculate the hash
  file_hash <- digest(file_path, algo = "md5", file = TRUE)

  # Create a list with file metadata
  metadata <- list(
    file_name = basename(file_path),
    hash_algo = "md5",
    hash_value = file_hash
  )

  # Write metadata to a JSON file
  write_json(metadata, json_path, pretty = TRUE)
  message("JSON file created: ", json_path)
}

# Function to verify the hash of an R data file from a JSON file
verify_hash_from_json <- function(file_path, json_path) {
  if (!file.exists(json_path)) {
    stop("Error: The JSON file does not exist: ", json_path)
  }

  # Read the JSON metadata
  metadata <- fromJSON(json_path)

  # Calculate the hash of the file
  file_hash <- digest(file_path, algo = "md5", file = TRUE)

  # Compare hashes
  if (file_hash == metadata$hash_value) {
    message("File hash verification succeeded.")
    return(TRUE)
  } else {
    message("File hash verification failed. Check if the ", file_path, " has unintended changes.")
    message("If a new version of the data has been created, the file ", json_path, " needs to be updated manually")
    return(FALSE)
  }
}

# Reusable function for handling hash files
handle_hash_file <- function(file_path, json_path) {
  if (file.exists(json_path)) {
    message("A hash file already exists at ", json_path)
    verify_hash_from_json(file_path, json_path)
  } else {
    message("No hash file was found, a new one will be created.")
    create_hash_json(file_path, json_path)
  }
}

