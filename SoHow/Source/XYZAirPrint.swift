
//
//  XYZAirPrint.swift
//  SoHow
//
//  Created by 张子豪 on 2019/6/14.
//  Copyright © 2019 张子豪. All rights reserved.
//

import UIKit

public class XYZAirPrint: NSObject {
    
    public static func PrintPageX(URL:URL?,delegate:UIPrintInteractionControllerDelegate,jobName:String = "XYZManager AirPrint") {
        let controller = UIPrintInteractionController.shared
        let completionHandler : UIPrintInteractionController.CompletionHandler = {printController,completed,error in
            if !completed ,let error = error {print("FAILED! Error is \(error)")}
        }
        controller.delegate = delegate
        let printInfo = UIPrintInfo.printInfo()
        printInfo.outputType = .general
        printInfo.jobName = jobName
        printInfo.orientation = .portrait
        printInfo.duplex = .longEdge
        controller.printInfo = printInfo
        controller.showsNumberOfCopies = true
        // print(UIPrintInteractionController.printableUTIs)
        guard let pdfURLX = URL else{ print("路径不可打印"); return}
        let canprintX = UIPrintInteractionController.canPrint(pdfURLX);print(canprintX)
        controller.printingItems = [pdfURLX]
        controller.present(animated: true, completionHandler: completionHandler)
    }
}
//func printText2() {
//
//    guard let pdfURLX = Bundle.main.url(forResource: "demo", withExtension: "pdf") else{
//        return
//    }
//
//    print(UIPrintInteractionController.printableUTIs)
//
//    let canprintX = UIPrintInteractionController.canPrint(pdfURLX)
//
//    print(canprintX)
//
//    let items = [pdfURLX]
//
//
//    let printController = UIPrintInteractionController.shared
//    // 打印任务相关信息
//    // 打印任务相关信息
//    let printInfo = UIPrintInfo(dictionary:nil)
//    printInfo.outputType = .general
//    printInfo.jobName = "my print Job"
//    printController.printInfo = printInfo
//
//
//    printController.printingItem = items
//
//
//    //设置打印文本
//    //        let printText = "<div style='font-size:28px;font-weight:bold;text-align:center'>"
//    //            + "hangge.com</div>"
//    //            + "做最好的开发者知识平台"
//
//    // 格式化打印文本
//    //        let formatter = UIMarkupTextPrintFormatter(markupText: printText)
//    //        // 设置页面Insets边距
//    //        formatter.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
//
//
//    //        let formX = UIPrintFormatter()
//    //        formX.perPageContentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
//    //        printController.printFormatter = formX
//    //        printController.
//    //
//    printController.present(animated: true, completionHandler: nil)
//
//}





//func printText() {
//    // 打印控制器
//    let printController = UIPrintInteractionController.shared
//    // 打印任务相关信息
//    let printInfo = UIPrintInfo(dictionary:nil)
//    printInfo.outputType = .general
//    printInfo.jobName = "my print Job"
//    printController.printInfo = printInfo
//
//    //设置打印文本
//    let printText = "<div style='font-size:28px;font-weight:bold;text-align:center'>"
//        + "hangge.com</div>"
//        + "做最好的开发者知识平台"
//
//    // 格式化打印文本
//    let formatter = UIMarkupTextPrintFormatter(markupText: printText)
//    // 设置页面Insets边距
//    formatter.contentInsets = UIEdgeInsets(top: 72, left: 72, bottom: 72, right: 72)
//    printController.printFormatter = formatter
//
//    // 提供打印界面让用户选择打印机和副本的数量
//    printController.present(animated: true, completionHandler: nil)
//}
//
//func showActivitySheet() {
//    //        let renderer = PDFRenderController(document: document, controllers: [
//    //            annotationController,
//    //            formController
//    //            ])
//    //        let pdf = renderer.renderOntoPDF()
//
//    let pdfURLX = Bundle.main.url(forResource: "demo", withExtension: "pdf")
//
//    let items = [pdfURLX]
//    let activityVC = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
//    //        activityVC.excludedActivityTypes = [.print]
//    let excludedActivities = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToWeibo, UIActivity.ActivityType.message, UIActivity.ActivityType.mail,  UIActivity.ActivityType.copyToPasteboard, UIActivity.ActivityType.assignToContact, UIActivity.ActivityType.saveToCameraRoll, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.postToTencentWeibo]
//    activityVC.excludedActivityTypes = excludedActivities
//    activityVC.popoverPresentationController?.sourceRect = CGRect(x: 4.0, y: 0.0, width: 1.0, height: 1.0)
//    activityVC.popoverPresentationController?.sourceView = self.view
//    activityVC.userActivity = .none
//
//    present(activityVC, animated: true, completion: nil)
//}
//
//
//
//var printerURLShared:URL? = nil
//
//func selectPrinterPicker()  {
//    let pickerController = UIPrinterPickerController(initiallySelectedPrinter: nil)
//    let rect :CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
//    pickerController.present(from: rect, in: self.view, animated: true) { (controller, userDidSelect, err) in
//        if userDidSelect{
//            let printerURL = controller.selectedPrinter?.url
//            print("printerURL",printerURL as Any)
//            self.printerURLShared = printerURL!
//            let printerDisplayName = controller.selectedPrinter?.displayName
//            print("printerDisplayName",printerDisplayName)
//
//
//
//
//        }
//    }
//
//}
//
//
//func PrintPageX() {
//    let controller = UIPrintInteractionController.shared
//
//    let completionHandler : UIPrintInteractionController.CompletionHandler = {printController,completed,error in
//
//        if !completed ,let error = error {
//            print("FAILED! Error is \(error)")
//        }
//
//
//    }
//
//    let printInfo = UIPrintInfo.printInfo()
//    printInfo.outputType = .general
//    printInfo.jobName = "XYZManager AirPrint"
//    printInfo.orientation = .portrait
//    printInfo.duplex = .longEdge
//
//    controller.printInfo = printInfo
//
//
//    controller.showsNumberOfCopies = true
//
//    guard let pdfURLX = Bundle.main.url(forResource: "demo", withExtension: "pdf") else{
//        return
//    }
//    let items = [pdfURLX]
//    controller.printingItems = items
//
//
//    //        print(UIPrintInteractionController.printableUTIs)
//
//    let canprintX = UIPrintInteractionController.canPrint(pdfURLX)
//
//    print(canprintX)
//

//
////打印网页
//

//
//
//
//}
