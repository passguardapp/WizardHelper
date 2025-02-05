#if os(iOS)
import UIKit
/**
 * VC ext
 */
extension UIViewController {
    /**
      * Returns the top-most `UIViewController` in the view controller hierarchy.
      * This function searches from the key window's root view controller and returns the top-most presented view controller.
      * - Returns: The top-most `UIViewController` in the view controller hierarchy.
      */
      internal static func topMostController() -> UIViewController? {
         guard let keyWindow = UIApplication.shared.connectedScenes
                  .compactMap({ $0 as? UIWindowScene })
                  .flatMap({ $0.windows })
                  .first(where: { $0.isKeyWindow }) else {
            return nil
         }
         
         var topController: UIViewController? = keyWindow.rootViewController
         while let presentedVC = topController?.presentedViewController {
            topController = presentedVC
         }
         return topController
      }
   /**
    * Returns the top most UIViewController in the view controller hierarchy.
    * This function searches from the root view controller and returns the top most view controller.
    * - Returns: The top most UIViewController in the view controller hierarchy.
    * - Fixme: ⚠️️ ask copilot to improve this code
    * ## Examples:
    * UIViewCOntroller.topMostController()?.view.backgroundColor = .green
    */
   // internal static func topMostController() -> UIViewController? {
   //    var topController: UIViewController? = rootVC /*was .keyWindow, but that is deprecated*/
   //    // Set the initial top controller to the root view controller
   //    while let presentedVC = topController?.presentedViewController {
   //       // If there is a presented view controller, set it as the new top controller
   //       topController = presentedVC
   //    }
   //    // If there are no more presented view controllers, return the top controller
   //    return topController
   // }
   /**
    * Returns the root view controller of the app.
    * This function gets the window from the app delegate and returns the root view controller.
    * - Fixme: ⚠️️ ask copilot to improve this code
    * - Returns: The root view controller of the app.
    */
   // private static var rootVC: UIViewController? {
   //    // Get the window from the app delegate
   //    guard let window = UIApplication.shared.delegate?.window, let win = window else { return nil }
   //    // Return the presented view controller if there is one, otherwise return the root view controller
   //    return win.rootViewController?.presentedViewController ?? win.rootViewController
   // }
}
 /**
   * A computed property that returns the root view controller of the key window.
   * - Note: Supports multiple scenes and better integration with SwiftUI.
   */
internal var rootController: UIViewController? {
      UIApplication.shared.connectedScenes
         .compactMap { $0 as? UIWindowScene }
         .flatMap { $0.windows }
         .first(where: { $0.isKeyWindow })?.rootViewController
}
/**
 * rootController (better support for SwiftUI)
 * - Description: A RootController variable that can be accessed from anywhere
 * - Fixme: ⚠️️ ask copilot to improve this code
 */
// internal var rootController: UIViewController? {
//    let keyWin = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene } .flatMap { $0.windows } .first { $0.isKeyWindow }
//    var root = keyWin?.rootViewController
//    while let presentedViewController = root?.presentedViewController {
//       root = presentedViewController
//    }
//    return root
// }
#endif
