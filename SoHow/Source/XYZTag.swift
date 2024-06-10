// 
//
//import UIKit
//
//public extension UIViewController{
//   
//   func TagToUI_View(with Tag:Int) -> UIView?{
//       return self.view.viewWithTag(Tag)
//   }
//   
//   func TagToUI_TF(with Tag:Int) -> UITextField?{
//       return self.TagToUI_View(with: Tag) as? UITextField
//   }
//   func TagToUI_BTN(with Tag:Int) -> UIButton?{
//       return self.TagToUI_View(with: Tag) as? UIButton
//   }
//   
//}
//
//
//public extension UITableViewCell{
//   
//   func TagToUI_View(with Tag:Int) -> UIView?{
//       return self.viewWithTag(Tag)
//   }
//   
//   func TagToUI_TF(with Tag:Int) -> UITextField?{
//       return self.TagToUI_View(with: Tag) as? UITextField
//   }
//   func TagToUI_BTN(with Tag:Int) -> UIButton?{
//       return self.TagToUI_View(with: Tag) as? UIButton
//   }
//   
//}
import UIKit

public extension UIViewController {
   
   // Retrieve a UIView with the specified tag from the view controller's view hierarchy.
   func TagToUI_View(with Tag: Int) -> UIView? {
       return self.view.viewWithTag(Tag)
   }
   
   // Retrieve a UITextField with the specified tag from the view controller's view hierarchy.
   func TagToUI_TF(with Tag: Int) -> UITextField? {
       return self.TagToUI_View(with: Tag) as? UITextField
   }

   // Retrieve a UIButton with the specified tag from the view controller's view hierarchy.
   func TagToUI_BTN(with Tag: Int) -> UIButton? {
       return self.TagToUI_View(with: Tag) as? UIButton
   }
   
}


public extension UITableViewCell {
   
   // Retrieve a UIView with the specified tag from the table view cell's view hierarchy.
   func TagToUI_View(with Tag: Int) -> UIView? {
       return self.viewWithTag(Tag)
   }
   
   // Retrieve a UITextField with the specified tag from the table view cell's view hierarchy.
   func TagToUI_TF(with Tag: Int) -> UITextField? {
       return self.TagToUI_View(with: Tag) as? UITextField
   }

   // Retrieve a UIButton with the specified tag from the table view cell's view hierarchy.
   func TagToUI_BTN(with Tag: Int) -> UIButton? {
       return self.TagToUI_View(with: Tag) as? UIButton
   }
   
}
