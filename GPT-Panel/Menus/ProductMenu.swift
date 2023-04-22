//
//  ProductMenu.swift
//  GPT-Panel
//
//  Created by mehmet karanlık on 22.04.2023.
//

import Cocoa
import Foundation

class ProductMenu: NSMenu {
   init() {
      super.init(title: "")
      addItem(exitItem)
      addItem(newWindowItem)
   }

   @available(*, unavailable)
   required init(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   var exitItem: NSMenuItem {
      let item = NSMenuItem()
      item.title = Constants.exit
      item.image = NSImage(systemSymbolName: Constants.exitIconName, accessibilityDescription: Constants.newWindowText)
      item.target = self
      item.action = #selector(handleApplicationTerminate)
      return item
   }

   var newWindowItem: NSMenuItem {
      let item = NSMenuItem()
      item.title = Constants.newWindowText
      item.image = NSImage(systemSymbolName: Constants.newWindowIconName, accessibilityDescription: Constants.newWindowText)
      item.target = self
      item.action = #selector(handleNewWindow)
      return item
   }
}

extension ProductMenu {
   @objc func handleApplicationTerminate() {
      NSApplication.shared.terminate(nil)
   }

   @objc func handleNewWindow() {
      let panelSize = Constants().expandedContentSize
      let rect = NSScreen.main?.topRightCorner(panelSize, padding: Constants.largePadding)
      guard rect != nil else { return }
      let panel = ProductPanel(rect: rect!)
      panel.makeKeyAndOrderFront(nil)
      panel.becomeFirstResponder()
   }
}
