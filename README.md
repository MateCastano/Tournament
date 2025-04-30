# 🏀 Tournament Management System

A simple command-line Ruby application to manage basketball tournaments.

## 🚧 Status

- This project is currently **in progress**.
- Core features like tournament and team registration are implemented.
- Additional features (fixtures, results, scoring tables) are being developed.

## 💡 Features

- Create new tournaments and store them as JSON files.
- Register teams and players.
- Generate and display match fixtures. *(coming soon)*
- Record and show match results. *(coming soon)*
- Automatic score table generation. *(planned)*

## 📁 Structure

- `main.rb` — Entry point with the menu system.
- `models/` — Contains classes for Tournament, Team, and Player.
- `controllers.rb` — Interfaces between the menu and logic.
- `utils/storage_management.rb` — File operations for saving/loading JSON.

## ▶️ Requirements

- Ruby 3.x+
- No external gems required.

## ✅ How to run

```bash
ruby main.rb
