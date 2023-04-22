//
//  AppDelegate.swift
//  GPT-Panel
//
//  Created by mehmet karanlık on 22.04.2023.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
   var statusItem: NSStatusItem!

   func applicationDidFinishLaunching(_ aNotification: Notification) {
      statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
      statusItem.button?.image = NSImage(named: Constants.statusBarIconName)
      NSApplication.shared.setActivationPolicy(.accessory)
      statusItem.menu = ProductMenu()
   }

   func applicationWillTerminate(_ aNotification: Notification) {
      // Insert code here to tear down your application
   }

   func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
      return true
   }
}
