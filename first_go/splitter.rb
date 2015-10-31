# https://drive.google.com/file/d/FILE_ID/edit?usp=sharing
#
#
# https://drive.google.com/uc?export=download&id=0B4NGnnJZKaSTRDlTX1lPOUtZOVU


# function to convert google drive share file link into image
def link_to_google_image(url)
  string = url
  string["https://drive.google.com/open?id="] = ""
  string = "https://drive.google.com/uc?export=download&id=" + string
  puts string
end

link_to_google_image("https://drive.google.com/open?id=0B4NGnnJZKaSTRDlTX1lPOUtZOVU")
