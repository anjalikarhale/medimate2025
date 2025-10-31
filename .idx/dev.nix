{ pkgs, ... }: {
  # The channel determines which package versions are available.
  channel = "stable-24.05"; # or "unstable"

  # A list of packages to install from the specified channel.
  packages = [
    pkgs.nodejs_20
  ];

  # A set of environment variables to define within the workspace.
  env = {
    API_KEY = "your-secret-key";
  };

  # A list of VS Code extensions to install from the Open VSX Registry.
  idx = {
    extensions = [
      "vscodevim.vim"
      "golang.go"
    ];

    # Workspace lifecycle hooks.
    workspace = {
      # Runs when a workspace is first created.
      onCreate = {
        npm-install = "npm install";
      };
      # Runs every time the workspace is (re)started.
      onStart = {
        start-server = "npm run dev";
      };
    };
    
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["npm" "run" "dev" "--" "--port" "$PORT"];
          manager = "web";
        };
      };
    };
  };
}
