test_that("Transferred package datasets match expected MD5 checksum manifest", {
  manifest_file <- "/Users/kevinwang/projects/learningtower_masonry/Data/Output/Transfer/checksums.json"
  if (!file.exists(manifest_file)) {
    skip("Checksum manifest not found; skipping package data integrity test.")
  }

  manifest <- jsonlite::fromJSON(manifest_file)
  package_root <- system.file(package = "learningtower")
  if (!nzchar(package_root)) {
    package_root <- getwd()
  }

  for (src_rel in names(manifest$files)) {
    meta <- manifest$files[[src_rel]]
    dest_full <- file.path(package_root, meta$destination_relative)
    
    if (file.exists(dest_full)) {
      computed_md5 <- digest::digest(dest_full, algo = "md5", file = TRUE)
      expect_equal(computed_md5, meta$md5,
                   info = paste("MD5 checksum mismatch for", meta$destination_relative))
    }
  }
})
