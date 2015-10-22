require "refile/s3"

if Rails.env.production?
  aws = {
    access_key_id: ENV["access_key_id"],
    secret_acccess_key: ENV["secret_access_key"],
    region: "US Standard",
    bucket: " pictures-of-rooms-from-garrett",
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws)
  Refile.store = Refile::S3.new(prefix: "store", **aws)
else
  backend = Refile::Backend::FileSystem.new("tmp")
  Refile.cache = backend
  Refile.store = backend
end
