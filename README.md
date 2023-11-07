# SpriteKit-Integration
GitHub repo of SwiftUI-SpriteKit integration tutorial
## SpriteKit and SwiftUI Integration

SpriteKit is a powerful game development framework for creating 2D games on Apple platforms, offering features like a physics engine, animation handling, and particle systems. In this article, we will demonstrate how to integrate SpriteKit with SwiftUI using the Delegate pattern. We'll create a simple game where players control a square and score points by colliding with squares of the same color, all while avoiding different-colored squares.

### Getting Started

You can follow these steps to integrate SpriteKit with SwiftUI for your own projects, and for a more detailed example, you can refer to the full project here.

#### 1. Create a Game Scene
An SKScene object represents the content in Sprite Kit, with nodes representing all game elements.
Set up player, ally, and enemy nodes with their physics properties within the game scene.
#### 2. Handling Interactions and Collisions
Create an extension to handle touch interactions within the game scene, allowing the square to move when players drag their fingers.
Manage collision logic in the extension, implementing functions to add and subtract scores.
#### 3. Add the Game Scene to a SwiftUI View
Use a SpriteView in SwiftUI to present the game scene.
Set the frame dimensions of the SpriteView to match the game scene's width and height to prevent distortion.
#### 4. Using Delegation to Communicate Between Views
Implement the delegate pattern to update the score label located in your SwiftUI view when collisions occur.
Create a protocol that defines the required properties and methods for updating the game score.
Add a delegate property to the game scene to specify the type of the created protocol.
Create a method in the game scene that invokes the delegate to update the score.
In your SwiftUI view, conform to the protocol and incorporate the scoring logic.
With these implementations in place, the score will be automatically updated every time a collision occurs.

 ### Conclusion

The example provided in this article is basic, but the concept of delegation can be employed for various objectives in your projects. It may not always be the best solution, but it's a valuable tool for communication between components. If you want to learn more about this subject and explore other integration methods, we recommend further reading on the topic.

For a more extensive demonstration of this concept, we invite you to experience it in action by downloading "Anda Pela Sombra" on the App Store. Immerse yourself in the world of Brazilian folklore through this interactive game!
