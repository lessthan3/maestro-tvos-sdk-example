# Maestro tvOS SDK Example

Minimal tvOS app showing MaestroKit SDK integration.

## Files

```
Hello World/
├── Model/Core/Hello_WorldApp.swift   # SDK configuration
├── View/Core/ContentView.swift       # Panel integration
└── ViewModel/ContentViewModel.swift  # Event delegate
```

## Integration Steps

### 1. Configure SDK

```swift
MaestroManager.shared.configure(
    siteID: "your-site-id",
    jwt: "",
    maestroManagerDelegate: yourDelegate,
    maestroWorkingEnvironment: .qa,
    defaultPanel: .stats
)
```

### 2. Start Event

```swift
eventInterface = await MaestroManager.shared.userDidStartWatchingEvent(
    eventID: "your-event-id",
    delegate: self
)
```

### 3. Show Panel

```swift
MaestroPanel()
    .frame(width: 676)
```

## Run

Open `Hello World.xcodeproj` and run on Apple TV Simulator.
