{
  config,
  pkgs,
  lib,
  ...
}: {
  # Ollama сервис
  services.ollama = {
    enable = true;
    
    # Вместо acceleration теперь используем package
    # Выбери нужный вариант:
    package = pkgs.ollama-cuda;  # Для NVIDIA (у тебя RTX 3060)
    # package = pkgs.ollama-rocm;  # Для AMD
    # package = pkgs.ollama;       # CPU only (без GPU)
    
    host = "127.0.0.1";
    port = 11434;
    
    # Переменные окружения
    environmentVariables = {
      OLLAMA_MODELS = "/var/lib/ollama/models";
      OLLAMA_HOST = "127.0.0.1:11434";
    };
  };
  
  # Добавляем пользователя в группу ollama
  users.users.nixos.extraGroups = [ "ollama" ];
  
  # Пакеты
  environment.systemPackages = with pkgs; [
    ollama  # CLI для управления моделями
  ];
}
