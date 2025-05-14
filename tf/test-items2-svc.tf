resource "konnect_gateway_service" "test_items2" {
  enabled = true
  name = "test-items2"
  connect_timeout = 60000
  host = "54.81.105.119"
  port = 80
  protocol = "http"
  read_timeout = 60000
  retries = 5
  write_timeout = 60000

  control_plane_id = var.control_plane_id
}

resource "konnect_gateway_route" "get_item2" {
  name = "get-item2"
  https_redirect_status_code = 426
  methods = ["GET"]
  path_handling = "v0"
  paths = ["/get_item"]
  preserve_host = false
  protocols = ["http", "https"]
  regex_priority = 0
  request_buffering = true
  response_buffering = true
  strip_path = false

  service = {
    id = konnect_gateway_service.test_items2.id
  }

  control_plane_id = var.control_plane_id
}