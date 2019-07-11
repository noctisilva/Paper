//
//  AppDelegate.swift
//  Albert_iOSChallenge
//
//  Created by Tae Hong Min on 7/9/19.
//  Copyright © 2019 taehongmin. All rights reserved.
//

// Enjoy!

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        

        window = UIWindow(frame:UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = setTabbar() //Used to set the tab navigation
        return true
    }

    //Semi-Custom UITabBarController
    func setTabbar() -> UITabBarController {
        let tabbarcntrl = UITabBarController()

        // all viewcontroller embedded navigationbar
        let homeNAV = UINavigationController(rootViewController: PaperViewController())
        let wishNAV = UINavigationController(rootViewController: WishlistViewController())
        

        tabbarcntrl.viewControllers = [homeNAV,wishNAV]
        
        let tabbar = tabbarcntrl.tabBar
        tabbar.barTintColor = UIColor.white
        tabbar.backgroundColor =  UIColor.white
        tabbar.tintColor = UIColor(red: 43/255, green: 180/255, blue: 0/255, alpha: 1)
        
        //Defining the tab icons
        let tabHome = tabbar.items![0]
        tabHome.image = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabHome.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        tabHome.selectedImage = UIImage(named: "search_gray")?.withRenderingMode(.alwaysOriginal)
        
        let tabFoll = tabbar.items![1]
        tabFoll.image = UIImage(named: "wish")?.withRenderingMode(.alwaysOriginal)
        tabFoll.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        tabFoll.selectedImage = UIImage(named: "wish_gray")?.withRenderingMode(.alwaysOriginal)
        
        tabbarcntrl.selectedIndex = 0
        return tabbarcntrl
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Albert_iOSChallenge")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

