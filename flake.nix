{
  description = "Seven Tentacles - Teaching Compiler Architecture Ages 8-18";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # ReScript / JavaScript
            nodejs_20
            nodePackages.npm

            # Build tools
            just
            watchexec

            # Documentation
            asciidoctor
            ruby  # For AsciiDoctor extensions

            # Testing
            nodePackages.playwright

            # Development
            git
            jq
            ripgrep

            # Web development
            nodePackages.http-server
            nodePackages.live-server
          ];

          shellHook = ''
            echo "🐙 Seven Tentacles Development Environment"
            echo ""
            echo "Available commands:"
            echo "  just build    - Build all components"
            echo "  just dev      - Start development server"
            echo "  just test     - Run tests"
            echo "  just demo     - Open the reveal demo"
            echo "  just docs     - Build documentation"
            echo ""
            echo "Directory structure:"
            echo "  curriculum/   - Lesson content (AsciiDoc)"
            echo "  agents/       - ReScript agent definitions"
            echo "  languages/    - Language implementations"
            echo "  tools/        - Reveal system, lesson player"
            echo ""

            # Ensure node_modules exists
            if [ ! -d "node_modules" ]; then
              echo "Installing npm dependencies..."
              npm install 2>/dev/null || true
            fi
          '';
        };

        # Package for distribution
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "seven-tentacles";
          version = "0.1.0";
          src = ./.;

          buildInputs = with pkgs; [
            nodejs_20
            asciidoctor
          ];

          buildPhase = ''
            # Build documentation
            mkdir -p docs-html
            asciidoctor -D docs-html *.adoc docs/*.adoc || true

            # Build curriculum HTML
            mkdir -p curriculum-html
            find curriculum -name "*.adoc" -exec sh -c '
              dir=$(dirname "$1" | sed "s|curriculum|curriculum-html|")
              mkdir -p "$dir"
              asciidoctor -D "$dir" "$1" || true
            ' _ {} \;
          '';

          installPhase = ''
            mkdir -p $out
            cp -r . $out/
          '';
        };
      }
    );
}
