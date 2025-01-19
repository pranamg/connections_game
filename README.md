# connections_game

## Project Description

`connections_game` is a Flutter-based game where players are tasked with creating four groups of four items each. The game provides a list of names, and players must identify the correct groups based on the given names. The game is designed to be both fun and educational, helping players improve their cognitive skills and pattern recognition.

Replicating NY Times Connections game by leveraging Github Copilot.

## Purpose and Functionality

The purpose of the `connections_game` is to challenge players to think critically and make connections between seemingly unrelated items. The game provides a list of names, and players must group them into four categories, each containing four items. The game is designed to be engaging and educational, helping players improve their cognitive skills and pattern recognition.

## How to Run and Use the Application

### Setup Requirements and Dependencies

To run the `connections_game` application, you need to have Flutter installed on your machine. Follow the instructions on the [Flutter website](https://flutter.dev/docs/get-started/install) to install Flutter.

### Running the Application

1. Clone the repository:
   ```bash
   git clone https://github.com/pranamg/connections_game.git
   ```
2. Navigate to the project directory:
   ```bash
   cd connections_game
   ```
3. Install the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## Project Structure

The project is structured as follows:

- `lib/`: Contains the main Dart code for the application.
  - `components/`: Contains reusable UI components.
  - `models/`: Contains the data models used in the application.
  - `services/`: Contains the services used to load and manage game data.
  - `games.json`: Contains the game data in JSON format.
  - `main.dart`: The entry point of the application.

## Technologies Used

- Flutter: The main framework used to build the application.
- Dart: The programming language used to write the application.
- JSON: Used to store the game data.

## Game Rules

1. The game provides a list of names.
2. Players must group the names into four categories, each containing four items.
3. Players have a limited number of mistakes they can make.
4. The game ends when all groups are correctly identified or when the player runs out of mistakes.

## Screenshots

![Game Screenshot](screenshots/game_screenshot.png)

## Inspiration

This project was inspired by the YouTube video - [Using GitHub Copilot to build a mobile app without writing a SINGLE line of code](https://www.youtube.com/watch?v=Vj13SdN6OxU). Let's put AI to a real test here. Can you build a native mobile app - a game - without actually writing a single line of code? Can you just show it pictures of your game and have it create the UI? Yes. And it's remarkably good.
