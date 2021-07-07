provider "google" {
    credentials = "${file("cred.json")}"
    project = "home-258016"
    region = "us-east1"
    zone = "us-east1-b"
}