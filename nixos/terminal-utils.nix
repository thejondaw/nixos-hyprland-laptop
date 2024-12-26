{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # --- Core Development Tools ---
    git               # Version control system
    lazygit           # Terminal UI for git
    delta             # Better diff tool
    gitleaks          # Secret scanner for git
    git-secrets       # Prevents committing secrets
    git-ignore        # .gitignore generator
    pass-git-helper   # Password manager git credential helper
    
    # --- Shell & Terminal Utilities ---
    just              # Command runner alternative to make
    zellij            # Terminal workspace manager
    procs             # Modern replacement for ps
    fzf               # Fuzzy finder
    zoxide            # Smarter cd command
    tealdeer          # Fast tldr client
    bat               # Cat clone with syntax highlighting
    lsd               # Modern ls alternative
    fd                # Better find
    ripgrep           # Fast grep alternative
    
    # --- System Monitoring & Performance ---
    gping             # Ping with graph
    duf               # Better df
    du-dust           # Better du
    progress          # Show progress for cp, mv, dd
    topgrade          # Update everything
    
    # --- File Processing ---
    jq                # JSON processor
    hexyl             # Hex viewer
    ouch              # Compression/decompression tool
    sd                # Better sed
    pandoc            # Universal document converter
    
    # --- File Management ---
    yazi              # Terminal file manager
    tre-command       # Tree command with git integration
    trash-cli         # Safe rm alternative
    file              # File type identifier
    lsof              # List open files
    
    # --- Network Tools ---
    xh                # Better curl
    rewrk             # HTTP benchmarking tool
    wrk2              # HTTP benchmarking tool
    monolith          # Save web pages as single files
    aria              # Download utility
    
    # --- Text Processing ---
    mdcat             # Markdown renderer
    tokei             # Code statistics
    
    # --- Security & Optimization ---
    upx               # Ultimate Packer for eXecutables
    license-generator # License file generator
    
    # --- Eye Candy & Fun ---
    cmatrix           # Matrix screen effect
    pipes-rs          # Animated pipes
    cbonsai           # Tree
    rsclock           # Terminal clock
    cava              # Audio visualizer
    figlet            # ASCII art text
    viu               # Terminal image viewer
    chafa             # Terminal graphics
    
    # --- GitHub Integration ---
    gh                # GitHub CLI

    # --- Process Management ---
    process-compose   # Process orchestration tool
    noti              # Trigger notifications
  ];
}
