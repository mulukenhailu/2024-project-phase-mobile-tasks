# ecommerce_app
This Flutter eCommerce application is built with a focus on Test-Driven Development (TDD) and Clean Architecture principles. The project prioritizes creating a codebase that is maintainable, modular, and easy to test, ensuring that each feature can be independently verified and aligns with SOLID principles. By following TDD, features are developed by first writing tests and then coding to meet those tests, leading to a dependable and resilient application.
## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)

## Introduction
Clean Architecture
Clean Architecture is a software design philosophy that prioritizes maintainability, testability, and flexibility. It emphasizes the separation of concerns by organizing the codebase into layers, each with distinct responsibilities. This approach ensures that the core business logic of the application is independent of external frameworks, databases, and user interfaces.
## The main layers in Clean Architecture typically include:
## Entities: 
Represent the core business rules and models, which are completely independent of any external concerns.
## Use Cases (or Interactors): 
Define the application-specific business rules and orchestrate the flow of data between entities and other layers.
## Interface Adapters: 
Act as a bridge between the use cases and the external systems, such as databases, web services, or UI components.
## Frameworks and Drivers: 
The outermost layer, which includes external tools, libraries, and frameworks. This layer is where the technical implementation details reside, such as databases, UI frameworks, and third-party libraries.

By following Clean Architecture, the application becomes more adaptable to change, as modifications in one layer do not directly affect others. This makes the codebase easier to understand, test, and evolve over time.

## Installation
      dependencies:
        flutter:
          sdk: flutter
        equatable: ^2.0.0
        dartz: ^0.10.1

## dev_dependencies:
      mockito: ^5.1.0
      build_runner: ^2.1.7

## run 
      flutter pub get

