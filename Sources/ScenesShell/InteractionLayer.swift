import Foundation
import Scenes
import Igis
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {


    var snakes = [Snake(rect: Rect(size: Size(width: 25, height:25)))]
    var n = 1
    var head = 0
    var isFacing = ""

    func gridArray() {
        snakes[0].move(to: Point(x: 324, y: 102))
          //   print(snakes[0].rectangle.rect.topLeft)

        for _ in 0 ..< 30 {
              for _ in 1 ..< 50 {
                  snakes.append(Snake(rect: Rect(size: Size(width: 25, height:25))))
                  snakes[n].move(to: Point(x: snakes[n - 1].rectangle.rect.topLeft.x + 25, y: snakes[n - 1].rectangle.rect.topLeft.y))
//                print(snakes[n].rectangle.rect.topLeft)
                n += 1                  
              }
              if n != 50 * 30 {
              snakes.append(Snake(rect: Rect(size: Size(width: 25, height:25))))
              snakes[n].move(to: Point(x: snakes[0].rectangle.rect.topLeft.x, y: snakes[n - 1].rectangle.rect.topLeft.y + 25))
              //              print(snakes[n].rectangle.rect.topLeft)
              
                  n += 1
              }
          }
          for grid in 0 ..< n {
              snakes[grid].rectangle.fillMode = .stroke  
          }
          for snake in 717 ..< 720 {
              head = 720
              snakes[snake].rectangle.fillMode = .fillAndStroke
          }
    }

    

    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {

       switch key {
       case "ArrowUp":
           if isFacing != "down" {
               isFacing = "up"
           }
       case "w":
           if isFacing != "down" {
               isFacing = "up"
           }

       case "ArrowLeft":
           if isFacing != "right" {
               isFacing = "left"
           }

       case "a":
           if isFacing != "right" {
               isFacing = "left"
           }
           
       case "ArrowDown":
           if isFacing != "up" {
               isFacing = "down"
           }

       case "s":
           if isFacing != "up" {
               isFacing = "down"
           }

       case "ArrowRight":
           if isFacing != "left" {
               isFacing = "right"
           }

       case "d":
           if isFacing != "left" {
               isFacing = "right"
           }


       default:
           print("Fatal Error: not a direction key.")
       }

       print(isFacing)
            
      
    }


    
    
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor
          gridArray()

          for snake in 0 ..< snakes.count { 
              insert(entity: snakes[snake], at: .front)
              
          }
                // insert(entity: snakes[])
      }

          

     override func preSetup(canvasSize: Size, canvas: Canvas) {
         
          
                    dispatcher.registerKeyDownHandler(handler: self)
   //       dispatcher.registerKeyUpHandler(handler: self)
      }
      
      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler: self)
    //      dispatcher.unregisterKeyUpHandler(handler: self)
      }
}
