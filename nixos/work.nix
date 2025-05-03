{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    slack
    zoom-us
    openvpn

    aws-sam-cli
    awscli2
    cargo-lambda
    gnumake
    cmake
    firebase-tools

    trivy
    terraform
    tflint
    tfsec
    ansible
    kubectx
    kubernetes-helm
    kubectl
    minikube
    powershell
  ];
}
