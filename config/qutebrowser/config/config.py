config.load_autoconfig(True)
c.auto_save.session = True
c.colors.webpage.preferred_color_scheme = "dark"
c.completion.cmd_history_max_items = 0
c.completion.height = "25%"
c.completion.shrink = True
c.completion.web_history.max_items = 0
c.content.autoplay = False
c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.canvas_reading = False
c.content.geolocation = False
c.content.javascript.clipboard = "access-paste"
c.content.pdfjs = False
c.content.webgl = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.downloads.location.prompt = False
c.scrolling.smooth = True
c.statusbar.show = "never"
c.tabs.last_close = "close"
c.tabs.mode_on_change = "persist"
c.tabs.mousewheel_switching = False
c.tabs.position = "top"
c.tabs.select_on_remove = "last-used"
c.tabs.show = "multiple"
c.tabs.title.format = "{index}: {current_title}"
c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"

# aliases
c.aliases['rl'] = "config-source"
c.aliases['ad'] = "config-cycle -t content.blocking.enabled"
c.aliases['bl'] = "open about:blank"
c.aliases['dk'] = "config-cycle -t colors.webpage.darkmode.enabled"

# binds
config.bind("src", "view-source", mode="normal")
config.bind("all", "window-only", mode="normal")
config.bind("clr", "clear-messages", mode="normal")
config.bind("dlc", "download-cancel", mode="normal")
config.bind("srx", "open https://searx.space/", mode="normal")
config.bind("ins", "devtools", mode="normal")
# config.bind("mpv", "hint links spawn C:/WindowsPowerShell/v1.0/powershell.exe somescript.ps1 {hint-url} ")
# config.bind("mpv", "hint links spawn C:/ProgramData/chocolatey/lib/mpvio.install/tools/mpv.exe --ytdl-format='best[ext=mp4][height=1080]' -fs {hint-url}", mode="normal")

# discover
c.url.searchengines['DEFAULT'] = "https://www.startpage.com/do/search?query={}"
c.url.searchengines['f'] = "https://exa.ai/search?q={}"

# nix
c.url.searchengines['nm'] = "https://nix.dev/manual/nix/2.24/?search={}"
c.url.searchengines['np'] = "https://search.nixos.org/packages?channel=unstable&query={}"
c.url.searchengines['nw'] = "https://nixos.wiki/index.php?search={}"
c.url.searchengines['nd'] = "https://noogle.dev/q?term={}"
c.url.searchengines['nb'] = "https://mynixos.com/search?q=bin%2F{}"

# code
c.url.searchengines['pc'] = "https://phind.com/search?q={}"
c.url.searchengines['sc'] = "https://www.google.com/search?q={}+site%3Astackoverflow.com"
c.url.searchengines['rc'] = "https://www.google.com/search?q={}+site%3Agithub.com+OR+site%3Acodeberg.org+OR+site%3Agitea.com+OR+site%3Agitlab.com"
c.url.searchengines['gc'] = "https://github.com/search?q=path%3A**%2F*.*+{}&type=code"
c.url.searchengines['ac'] = "https://wiki.archlinux.org/index.php?search={}"

# man
c.url.searchengines['rm'] = "https://doc.rust-lang.org/book/title-page.html?search={}"
c.url.searchengines['pm'] = "https://www.google.com/search?q={}+site%3Aen.cppreference.com"
c.url.searchengines['hm'] = "https://www.google.com/search?q={}+site%3Ahaskell.org"
c.url.searchengines['zm'] = "https://ziglang.org/documentation/master/std/#A;std?{}"
c.url.searchengines['cm'] = "https://www.google.com/search?q={}+site%3Aen.cppreference.com/w/c"
c.url.searchengines['gm'] = "https://www.google.com/search?q={}+site%3Ago.dev"
c.url.searchengines['wm'] = "https://learn.microsoft.com/en-us/search/?terms={}"

# pkgs
c.url.searchengines['gp'] = "https://pkg.go.dev/search?q={}"
c.url.searchengines['hp'] = "https://hackage.haskell.org/packages/browse?terms={}"
c.url.searchengines['pp'] = "https://pypi.org/search/?q={}"
c.url.searchengines['rp'] = "https://crates.io/search?q={}"

# find
c.url.searchengines['wf'] = "https://en.wikipedia.org/wiki/Special:Search?search={}"
c.url.searchengines['yf'] = "http://www.youtube.com/results?search_query={}"
c.url.searchengines['pf'] = "http://arxiv.org/search/?query={}&searchtype=all&source=header"
c.url.searchengines['mf'] = "https://www.google.com/maps?q={}"
c.url.searchengines['jf'] = "https://dictionary.goo.ne.jp/srch/all/{}/m0u/"
c.url.searchengines['hf'] = "https://web.archive.org/web/20250000000000*/{}"
c.url.searchengines['bf'] = "https://annas-archive.org/search?index=&page=1&q={}"
c.url.searchengines['sf1'] = "https://nunflix.org/search/{}"
c.url.searchengines['sf2'] = "https://hydrahd.me/index.php?menu=search&query={}"
c.url.searchengines['sf3'] = "https://www.google.com/search?q={}+site%3Awww.wco.tv"

c.bindings.default = {}
config.bind("<Escape>", "mode-leave", mode="caret")
config.bind("<Return>", "yank selection", mode="caret")
config.bind("<Shift-Space>", "selection-drop", mode="caret")
config.bind("<Space>", "selection-toggle", mode="caret")
config.bind("<Down>", "completion-item-focus --history next", mode="command")
config.bind("<Escape>", "mode-leave", mode="command")
config.bind("<Return>", "command-accept", mode="command")
config.bind("<Tab>", "completion-item-focus next", mode="command")
config.bind("<Up>", "completion-item-focus --history prev", mode="command")
config.bind("<Escape>", "mode-leave", mode="insert")
config.bind("+", "zoom-in", mode="normal")
config.bind("-", "zoom-out", mode="normal")
config.bind("/", "cmd-set-text /", mode="normal")
config.bind(":", "cmd-set-text :", mode="normal")
config.bind("<Ctrl-f>", "cmd-set-text /", mode="normal")
config.bind("<Ctrl-r>", "reload", mode="normal")
config.bind("<Ctrl-w>", "tab-close", mode="normal")
config.bind("<Return>", "selection-follow", mode="normal")
config.bind("H", "back", mode="normal")
config.bind("J", "tab-next", mode="normal")
config.bind("K", "tab-prev", mode="normal")
config.bind("L", "forward", mode="normal")
config.bind("O", "cmd-set-text -s :open -s -t", mode="normal")
config.bind("f", "hint", mode="normal")
config.bind("h", "scroll left", mode="normal")
config.bind("i", "mode-enter insert", mode="normal")
config.bind("j", "scroll down", mode="normal")
config.bind("k", "scroll up", mode="normal")
config.bind("l", "scroll right", mode="normal")
config.bind("n", "search-next", mode="normal")
config.bind("o", "cmd-set-text -s :open -s", mode="normal")
config.bind("p", "search-prev", mode="normal")
config.bind("t", "tab-focus", mode="normal")
config.bind("u", "undo", mode="normal")
config.bind("v", "mode-enter caret", mode="normal")
config.bind("y", "yank", mode="normal")
config.bind("§§", "mode-leave", mode="passthrough")
config.bind("<Escape>", "mode-leave", mode="register")
config.bind("<Escape>", "mode-leave", mode="yesno")
config.bind("<Return>", "prompt-accept", mode="yesno")
config.bind("n", "prompt-accept no", mode="yesno")
config.bind("y", "prompt-accept yes", mode="yesno")

c.content.blocking.adblock.lists = ["https://filters.adtidy.org/extension/ublock/filters/2.txt", "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_3.txt", "https://raw.githubusercontent.com/tofukko/filter/master/Adblock_Plus_list.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2025.txt", "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt", "https://raw.githubusercontent.com/easylist/easylist/refs/heads/gh-pages/fanboy-sounds.txt", "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-domains.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt", "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt", "https://raw.githubusercontent.com/tomasko126/easylistczechandslovak/master/filters.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_47.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-mobile.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_22.txt", "https://raw.githubusercontent.com/easylist/easylist/refs/heads/gh-pages/fanboy-social.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_33.txt", "https://www.i-dont-care-about-cookies.eu/abp/", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt", "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_12.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_48.txt", "https://raw.githubusercontent.com/Ewpratten/youtube_ad_blocklist/master/blocklist.txt", "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt", "https://secure.fanboy.co.nz/fanboy-annoyance.txt", "https://raw.githubusercontent.com/easylist/easylist/refs/heads/gh-pages/easylist.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_45.txt", "https://raw.githubusercontent.com/easylist/easylist/refs/heads/gh-pages/easyprivacy.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_24.txt", "https://raw.githubusercontent.com/easylist/easylist/refs/heads/gh-pages/fanboy-annoyance.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_8.txt", "https://raw.githubusercontent.com/easylist/easylist/refs/heads/gh-pages/fanboy-newsletter.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_4.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt", "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt", "https://easylist.to/easylist/easylist.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt", "https://easylist.to/easylist/easyprivacy.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_27.txt", "https://easylist.to/easylist/fanboy-annoyance.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt", "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/lan-block.txt", "https://someonewhocares.org/hosts/hosts", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/ubo-link-shorteners.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/ubol-filters.txt", "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_2.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_39.txt", "https://pgl.yoyo.org/adservers/serverlist.php?showintro=0;hostformat=hosts", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_50.txt", "https://gitlab.com/curben/urlhaus-filter/-/raw/master/urlhaus-filter-online.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_53.txt", "https://adguardteam.github.io/HostlistsRegistry/assets/filter_55.txt"]

base00 = "#272e33"
base01 = "#2e383c"
base02 = "#414b50"
base03 = "#859289"
base04 = "#9da9a0"
base05 = "#d3c6aa"
base06 = "#edeada"
base07 = "#fffbef"
base08 = "#e67e80"
base09 = "#e69875"
base0A = "#dbbc7f"
base0B = "#a7c080"
base0C = "#83c092"
base0D = "#7fbbb3"
base0E = "#d699b6"
base0F = "#9da9a0"
c.colors.completion.fg = base05
c.colors.completion.odd.bg = base00
c.colors.completion.even.bg = base00
c.colors.completion.category.fg = base0D
c.colors.completion.category.bg = base00
c.colors.completion.category.border.top = base00
c.colors.completion.category.border.bottom = base00
c.colors.completion.item.selected.fg = base05
c.colors.completion.item.selected.bg = base02
c.colors.completion.item.selected.border.top = base02
c.colors.completion.item.selected.border.bottom = base02
c.colors.completion.item.selected.match.fg = base05
c.colors.completion.match.fg = base09
c.colors.completion.scrollbar.fg = base05
c.colors.completion.scrollbar.bg = base00
c.colors.contextmenu.disabled.bg = base01
c.colors.contextmenu.disabled.fg = base04
c.colors.contextmenu.menu.bg = base00
c.colors.contextmenu.menu.fg =  base05
c.colors.contextmenu.selected.bg = base02
c.colors.contextmenu.selected.fg = base05
c.colors.downloads.bar.bg = base00
c.colors.downloads.start.fg = base00
c.colors.downloads.start.bg = base0D
c.colors.downloads.stop.fg = base00
c.colors.downloads.stop.bg = base0C
c.colors.downloads.error.fg = base08
c.colors.hints.fg = base00
c.colors.hints.bg = base0A
c.colors.hints.match.fg = base05
c.colors.keyhint.fg = base05
c.colors.keyhint.suffix.fg = base05
c.colors.keyhint.bg = base00
c.colors.messages.error.fg = base00
c.colors.messages.error.bg = base08
c.colors.messages.error.border = base08
c.colors.messages.warning.fg = base00
c.colors.messages.warning.bg = base0E
c.colors.messages.warning.border = base0E
c.colors.messages.info.fg = base05
c.colors.messages.info.bg = base00
c.colors.messages.info.border = base00
c.colors.prompts.fg = base05
c.colors.prompts.border = base00
c.colors.prompts.bg = base00
c.colors.prompts.selected.bg = base02
c.colors.prompts.selected.fg = base05
c.colors.statusbar.normal.fg = base05
c.colors.statusbar.normal.bg = base00
c.colors.statusbar.insert.fg = base0C
c.colors.statusbar.insert.bg = base00
c.colors.statusbar.passthrough.fg = base0A
c.colors.statusbar.passthrough.bg = base00
c.colors.statusbar.private.fg = base0E
c.colors.statusbar.private.bg = base00
c.colors.statusbar.command.fg = base04
c.colors.statusbar.command.bg = base01
c.colors.statusbar.command.private.fg = base0E
c.colors.statusbar.command.private.bg = base01
c.colors.statusbar.caret.fg = base0D
c.colors.statusbar.caret.bg = base00
c.colors.statusbar.caret.selection.fg = base0D
c.colors.statusbar.caret.selection.bg = base00
c.colors.statusbar.progress.bg = base0D
c.colors.statusbar.url.fg = base05
c.colors.statusbar.url.error.fg = base08
c.colors.statusbar.url.hover.fg = base09
c.colors.statusbar.url.success.http.fg = base0B
c.colors.statusbar.url.success.https.fg = base0B
c.colors.statusbar.url.warn.fg = base0E
c.colors.tabs.bar.bg = base00
c.colors.tabs.indicator.start = base0D
c.colors.tabs.indicator.stop = base0C
c.colors.tabs.indicator.error = base08
c.colors.tabs.odd.fg = base05
c.colors.tabs.odd.bg = base00
c.colors.tabs.even.fg = base05
c.colors.tabs.even.bg = base00
c.colors.tabs.pinned.even.bg = base0B
c.colors.tabs.pinned.even.fg = base00
c.colors.tabs.pinned.odd.bg = base0B
c.colors.tabs.pinned.odd.fg = base00
c.colors.tabs.pinned.selected.even.bg = base02
c.colors.tabs.pinned.selected.even.fg = base05
c.colors.tabs.pinned.selected.odd.bg = base02
c.colors.tabs.pinned.selected.odd.fg = base05
c.colors.tabs.selected.odd.fg = base05
c.colors.tabs.selected.odd.bg = base02
c.colors.tabs.selected.even.fg = base05
c.colors.tabs.selected.even.bg = base02
c.colors.webpage.bg = base00
