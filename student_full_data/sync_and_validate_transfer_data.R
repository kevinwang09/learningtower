suppressPackageStartupMessages({
  library(digest)
  library(jsonlite)
  library(dplyr)
})

transfer_dir <- "/Users/kevinwang/projects/learningtower_masonry/Data/Output/Transfer"
manifest_file <- file.path(transfer_dir, "checksums.json")
package_root <- getwd()

if (!file.exists(manifest_file)) {
  stop("Manifest file not found: ", manifest_file)
}

cat("=== Data Sync & Integrity Verification Pipeline ===\n")
cat("Reading manifest from:", manifest_file, "\n")

manifest <- jsonlite::fromJSON(manifest_file)
cat("Manifest Version:", manifest$version, "| Total Files:", manifest$total_files, "| Generated:", manifest$generated_at, "\n\n")

results <- list()
all_passed <- TRUE

for (src_rel in names(manifest$files)) {
  meta <- manifest$files[[src_rel]]
  src_full <- file.path(transfer_dir, src_rel)
  dest_full <- file.path(package_root, meta$destination_relative)

  if (!file.exists(src_full)) {
    cat(sprintf("❌ MISSING SOURCE: %s\n", src_full))
    all_passed <- FALSE
    next
  }

  # Ensure destination directory exists
  dest_dir <- dirname(dest_full)
  if (!dir.exists(dest_dir)) {
    dir.create(dest_dir, recursive = TRUE)
  }

  # Perform file copy
  file.copy(src_full, dest_full, overwrite = TRUE)

  # Recalculate local MD5 checksum
  local_md5 <- digest::digest(dest_full, algo = "md5", file = TRUE)
  local_size <- file.info(dest_full)$size

  is_md5_match <- (local_md5 == meta$md5)
  is_size_match <- (local_size == meta$size_bytes)

  if (is_md5_match && is_size_match) {
    status_str <- "PASS"
  } else {
    status_str <- "FAIL"
    all_passed <- FALSE
  }

  cat(sprintf("[%s] %s -> %s (MD5: %s)\n",
              status_str, src_rel, meta$destination_relative, local_md5))
}

cat("\n===================================================\n")
if (all_passed) {
  cat("✔ SUCCESS: All files copied and verified successfully against MD5 manifest.\n")
} else {
  stop("❌ FAILURE: Data transfer verification failed! Checksum mismatch detected.")
}
