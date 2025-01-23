{pkgs, ...}:
{
  home.packages = with pkgs; [
    gh
  ];
  programs.git = {
    enable = true;
    userEmail = "phernandezm07@gmail.com";
    userName = "pablohernandezm";
  };
}
