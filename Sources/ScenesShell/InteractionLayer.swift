import Foundation
import Scenes
import Igis
  /*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer, KeyDownHandler {


    var snakes = [Snake(rect: Rect(size: Size(width: 25, height:25))), Snake(rect: Rect(size: Size(width: 25, height:25))), Snake(rect: Rect(size: Size(width: 25, height:25)))]


    func onKeyDown(key:String, code:String, ctrlKey:Bool, shiftKey:Bool, altKey:Bool, metaKey:Bool) {

    }
    
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor

          for snake in 0 ..< snakes.count {
              insert(entity: snakes[snake], at: .front)
          }
      }
      override func preSetup(canvasSize: Size, canvas: Canvas) {
         for snake in 0 ..< 3 {
              snakes[snake].move(to: Point(x: canvasSize.center.x - 25 * snake, y: canvasSize.center.y))
              }
              


          
          dispatcher.registerKeyDownHandler(handler: self)
   //       dispatcher.registerKeyUpHandler(handler: self)
      }

          


      
      override func postTeardown() {
          dispatcher.unregisterKeyDownHandler(handler: self)
    //      dispatcher.unregisterKeyUpHandler(handler: self)
      }
}
