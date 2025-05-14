resource "konnect_gateway_service" "test_items" {
  enabled = true
  name = "test-items"
  connect_timeout = 60000
  host = var.service_host
  port = 80
  protocol = "http"
  read_timeout = 60000
  retries = 5
  write_timeout = 60000

  control_plane_id = var.control_plane_id
}

resource "konnect_gateway_route" "add_item" {
  name = "add-item"
  https_redirect_status_code = 426
  methods = ["POST"]
  path_handling = "v0"
  paths = ["/add_item"]
  preserve_host = false
  protocols = ["http", "https"]
  regex_priority = 0
  request_buffering = true
  response_buffering = true
  strip_path = false

  service = {
    id = konnect_gateway_service.test_items.id
  }

  control_plane_id = var.control_plane_id
}

resource "konnect_gateway_route" "get_item" {
  name = "get-item"
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
    id = konnect_gateway_service.test_items.id
  }

  control_plane_id = var.control_plane_id
}

