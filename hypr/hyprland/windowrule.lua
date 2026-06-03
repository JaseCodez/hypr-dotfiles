-- Window Opacity Rules
hl.window_rule({ match = { class = "^(kitty)$" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "^(thunar)$" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "^(discord)$" }, opacity = "0.9 0.9" })
hl.window_rule({ match = { class = "^(firefox)$" }, opacity = "0.9 0.9" })
hl.window_rule({ match = { class = "^(Spotify)$" }, opacity = "0.8 0.8" })

-- hl.window_rule({ match = { class = "^(chromium)$" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "^(Code)$" }, opacity = "0.8 0.8" })
hl.window_rule({ match = { class = "^(nemo)$" }, opacity = "0.8 0.8" })

-- Layer Rules
hl.layer_rule({ match = { namespace = "^(rofi)$" }, blur = true })
