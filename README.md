# MVVM Sample
A basic MVVM sample for iOS based on Swift and UIKit

### Topology
The solution consists of a workspace with several projects, following a Clean Architecture design.

<img width="317" alt="image" src="https://github.com/arielc387/MVVMSkeleton/assets/10154983/27d62a5f-356b-406c-9497-2eb4c5392019">

### Interactions and dependency flow
The below diagram shows the internal connection between the projects. These are some important points:

- Only the **OrchestatorApp** project is an App project type, the rest of projects are Framework types. 
- The **OrchestatorApp** project is responsible for injecting all required dependencies and bootstrapping the initial view from the **UI** project.  
- There is no direct connection between the **UI** layer and the Data layer.

  ![image](https://github.com/arielc387/MVVMSkeleton/assets/10154983/45671c30-59c8-4a0a-a08f-66dc40b5f0d1)

### Instalation

1. The project uses CocoaPods as dependency manager.

```
$ cd <root_project>
$ pod install
```

2. Update API Key for API Ninjas

   Navigate to */Domain/Domain/Enums/AppConfig.swift* and update the API key value in ``` public var apiKey: String ```.


### Contributing
Just make pull request. You are in!
