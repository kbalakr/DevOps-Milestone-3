job "server_js" {
  datacenters = [ "dc1" ]
  group "default" {
    task "server" {
      driver = "raw_exec"
      config {
        command = "bash"
        args = ["/home/ubuntu/script.sh"]
      }
    }
  }
}