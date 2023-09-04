class FileUploader < Shrine
  plugin :determine_mime_type
end
