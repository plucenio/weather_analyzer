# Weather Analyzer

## Description

Weather Analyzer is a cross-platform application designed to provide users with real-time weather data analysis. The application leverages various data sources to present comprehensive weather forecasts, climate trends, and atmospheric conditions.

## Usage

After launching the Weather Analyzer app, you can:

- View current weather conditions in some of the configured cities (you can configure the cities on the file assets/cities.json).
- Get detailed forecasts for the upcoming days.

## Code

### Clean Architecture
Clean Architecture is a design philosophy that advocates for the separation of concerns within an application, promoting the organization of code in a way that is maintainable, scalable, and testable. It focuses on the creation of a system that is independent of frameworks, UI, and databases, and emphasizes the use of interfaces and abstractions to enable this independence.

#### Layers of Clean Architecture

1. **Entities:** These are the business objects of the application. They encapsulate the most general and high-level rules. They are the least likely to change when something external changes.
2. **Use Cases:** These encapsulate all of the business rules and use cases of the application. They orchestrate the flow of data to and from the entities, and direct those entities to use their critical business rules to achieve a goal.
3. **Interface Adapters:** This layer is composed of adapters that convert data from the format most convenient for the use cases and entities, to the format most convenient for some external agency such as the database or the web.
4. **Frameworks and Drivers:** This is where all the details go. The web is a detail. The database is a detail. We keep these things on the outside where they can do little harm.

Implementing Clean Architecture requires rigor and discipline but it can significantly improve the longevity and quality of the software.

### DependencyManager

The `DependencyManager` class is responsible for managing the dependencies required for the Weather Analyzer application. It ensures that all necessary libraries, frameworks, and external services are properly integrated and maintained throughout the application lifecycle.

### ViewModels

The ViewModels in the Weather Analyzer project play a crucial role in the application's architecture, following the MVVM (Model-View-ViewModel) design pattern. They act as a bridge between the application's view layer and the model layer, handling most of the UI logic, such as data presentation and user interaction responses.

#### Overview

ViewModels are responsible for:

- Fetching weather data from the model layer.
- Preparing and formatting data for display in the user interface.
- Managing user inputs and converting them into actions that the model layer can execute.
- Notifying the view layer about changes in the underlying data model to update the UI accordingly.

### Responsivity

- The project have a class called IAdaptativeSizer that is used to handle with the sizes.
- The default parameter is defined as const and all configuration size use that reference to handle sizes.
//TODO: melhorar a doc

## References

The loading widgets was copied on the package loading_animation_widget (https://pub.dev/packages/loading_animation_widget)

The error page was inspired in this project:
https://github.com/tusharhow/20-Error-Pages-Flutter?ref=flutterawesome.com

## Images

![Splash screen](/images/splash.png)
![Cities list](/images/cities_list.png)
![Filter by city](/images/filtering_by_city.png)
![Filter by country](/images/filtering_by_country.png)
![Loading city](/images/loading_city.png)
![Monte Carlo](/images/mc.png)
![São Paulo](/images/sp.png)
![Cities configuration](/images/cities_configuration.png)
