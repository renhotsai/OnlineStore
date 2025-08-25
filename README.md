# Group3_Store - Online Store Console Application

A Swift-based console application that simulates an online digital store for purchasing and managing games and movies.

## Features

- **Browse Items**: Search for games and movies by title
- **Purchase Items**: Buy digital content with account balance
- **Refund System**: Return items within 30 minutes of usage
- **Account Management**: Check owned items and reload account balance
- **Usage Tracking**: Track usage time for purchased items

## Project Structure

```
Group3_Store/
├── main.swift          # Main application entry point
├── Store.swift         # Store class handling purchases and refunds
├── Customer.swift      # Customer class managing balance and owned items
├── Item.swift          # Base Item class
├── Game.swift          # Game-specific item implementation
├── Movie.swift         # Movie-specific item implementation
├── OwnedItem.swift     # Owned item with usage tracking
├── Menu.swift          # Menu enumeration for user actions
├── Error.swift         # Custom error definitions
└── IsPurchasable.swift # Protocol for purchasable items
```

## Classes & Components

### Core Classes

- **Store**: Manages inventory, purchases, refunds, and item searches
- **Customer**: Handles user balance, owned items, and account operations
- **Item**: Abstract base class for all purchasable items
- **Game**: Inherits from Item, includes publisher and multiplayer info
- **Movie**: Inherits from Item, includes running time
- **OwnedItem**: Tracks usage time for purchased items

### Key Features

- **Error Handling**: Custom error types for common scenarios
- **Protocol-Based Design**: IsPurchasable protocol ensures consistent behavior
- **Menu System**: Enum-based menu for user navigation
- **Receipt System**: Generates purchase and refund receipts

## How to Run

1. Open the project in Xcode:
   ```bash
   open Group3_Store.xcodeproj
   ```

2. Build and run the project (⌘+R) or use:
   ```bash
   swift run
   ```

## Usage

The application provides a menu-driven interface with the following options:

1. **Search** - Find items by title
2. **Issue Refund** - Return items (if used < 30 minutes)
3. **Check Cart** - View owned items and usage
4. **Buy Item** - Purchase items from the store
5. **Use Item** - Log usage time for owned items
6. **Reload Fund** - Add money to account balance
7. **Exit** - Quit the application

## Sample Items

### Games
- CS:GO ($2) - Valve
- Among Us ($5) - Innersloth
- Rocket League ($25) - Psyonix
- Stardew Valley ($15) - ConcernedApe

### Movies
- Inception ($12.99) - 148 minutes
- The Shawshank Redemption ($9.99) - 142 minutes
- Pulp Fiction ($14.99) - 154 minutes
- The Dark Knight ($11.99) - 152 minutes
- Forrest Gump ($10.49) - 142 minutes

## Error Handling

The application handles various error scenarios:
- Item not found
- Insufficient funds
- Already owned items
- Invalid input
- Refund restrictions (30+ minutes usage)

## Development Team

- Created by 이현성 (main.swift)
- RENHO TSAI (Game.swift, Movie.swift, Item.swift, OwnedItem.swift, IsPurchasable.swift, Menu.swift)

## Requirements

- Swift 5.0+
- Xcode 12.0+
- macOS 10.15+