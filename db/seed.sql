-- Brewnite seed data

-- Categories
INSERT INTO categories (name, display_order) VALUES
  ('Browsers', 1),
  ('Developer Tools', 2),
  ('Editors & IDEs', 3),
  ('Terminals', 4),
  ('Languages & Runtimes', 5),
  ('Package Managers & Build Tools', 6),
  ('Version Control', 7),
  ('Databases', 8),
  ('Database Tools', 9),
  ('CLI Utilities', 10),
  ('Shell & Prompt', 11),
  ('Networking & Security', 12),
  ('Containers & Virtualization', 13),
  ('Cloud & Infrastructure', 14),
  ('API & HTTP Tools', 15),
  ('Communication', 16),
  ('Productivity', 17),
  ('Password Managers', 18),
  ('Media Players', 19),
  ('Image & Video Tools', 20),
  ('Design & Creative', 21),
  ('File Management', 22),
  ('System Utilities', 23),
  ('Fonts', 24),
  ('Gaming', 25),
  ('Writing & Notes', 26),
  ('Email', 27),
  ('DevOps & Monitoring', 28),
  ('AI & Machine Learning', 29),
  ('Science & Data', 30)
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Browsers
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('google-chrome', 'Google Chrome web browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('firefox', 'Mozilla Firefox web browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('arc', 'Arc browser from The Browser Company', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('brave-browser', 'Privacy-focused Brave browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('microsoft-edge', 'Microsoft Edge browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('opera', 'Opera web browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('vivaldi', 'Vivaldi web browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('tor-browser', 'Tor anonymous web browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('chromium', 'Open-source Chromium browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('orion', 'Orion lightweight WebKit browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('min', 'Minimal web browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('sigmaos', 'SigmaOS productivity browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('waterfox', 'Waterfox privacy browser', true, (SELECT id FROM categories WHERE name = 'Browsers')),
  ('librewolf', 'LibreWolf privacy-focused Firefox fork', true, (SELECT id FROM categories WHERE name = 'Browsers'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Developer Tools
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('postman', 'API development platform', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('insomnia', 'REST and GraphQL client', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('httpie', 'User-friendly HTTP client', false, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('charles', 'HTTP proxy and monitor', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('proxyman', 'Modern HTTP debugging proxy', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('dash', 'API documentation browser', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('paw', 'HTTP client for API testing', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('sourcetree', 'Git GUI client by Atlassian', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('fork', 'Fast and friendly Git client', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('gitkraken', 'Git GUI client', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('tower', 'Git client for Mac', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('kaleidoscope', 'File comparison tool', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('devtoys', 'Developer utilities', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('regex-tester', 'Regular expression tester', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('sf-symbols', 'Apple SF Symbols browser', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('swiftformat-for-xcode', 'Swift code formatter for Xcode', true, (SELECT id FROM categories WHERE name = 'Developer Tools')),
  ('xcodes', 'Xcode version manager GUI', true, (SELECT id FROM categories WHERE name = 'Developer Tools'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Editors & IDEs
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('visual-studio-code', 'VS Code editor', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('cursor', 'AI-first code editor', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('zed', 'High-performance code editor', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('sublime-text', 'Sublime Text editor', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('atom', 'GitHub Atom editor', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('intellij-idea', 'IntelliJ IDEA Java IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('intellij-idea-ce', 'IntelliJ IDEA Community Edition', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('webstorm', 'JetBrains WebStorm IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('pycharm', 'JetBrains PyCharm IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('pycharm-ce', 'PyCharm Community Edition', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('goland', 'JetBrains GoLand IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('rubymine', 'JetBrains RubyMine IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('phpstorm', 'JetBrains PhpStorm IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('clion', 'JetBrains CLion C/C++ IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('rider', 'JetBrains Rider .NET IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('datagrip', 'JetBrains DataGrip database IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('android-studio', 'Android development IDE', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('fleet', 'JetBrains Fleet editor', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('nova', 'Panic Nova editor for macOS', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('bbedit', 'BBEdit text editor', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('coteditor', 'Plain-text editor for macOS', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('neovim', 'Hyperextensible Vim fork', false, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('vim', 'Vi IMproved text editor', false, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('emacs', 'GNU Emacs text editor', false, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('helix', 'Post-modern modal text editor', false, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('micro', 'Modern terminal-based text editor', false, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('nano', 'GNU Nano text editor', false, (SELECT id FROM categories WHERE name = 'Editors & IDEs')),
  ('xcode', 'Apple Xcode IDE (via mas)', true, (SELECT id FROM categories WHERE name = 'Editors & IDEs'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Terminals
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('iterm2', 'Terminal emulator for macOS', true, (SELECT id FROM categories WHERE name = 'Terminals')),
  ('warp', 'Modern Rust-based terminal', true, (SELECT id FROM categories WHERE name = 'Terminals')),
  ('alacritty', 'GPU-accelerated terminal emulator', true, (SELECT id FROM categories WHERE name = 'Terminals')),
  ('kitty', 'GPU-based terminal emulator', true, (SELECT id FROM categories WHERE name = 'Terminals')),
  ('wezterm', 'GPU-accelerated terminal emulator', true, (SELECT id FROM categories WHERE name = 'Terminals')),
  ('hyper', 'Electron-based terminal', true, (SELECT id FROM categories WHERE name = 'Terminals')),
  ('tabby', 'Modern terminal for the modern age', true, (SELECT id FROM categories WHERE name = 'Terminals')),
  ('rio', 'Hardware-accelerated GPU terminal', true, (SELECT id FROM categories WHERE name = 'Terminals')),
  ('ghostty', 'Fast native terminal emulator', true, (SELECT id FROM categories WHERE name = 'Terminals'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Languages & Runtimes
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('node', 'Node.js JavaScript runtime', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('python', 'Python 3 programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('python@3.11', 'Python 3.11', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('python@3.12', 'Python 3.12', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('go', 'Go programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('rust', 'Rust programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('rustup', 'Rust toolchain installer', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('ruby', 'Ruby programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('java', 'OpenJDK Java', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('openjdk', 'OpenJDK development kit', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('openjdk@17', 'OpenJDK 17', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('openjdk@21', 'OpenJDK 21', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('deno', 'Deno JavaScript/TypeScript runtime', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('bun', 'All-in-one JavaScript runtime', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('php', 'PHP programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('lua', 'Lua programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('luajit', 'LuaJIT just-in-time compiler', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('perl', 'Perl programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('r', 'R statistical computing language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('julia', 'Julia programming language', true, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('elixir', 'Elixir programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('erlang', 'Erlang programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('scala', 'Scala programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('kotlin', 'Kotlin programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('swift', 'Swift programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('clojure', 'Clojure programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('haskell-stack', 'Haskell Stack build tool', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('ghc', 'Glasgow Haskell Compiler', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('ocaml', 'OCaml programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('zig', 'Zig programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('nim', 'Nim programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('crystal', 'Crystal programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('v', 'V programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('dart', 'Dart programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('flutter', 'Flutter SDK', true, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('dotnet', '.NET SDK', true, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('mono', 'Mono .NET framework', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('groovy', 'Groovy programming language', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes')),
  ('typescript', 'TypeScript language compiler', false, (SELECT id FROM categories WHERE name = 'Languages & Runtimes'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Package Managers & Build Tools
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('yarn', 'JavaScript package manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('pnpm', 'Fast disk space efficient package manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('maven', 'Apache Maven Java build tool', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('gradle', 'Build automation tool', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('cmake', 'Cross-platform build system', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('make', 'GNU Make build tool', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('autoconf', 'GNU Autoconf', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('automake', 'GNU Automake', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('meson', 'Meson build system', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('ninja', 'Ninja build system', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('bazel', 'Google Bazel build tool', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('sbt', 'Scala Build Tool', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('leiningen', 'Clojure build tool', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('cocoapods', 'CocoaPods dependency manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('carthage', 'Carthage dependency manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('pipx', 'Install Python CLI tools in isolation', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('poetry', 'Python packaging and dependency management', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('uv', 'Fast Python package installer', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('pdm', 'Modern Python package manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('composer', 'PHP dependency manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('bundler', 'Ruby dependency manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('pkg-config', 'Manage compile and link flags for libraries', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('nvm', 'Node Version Manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('fnm', 'Fast Node Manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('mise', 'Dev tool version manager (formerly rtx)', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('asdf', 'Extendable version manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('pyenv', 'Python version management', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('rbenv', 'Ruby version manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('goenv', 'Go version manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('jenv', 'Java version manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools')),
  ('swiftenv', 'Swift version manager', false, (SELECT id FROM categories WHERE name = 'Package Managers & Build Tools'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Version Control
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('git', 'Distributed version control system', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('gh', 'GitHub CLI', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('git-lfs', 'Git Large File Storage', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('git-flow', 'Git branching model extensions', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('git-delta', 'Syntax-highlighting pager for git', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('lazygit', 'Terminal UI for git', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('tig', 'Text-mode interface for git', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('hub', 'GitHub CLI tool (legacy)', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('glab', 'GitLab CLI', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('mercurial', 'Mercurial version control', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('subversion', 'Apache Subversion', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('pre-commit', 'Git pre-commit hook framework', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('git-secret', 'Store secrets inside git repos', false, (SELECT id FROM categories WHERE name = 'Version Control')),
  ('git-crypt', 'Transparent file encryption in git', false, (SELECT id FROM categories WHERE name = 'Version Control'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Databases
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('postgresql@16', 'PostgreSQL 16 relational database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('postgresql@15', 'PostgreSQL 15 relational database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('postgresql@14', 'PostgreSQL 14 relational database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('mysql', 'MySQL relational database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('mysql@8.0', 'MySQL 8.0', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('mariadb', 'MariaDB database server', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('redis', 'In-memory key-value data store', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('sqlite', 'Lightweight embedded SQL database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('mongodb-community', 'MongoDB NoSQL database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('cassandra', 'Apache Cassandra distributed database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('couchdb', 'Apache CouchDB document database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('neo4j', 'Neo4j graph database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('cockroach', 'CockroachDB distributed SQL database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('elasticsearch', 'Elasticsearch search engine', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('meilisearch', 'Lightning-fast search engine', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('typesense', 'Open source search engine', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('influxdb', 'InfluxDB time series database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('memcached', 'Distributed memory caching system', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('etcd', 'Distributed key-value store', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('consul', 'HashiCorp Consul service mesh', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('arangodb', 'ArangoDB multi-model database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('dgraph', 'Dgraph distributed graph database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('duckdb', 'In-process analytical database', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('libpq', 'PostgreSQL client library', false, (SELECT id FROM categories WHERE name = 'Databases')),
  ('pgbouncer', 'PostgreSQL connection pooler', false, (SELECT id FROM categories WHERE name = 'Databases'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Database Tools
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('dbeaver-community', 'Universal database tool', true, (SELECT id FROM categories WHERE name = 'Database Tools')),
  ('tableplus', 'Modern database management GUI', true, (SELECT id FROM categories WHERE name = 'Database Tools')),
  ('sequel-ace', 'MySQL/MariaDB database manager', true, (SELECT id FROM categories WHERE name = 'Database Tools')),
  ('pgadmin4', 'PostgreSQL admin tool', true, (SELECT id FROM categories WHERE name = 'Database Tools')),
  ('mongodb-compass', 'MongoDB GUI', true, (SELECT id FROM categories WHERE name = 'Database Tools')),
  ('redis-insight', 'Redis GUI', true, (SELECT id FROM categories WHERE name = 'Database Tools')),
  ('dbgate', 'Database manager for multiple engines', true, (SELECT id FROM categories WHERE name = 'Database Tools')),
  ('beekeeper-studio', 'SQL editor and database manager', true, (SELECT id FROM categories WHERE name = 'Database Tools')),
  ('postico', 'Modern PostgreSQL client', true, (SELECT id FROM categories WHERE name = 'Database Tools'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- CLI Utilities
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('wget', 'Internet file retriever', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('curl', 'Transfer data with URLs', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('jq', 'Lightweight JSON processor', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('yq', 'YAML/JSON/XML processor', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('ripgrep', 'Fast recursive search tool (rg)', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('fzf', 'Command-line fuzzy finder', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('bat', 'Cat clone with syntax highlighting', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('eza', 'Modern replacement for ls', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('zoxide', 'Smarter cd command', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('tmux', 'Terminal multiplexer', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('htop', 'Interactive process viewer', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('btop', 'Resource monitor (C++ htop alternative)', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('tree', 'Display directory structure as tree', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('tldr', 'Simplified community-driven man pages', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('fd', 'Simple fast alternative to find', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('sd', 'Intuitive find-and-replace (sed alternative)', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('dust', 'More intuitive du (disk usage)', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('duf', 'Disk usage/free utility', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('procs', 'Modern replacement for ps', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('bottom', 'System monitor (btm)', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('hyperfine', 'Command-line benchmarking tool', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('tokei', 'Count lines of code', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('choose', 'Human-friendly cut alternative', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('xh', 'Friendly HTTP request tool', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('glow', 'Render markdown in terminal', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('mdcat', 'Render markdown in terminal', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('watch', 'Execute command periodically', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('entr', 'Run commands when files change', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('pv', 'Pipe viewer for monitoring data flow', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('coreutils', 'GNU core utilities', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('findutils', 'GNU find, xargs, and locate', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('gnu-sed', 'GNU sed stream editor', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('gawk', 'GNU Awk', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('grep', 'GNU grep', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('less', 'GNU less pager', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('rename', 'Perl-powered file rename', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('the_silver_searcher', 'Code searching tool (ag)', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('ranger', 'Terminal file manager', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('lf', 'Terminal file manager (Go)', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('yazi', 'Blazing fast terminal file manager', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('nnn', 'Tiny terminal file manager', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('broot', 'Interactive tree view file manager', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('mc', 'Midnight Commander file manager', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('ncdu', 'NCurses disk usage analyzer', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('parallel', 'GNU Parallel shell tool', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('stow', 'GNU Stow symlink farm manager', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('direnv', 'Directory-specific environment variables', false, (SELECT id FROM categories WHERE name = 'CLI Utilities')),
  ('diff-so-fancy', 'Better looking git diffs', false, (SELECT id FROM categories WHERE name = 'CLI Utilities'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Shell & Prompt
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('zsh', 'Z shell', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('bash', 'Bourne Again SHell', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('fish', 'Friendly interactive shell', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('nushell', 'Modern shell written in Rust', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('starship', 'Cross-shell prompt', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('powerlevel10k', 'Zsh theme', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('zsh-syntax-highlighting', 'Syntax highlighting for Zsh', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('zsh-autosuggestions', 'Fish-like autosuggestions for Zsh', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('zsh-completions', 'Additional Zsh completions', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('sheldon', 'Fast shell plugin manager', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt')),
  ('atuin', 'Magical shell history', false, (SELECT id FROM categories WHERE name = 'Shell & Prompt'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Networking & Security
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('nmap', 'Network scanner', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('wireshark', 'Network protocol analyzer', true, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('mtr', 'Traceroute and ping tool', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('iperf3', 'Network bandwidth measurement', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('ngrep', 'Network grep', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('tcpdump', 'Network packet analyzer', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('openssl', 'TLS/SSL toolkit', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('gnupg', 'GNU Privacy Guard', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('age', 'Simple modern file encryption', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('sops', 'Secrets operations tool', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('vault', 'HashiCorp Vault secrets management', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('ssh-copy-id', 'Install SSH key on remote server', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('mosh', 'Mobile shell (remote terminal)', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('tailscale', 'Tailscale mesh VPN', true, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('wireguard-tools', 'WireGuard VPN tools', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('openvpn', 'OpenVPN client', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('cloudflare-warp', 'Cloudflare WARP client', true, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('dog', 'DNS lookup tool (dig alternative)', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('bind', 'BIND DNS tools (dig, nslookup)', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('bandwhich', 'Terminal bandwidth utilization tool', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('trippy', 'Network diagnostic tool (TUI traceroute)', false, (SELECT id FROM categories WHERE name = 'Networking & Security')),
  ('socat', 'Multipurpose relay (socket cat)', false, (SELECT id FROM categories WHERE name = 'Networking & Security'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Containers & Virtualization
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('docker', 'Docker Desktop for Mac', true, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('orbstack', 'Fast lightweight Docker & Linux on macOS', true, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('podman', 'Daemonless container engine', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('colima', 'Container runtimes on macOS', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('docker-compose', 'Docker Compose multi-container tool', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('lazydocker', 'Terminal UI for Docker', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('dive', 'Explore Docker image layers', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('ctop', 'Top-like interface for containers', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('vagrant', 'Development environments manager', true, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('virtualbox', 'VirtualBox virtualization', true, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('utm', 'Virtual machines for Mac', true, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('parallels', 'Parallels Desktop virtualization', true, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('multipass', 'Ubuntu VMs on demand', true, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('minikube', 'Local Kubernetes cluster', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('kind', 'Kubernetes in Docker', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization')),
  ('k3d', 'k3s in Docker', false, (SELECT id FROM categories WHERE name = 'Containers & Virtualization'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Cloud & Infrastructure
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('awscli', 'AWS Command Line Interface', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('azure-cli', 'Microsoft Azure CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('google-cloud-sdk', 'Google Cloud SDK', true, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('terraform', 'HashiCorp Terraform IaC', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('pulumi', 'Pulumi infrastructure as code', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('ansible', 'Ansible automation platform', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('packer', 'HashiCorp Packer image builder', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('kubectl', 'Kubernetes CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('kubectx', 'Switch Kubernetes contexts easily', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('helm', 'Kubernetes package manager', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('kustomize', 'Kubernetes configuration management', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('k9s', 'Kubernetes TUI manager', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('lens', 'Kubernetes IDE', true, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('argocd', 'Argo CD CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('fluxcd/tap/flux', 'Flux CD CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('doctl', 'DigitalOcean CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('flyctl', 'Fly.io CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('railway', 'Railway.app CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('vercel-cli', 'Vercel CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('netlify-cli', 'Netlify CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('heroku', 'Heroku CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('supabase', 'Supabase CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure')),
  ('firebase-cli', 'Firebase CLI', false, (SELECT id FROM categories WHERE name = 'Cloud & Infrastructure'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- API & HTTP Tools
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('grpcurl', 'Command-line gRPC client', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('protobuf', 'Protocol Buffers compiler', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('graphql-playground', 'GraphQL IDE', true, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('websocat', 'WebSocket CLI client', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('hey', 'HTTP load testing tool', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('vegeta', 'HTTP load testing tool', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('k6', 'Load testing tool by Grafana', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('wrk', 'HTTP benchmarking tool', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('ngrok', 'Expose localhost to internet', true, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('localtunnel', 'Expose localhost to internet', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('caddy', 'Fast multi-platform web server', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('nginx', 'HTTP and reverse proxy server', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools')),
  ('traefik', 'Modern HTTP reverse proxy', false, (SELECT id FROM categories WHERE name = 'API & HTTP Tools'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Communication
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('slack', 'Slack team communication', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('discord', 'Discord voice and text chat', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('zoom', 'Zoom video conferencing', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('telegram', 'Telegram messaging', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('signal', 'Signal encrypted messaging', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('whatsapp', 'WhatsApp messaging', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('microsoft-teams', 'Microsoft Teams', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('skype', 'Skype video calls', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('webex', 'Cisco Webex meetings', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('element', 'Matrix messaging client', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('mattermost', 'Open source Slack alternative', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('mumble', 'Low-latency voice chat', true, (SELECT id FROM categories WHERE name = 'Communication')),
  ('loom', 'Screen recording and messaging', true, (SELECT id FROM categories WHERE name = 'Communication'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Productivity
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('raycast', 'Launcher and productivity tool', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('alfred', 'Productivity app and launcher', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('rectangle', 'Window management via keyboard', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('rectangle-pro', 'Professional window management', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('amethyst', 'Tiling window manager', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('magnet', 'Window manager', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('karabiner-elements', 'Keyboard customizer', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('bettertouchtool', 'Input device customization', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('hammerspoon', 'macOS automation with Lua', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('cleanshot', 'Screenshot and recording tool', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('shottr', 'Screenshot tool', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('bartender', 'Menu bar icon organizer', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('hiddenbar', 'Hide menu bar items', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('stats', 'System monitor in menu bar', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('istat-menus', 'System monitoring in menu bar', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('numi', 'Beautiful calculator app', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('maccy', 'Clipboard manager', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('copyq', 'Advanced clipboard manager', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('popclip', 'Instant text actions', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('contexts', 'Window switcher', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('alt-tab', 'Windows-like alt-tab switcher', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('hyperkey', 'Remap Caps Lock to hyper key', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('flux', 'Screen color temperature adjustment', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('rescuetime', 'Time tracking and focus', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('toggl-track', 'Time tracking', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('focus', 'Website and app blocker', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('the-unarchiver', 'Archive extraction tool', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('keka', 'File archiver', true, (SELECT id FROM categories WHERE name = 'Productivity')),
  ('appcleaner', 'Application uninstaller', true, (SELECT id FROM categories WHERE name = 'Productivity'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Password Managers
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('1password', '1Password password manager', true, (SELECT id FROM categories WHERE name = 'Password Managers')),
  ('1password-cli', '1Password CLI', false, (SELECT id FROM categories WHERE name = 'Password Managers')),
  ('bitwarden', 'Bitwarden password manager', true, (SELECT id FROM categories WHERE name = 'Password Managers')),
  ('keepassxc', 'KeePassXC password manager', true, (SELECT id FROM categories WHERE name = 'Password Managers')),
  ('lastpass', 'LastPass password manager', true, (SELECT id FROM categories WHERE name = 'Password Managers')),
  ('dashlane', 'Dashlane password manager', true, (SELECT id FROM categories WHERE name = 'Password Managers')),
  ('enpass', 'Enpass password manager', true, (SELECT id FROM categories WHERE name = 'Password Managers'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Media Players
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('vlc', 'VLC media player', true, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('iina', 'Modern media player for macOS', true, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('spotify', 'Spotify music streaming', true, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('tidal', 'Tidal music streaming', true, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('amazon-music', 'Amazon Music', true, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('audacity', 'Audio editor', true, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('mpv', 'Media player', false, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('cmus', 'Terminal music player', false, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('plex', 'Plex media server client', true, (SELECT id FROM categories WHERE name = 'Media Players')),
  ('jellyfin', 'Jellyfin media system', true, (SELECT id FROM categories WHERE name = 'Media Players'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Image & Video Tools
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('imagemagick', 'Image manipulation tools', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('ffmpeg', 'Audio and video processing', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('yt-dlp', 'YouTube video downloader', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('gifsicle', 'GIF manipulation tool', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('optipng', 'PNG optimizer', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('pngquant', 'PNG image compressor', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('jpegoptim', 'JPEG optimizer', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('webp', 'WebP image tools', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('exiftool', 'Image metadata reader/writer', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('vips', 'Fast image processing library', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('graphviz', 'Graph visualization software', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('gnuplot', 'Plotting tool', false, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('handbrake', 'Video transcoder', true, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('obs', 'Open Broadcaster Software', true, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('screenflow', 'Screen recording and editing', true, (SELECT id FROM categories WHERE name = 'Image & Video Tools')),
  ('kap', 'Screen recorder', true, (SELECT id FROM categories WHERE name = 'Image & Video Tools'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Design & Creative
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('figma', 'Figma design tool', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('sketch', 'Sketch design tool', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('zeplin', 'Design handoff tool', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('adobe-creative-cloud', 'Adobe Creative Cloud', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('affinity-designer-2', 'Affinity Designer vector editor', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('affinity-photo-2', 'Affinity Photo editor', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('gimp', 'GNU Image Manipulation Program', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('inkscape', 'Vector graphics editor', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('blender', 'Blender 3D creation suite', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('krita', 'Digital painting program', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('pixelmator-pro', 'Image editor for Mac', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('canva', 'Canva design tool', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('iconjar', 'Icon organizer', true, (SELECT id FROM categories WHERE name = 'Design & Creative')),
  ('colorsnapper', 'Color picker', true, (SELECT id FROM categories WHERE name = 'Design & Creative'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- File Management
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('cyberduck', 'FTP/SFTP/cloud storage browser', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('transmit', 'File transfer client', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('filezilla', 'FTP client', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('forklift', 'Dual-pane file manager', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('commander-one', 'Dual-pane file manager', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('path-finder', 'Advanced Finder replacement', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('dropbox', 'Dropbox cloud storage', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('google-drive', 'Google Drive client', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('onedrive', 'Microsoft OneDrive', true, (SELECT id FROM categories WHERE name = 'File Management')),
  ('syncthing', 'Continuous file synchronization', false, (SELECT id FROM categories WHERE name = 'File Management')),
  ('rclone', 'Cloud storage sync tool', false, (SELECT id FROM categories WHERE name = 'File Management')),
  ('rsync', 'Fast incremental file transfer', false, (SELECT id FROM categories WHERE name = 'File Management'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- System Utilities
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('mas', 'Mac App Store CLI', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('trash', 'Move files to macOS Trash', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('dockutil', 'Manage macOS Dock items', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('switchaudio-osx', 'Switch audio source from CLI', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('blueutil', 'Bluetooth CLI utility', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('m-cli', 'macOS CLI Swiss Army Knife', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('brightness', 'Change display brightness', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('cask-repair', 'Repair Homebrew Cask taps', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('diskutil', 'Disk utility wrapper', false, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('aldente', 'Battery charge limiter', true, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('coconutbattery', 'Battery health monitor', true, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('monitorcontrol', 'Control external monitor brightness', true, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('disk-drill', 'Data recovery tool', true, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('onyx', 'System maintenance utility', true, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('sensei', 'System performance tool', true, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('cleanmymac', 'System cleaner and optimizer', true, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('little-snitch', 'Network monitor and firewall', true, (SELECT id FROM categories WHERE name = 'System Utilities')),
  ('lulu', 'Open source macOS firewall', true, (SELECT id FROM categories WHERE name = 'System Utilities'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Fonts
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('font-fira-code', 'Fira Code monospaced font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-jetbrains-mono', 'JetBrains Mono font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-cascadia-code', 'Microsoft Cascadia Code font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-source-code-pro', 'Adobe Source Code Pro font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-hack', 'Hack typeface', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-inconsolata', 'Inconsolata monospaced font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-iosevka', 'Iosevka monospaced font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-victor-mono', 'Victor Mono font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-meslo-lg-nerd-font', 'Meslo Nerd Font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-fira-code-nerd-font', 'Fira Code Nerd Font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-jetbrains-mono-nerd-font', 'JetBrains Mono Nerd Font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-hack-nerd-font', 'Hack Nerd Font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-roboto', 'Google Roboto font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-inter', 'Inter font family', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-open-sans', 'Open Sans font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-lato', 'Lato font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-montserrat', 'Montserrat font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-sf-mono', 'Apple SF Mono font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-ibm-plex', 'IBM Plex font family', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-geist', 'Vercel Geist font', true, (SELECT id FROM categories WHERE name = 'Fonts')),
  ('font-geist-mono', 'Vercel Geist Mono font', true, (SELECT id FROM categories WHERE name = 'Fonts'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Gaming
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('steam', 'Steam gaming platform', true, (SELECT id FROM categories WHERE name = 'Gaming')),
  ('epic-games', 'Epic Games Launcher', true, (SELECT id FROM categories WHERE name = 'Gaming')),
  ('gog-galaxy', 'GOG Galaxy game launcher', true, (SELECT id FROM categories WHERE name = 'Gaming')),
  ('itch-io', 'itch.io indie game launcher', true, (SELECT id FROM categories WHERE name = 'Gaming')),
  ('openemu', 'Retro game emulation', true, (SELECT id FROM categories WHERE name = 'Gaming')),
  ('moonlight', 'GameStream client', true, (SELECT id FROM categories WHERE name = 'Gaming')),
  ('nvidia-geforce-now', 'NVIDIA cloud gaming', true, (SELECT id FROM categories WHERE name = 'Gaming'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Writing & Notes
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('notion', 'Notion workspace', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('obsidian', 'Knowledge base and note-taking', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('logseq', 'Privacy-first knowledge base', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('craft', 'Native document editor', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('bear', 'Markdown notes app', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('ulysses', 'Writing app', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('ia-writer', 'Focused writing app', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('typora', 'Markdown editor', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('mark-text', 'Simple Markdown editor', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('joplin', 'Open source note-taking', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('standard-notes', 'Encrypted notes app', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('simplenote', 'Simple cross-platform notes', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('evernote', 'Evernote note-taking', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('noteship', 'Quick note-taking', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('grammarly-desktop', 'Grammarly writing assistant', true, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('pandoc', 'Universal document converter', false, (SELECT id FROM categories WHERE name = 'Writing & Notes')),
  ('latex', 'LaTeX typesetting (MacTeX)', true, (SELECT id FROM categories WHERE name = 'Writing & Notes'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Email
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('thunderbird', 'Mozilla Thunderbird email', true, (SELECT id FROM categories WHERE name = 'Email')),
  ('spark', 'Spark email client', true, (SELECT id FROM categories WHERE name = 'Email')),
  ('airmail', 'Airmail email client', true, (SELECT id FROM categories WHERE name = 'Email')),
  ('mimestream', 'Native Gmail client for Mac', true, (SELECT id FROM categories WHERE name = 'Email')),
  ('canary-mail', 'Canary Mail encrypted email', true, (SELECT id FROM categories WHERE name = 'Email')),
  ('mailspring', 'Open source email client', true, (SELECT id FROM categories WHERE name = 'Email'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- DevOps & Monitoring
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('prometheus', 'Prometheus monitoring system', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('grafana', 'Grafana observability platform', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('datadog-agent', 'Datadog monitoring agent', true, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('act', 'Run GitHub Actions locally', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('jenkins', 'Jenkins CI/CD server', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('circleci', 'CircleCI CLI', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('travis', 'Travis CI CLI', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('stern', 'Multi-pod log tailing for Kubernetes', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('lnav', 'Log file navigator', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('vector', 'High-performance log pipeline', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('trivy', 'Container vulnerability scanner', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('hadolint', 'Dockerfile linter', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('shellcheck', 'Shell script linter', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('yamllint', 'YAML linter', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('checkov', 'Infrastructure as code scanner', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring')),
  ('tflint', 'Terraform linter', false, (SELECT id FROM categories WHERE name = 'DevOps & Monitoring'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- AI & Machine Learning
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('ollama', 'Run LLMs locally', false, (SELECT id FROM categories WHERE name = 'AI & Machine Learning')),
  ('lm-studio', 'Local LLM GUI', true, (SELECT id FROM categories WHERE name = 'AI & Machine Learning')),
  ('jan', 'Open source ChatGPT alternative', true, (SELECT id FROM categories WHERE name = 'AI & Machine Learning')),
  ('chatgpt', 'OpenAI ChatGPT desktop app', true, (SELECT id FROM categories WHERE name = 'AI & Machine Learning')),
  ('claude', 'Anthropic Claude desktop app', true, (SELECT id FROM categories WHERE name = 'AI & Machine Learning')),
  ('github-copilot-for-xcode', 'Copilot for Xcode', true, (SELECT id FROM categories WHERE name = 'AI & Machine Learning')),
  ('diffusionbee', 'Stable Diffusion GUI', true, (SELECT id FROM categories WHERE name = 'AI & Machine Learning'))
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- Science & Data
-- ============================================================
INSERT INTO packages (name, description, is_cask, category_id) VALUES
  ('jupyter', 'Jupyter interactive notebooks', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('jupyterlab', 'JupyterLab IDE', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('apache-spark', 'Apache Spark analytics engine', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('apache-flink', 'Apache Flink stream processing', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('apache-kafka', 'Apache Kafka message broker', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('rabbitmq', 'RabbitMQ message broker', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('nats-server', 'NATS messaging server', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('zookeeper', 'Apache ZooKeeper', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('minio', 'MinIO S3-compatible object storage', false, (SELECT id FROM categories WHERE name = 'Science & Data')),
  ('clickhouse', 'ClickHouse analytics database', false, (SELECT id FROM categories WHERE name = 'Science & Data'))
ON CONFLICT (name) DO NOTHING;
