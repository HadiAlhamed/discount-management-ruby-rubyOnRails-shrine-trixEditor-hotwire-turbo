class ImageUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type

  Attacher.validate do
    validate_max_size 5*1024*1024, message: "is too large (max 5MB)"
    validate_mime_type %w[image/jpeg image/png image/webp], message: "must be JPEG, PNG, or WEBP"
  end
end
