//
//  PageViewController.swift
//  w6d5
//
//  Created by Roland on 2017-12-13.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    // MARK: - Private properties
    var onboardingScreens = [UIViewController]()
}

// MARK: - UIViewController methods
extension PageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get onboarding view controllers from storyboard
        guard let onboardingScreen1 = storyboard?.instantiateViewController(withIdentifier: "OnboardingScreen1"), let onboardingScreen2 = storyboard?.instantiateViewController(withIdentifier: "OnboardingScreen2"), let onboardingScreen3 = storyboard?.instantiateViewController(withIdentifier: "OnboardingScreen3") else {
            assertionFailure("Unable to instantiate onboarding screens from storyboard.")
            return
        }
        
        // Populate onboarding screens array
        onboardingScreens += [onboardingScreen1, onboardingScreen2, onboardingScreen3]

        // Set ourselves us data source for UIPageViewController
        self.dataSource = self

        // Load up the first view controller for page view controller
        setViewControllers([onboardingScreen1], direction: .forward, animated: false, completion: nil)
    }
}

// MARK: - UIPageViewControllerDataSource methods
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Ensure there is a page before current screen
        guard let currentPageIndex = onboardingScreens.index(of: viewController), currentPageIndex > 0 else {
            return nil
        }
        return onboardingScreens[currentPageIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Ensure there is a page after current screen
        guard let currentPageIndex = onboardingScreens.index(of: viewController), currentPageIndex < (onboardingScreens.count - 1) else {
            return nil
        }
        return onboardingScreens[currentPageIndex + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return onboardingScreens.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currentOnboardingScreen = viewControllers?.first, let currentScreenIndex = onboardingScreens.index(of: currentOnboardingScreen) else {
                return 0
        }
        return currentScreenIndex
    }
}
