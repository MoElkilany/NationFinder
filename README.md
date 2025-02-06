# Nation Finder App

<p align="center">
  <img src="https://github.com/user-attachments/assets/5d12053f-b47f-4e88-8611-555edd206797" alt="Screenshot 1" width="150"/>
  <img src="https://github.com/user-attachments/assets/569fe254-2fdd-4e25-9df5-d957c32f8cf6" alt="Screenshot 2" width="150"/>
  <img src="https://github.com/user-attachments/assets/9b7b89d9-799b-4b47-90d9-90aff077b4e5" alt="Screenshot 3" width="150"/>
  <img src="https://github.com/user-attachments/assets/b89bcc53-859b-41b9-b000-c2e7053e96cc" alt="Screenshot 4" width="150"/>
  <img src="https://github.com/user-attachments/assets/9032b518-ee0a-4a29-b4f5-f6bd0d06e8a5" alt="Screenshot 5" width="150"/>
  <img src="https://github.com/user-attachments/assets/f54d36cf-a1ab-4d75-b776-d6e6000d6765" alt="Screenshot 6" width="150"/>
</p>

## Technologies Used
- **Framework:** SwiftUI
- **iOS Version:** 18.1  
- **Swift Version:** Swift 5  
- **Architecture:** MVVM  
- **Concurrency:** Modern Concurrency  
- **Networking:** URLSession  
- **Local Storage:** SwiftData  
- **Testing:** Unit Tests  

## Features

### **1. Fetch Country Details**
- Uses the **REST Countries API** to fetch country information, including:
  - Country name.
  - Capital city.
  - Currency.
   - Country flag.

### **2. Splash Screen**
- Displays a splash screen while fetching country data from the API.
- Ensures the app is ready with data before transitioning to the main screen.

### **3. Main Screen**
- The main screen provides the following functionalities:
  - **Search for Countries**:  
    - Search for a specific country by name.
  - **Add Countries**:  
    - Add up to 5 countries to the main view for quick access.  
    - Prevents adding more than 5 countries to maintain simplicity.  
  - **Remove Countries**:  
    - Remove a country from the main view at any time.
  - **GPS-Based Country Detection**:  
    - Automatically adds the first country to the main view based on the user's current location (via GPS).  
    - If the user denies location permission, a Turkey country is added instead.

### **4. Country Details View**
- When a country is selected on the main screen:
  - Navigates to a detailed view displaying:
    - **Capital city**.
    - **Currency**.
    - **Country Flag**.
    - **Country Language**.

### **5. Modern Swift Features**
- Makes use of **modern concurrency** (e.g., `async/await`) for API calls.
- Optimized for performance and scalability.

### **6. Simple and Intuitive UI**
- Designed with SwiftUI for a clean and modern user interface.
- Reusable components to maintain consistency throughout the app.

### **7. Offline Mode**
- Saves fetched country data locally using **SwiftData**.
- Allows users to access the app even without an internet connection.

### **8 User-Friendly Error Handling**
- Handles various scenarios gracefully:
  - Displays an error message if the API call fails.  
  - Provides fallback options default country if GPS permission is denied

### **9. Clean and Scalable Architecture**
- Built with the **MVVM (Model-View-ViewModel) architecture** to separate concerns and improve testability.

### **10. Unit Testing**
- Includes unit tests for:
  - Repository.
  - API calls.
  - Search functionality.
  - ViewModels



---

## Folder Structure

### **Catalog**
- Contains assets used in the application, such as colors, images, and other design resources.

### **Core**
- Houses the core application files and entry points:
  - `NationFinderApp`: The main SwiftUI app file that initializes the app.

### **Scenes**
- Organizes the main screens of the app:
  - `CountryDetailsScreen`: Displays detailed information about a selected country, such as its capital city and currency.
  - `MainScreen`: The primary screen where users can search for, add, and remove countries.
  - `SplashScreen`: The introductory screen where API data is fetched upon app launch.

### **Services**
- Includes the service layer for managing API and app logic:
  - `ApiServices`: Handles API requests and responses.
  - `Managers`: Manages app-specific services such as location or data persistence.
  - `Repo`: Repository pattern implementation for data handling and business logic.
  - `Router`: Handles navigation logic within the app.

### **Shared**
- Contains reusable components shared across the app:
  - `BorderedBackground`: A custom reusable view for consistent background styling.
  - `TitleRowView`: A reusable view for displaying title rows.

### **Utilities**
- Includes helper files, constants, and extensions:
  - **Constants**: Contains constant values used throughout the app.
  - **Enums**: Defines enumerations such as:
    - `AppError`: Handles error definitions.
    - `HTTPMethod`: Represents HTTP methods (GET, POST, etc.).
    - `SplashState`: Represents different states of the splash screen.
  - **Extensions**: Contains custom extensions, such as `View+Extension`, to enhance existing SwiftUI components.

### **NationFinderTests**
- Contains unit tests to validate the functionality of the app's features and logic.

---


## User Story
1. When the user **opens the app**, the **Splash Screen** appears, and the app **fetches country data** from the REST Countries API.  
2. Once the data is fetched successfully, the **Main Screen** is displayed.  
3. On the **Main Screen**, the user can:  
   - **Search** for a country.  
   - **Add up to 5 countries** to the main list.  
   - **Remove countries** from the list.  
   - **Automatically get their first country based on GPS location** (with a default fallback if location permission is denied).  
4. When the user **taps on a country**, they navigate to the **Country Details View**, which displays the **capital city and currency**.  
