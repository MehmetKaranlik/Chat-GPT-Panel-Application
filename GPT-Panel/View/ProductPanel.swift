//
//  ProductPanel.swift
//  GPT-Panel
//
//  Created by mehmet karanlık on 22.04.2023.
//

import AppKit
import Foundation

class ProductPanel: NSPanel {
   init(rect: CGRect) {
      super.init(
         contentRect: rect,
         styleMask: [
            .titled,
            .resizable,
            .borderless,
            .fullSizeContentView,
            .closable,
            .utilityWindow,
            .nonactivatingPanel,

         ],
         backing: .buffered, defer: false
      )
      contentViewController = ExpandedViewController()
      isFloatingPanel = true
      titlebarAppearsTransparent = true
      titleVisibility = .hidden
      standardWindowButton(.zoomButton)?.isHidden = true
      standardWindowButton(.miniaturizeButton)?.isHidden = true
   }
}
