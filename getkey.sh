eval $(op signin my patrickricheal@gmail.com)
op list documents | jq '.[] | select(.overview.title == "SSH private key") | .uuid'
